#include <stdio.h>

int main(int argc, char *argv[]) {
    FILE *fileptr;
    char *buffer;
    long filelen;

    fileptr = fopen(argv[1], "rb");       // Open the file in binary mode
    fseek(fileptr, 0, SEEK_END);          // Jump to the end of the file
    filelen = ftell(fileptr);             // Get the current byte offset in the file
    rewind(fileptr);                      // Jump back to the beginning of the file
    buffer = (char *)malloc((filelen+1)*sizeof(char)); // Enough memory for file + \0
    fread(buffer, filelen, 1, fileptr);   // Read in the entire file

    switch(buffer[0]) {
        case '\xFF':
            if (!strncmp( buffer , "\xFF\xD8\xFF", 3 )) {
                printf("JPG");
            }
            break;
        case '\x89':
            if (!strncmp( buffer , "\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", 8 )) {
                printf("PNG");
            }
            break;
        case 'B':
            if (buffer[1] == 'M') {
                printf("BMP");
            }
            break;
    }
    
    printf("\n");
    fclose(fileptr); // Close the file
}
