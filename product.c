#include <stdio.h>

int main(int argc, char* argv[]) {
  
  if (argc != 2) {
    printf("Usage: %s <path_to_file>\n", argv[0]);
    return 1;
  }
  
  FILE *file = fopen(argv[1], "r");
  if (file == NULL) {
    printf("Could not open file %s\n", argv[1]);
    return 1;
  }
  
  int numbers[11];
  int sum = 0;
  int product = 1;
  
  // Reading numbers from the file
  for (int i = 0; i < 10; i++) {
    if (fscanf(file, "%d", &numbers[i]) != 1) {
      printf("Error reading number from file\n");
      fclose(file);
      return 1;
    }
    sum += numbers[i];
    product *= numbers[i];
  }
  
  // Closing the file
  fclose(file);
  
  // Output the results
  printf("Sum: %d\n", sum);
  printf("Product: %d\n", product);
  
  return 0;
  
}
