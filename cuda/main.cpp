#include <iostream>
#include "calculate.h"

int main() {
  float maxError = calculate(1 << 20);
  std::cout << "Max error: " << maxError << std::endl;
  return 0;
}
