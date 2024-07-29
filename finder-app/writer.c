#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

// usage example: writer.sh /tmp/aesd/assignment1/sample.txt ios

int main(int argc, char *argv[]) {
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    // Check for the correct number of arguments
    int expected_args = 3;
    if (argc != expected_args) {
        syslog(LOG_ERR, "Usage: %s <file_path> <string_to_write>", argv[0]);
        closelog();
        return EXIT_FAILURE;
    }

    const char *file_path = argv[1];
    const char *string_to_write = argv[2];

    syslog(LOG_DEBUG, "Writing %s to %s", string_to_write, file_path);

    int fd = creat(file_path, 0644);
    if (fd == -1) {
        syslog(LOG_ERR, "Failed to open file: %s", file_path);
        closelog();
        return EXIT_FAILURE;
    }

    ssize_t bytes_written = write(fd, string_to_write, strlen(string_to_write));
    if (bytes_written == -1) {
        syslog(LOG_ERR, "Failed to write to file: %s", file_path);
        close(fd);
        closelog();
        return EXIT_FAILURE;
    }

    if (close(fd) == -1) {
        syslog(LOG_ERR, "Failed to close file: %s", file_path);
        closelog();
        return EXIT_FAILURE;
    }

    syslog(LOG_INFO, "Successfully wrote to file: %s", file_path);

    closelog();

    return EXIT_SUCCESS;
}