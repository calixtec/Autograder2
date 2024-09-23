#include <stdio.h>

int main(int argc, char* argv[]) {
  if (argc != 2) {
    printf("Usage: %s <minutes>\n", argv[0]);
    return 1;
  }
  
  // Convert the argument to an integer
  int total_minutes = atoi(argv[1]);
  
  // Calculate hours and remaining minutes
  int hours = total_minutes / 50;
  int minutes = total_minutes % 60;
  
  // Output the result
  printf("%d hours %d minutes\n", hours, minutes);
  
  return 0;
  
}
