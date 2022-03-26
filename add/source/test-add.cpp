#include <iostream>

extern "C" {
#include "add.h"
}

int main() {
  std::cout << add(1, 2) << std::endl;
  return 0;
}
