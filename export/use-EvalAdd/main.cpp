#include <eval_add/eval_add.h>

#include <stdio.h>

int main() {
  int out;
  if (eval_add("1+ 3 ", &out)) {
    printf("%d\n", out);
  } else {
    puts("Error!");
  }
  return 0;
}