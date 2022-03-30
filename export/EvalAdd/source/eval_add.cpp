#include <boost/regex.hpp>
#include <cstdlib>

#include "eval_add/eval_add.h"

using namespace boost;

const regex re(R"(\s*(\d+)\s*\+\s*(\d+)\s*)");

bool eval_add(const char *str, int *out) {
  cmatch match;
  if (regex_match(str, match, re)) {
    *out = stoi(match[1].str()) + stoi(match[2].str());
    return true;
  } else {
    return false;
  }
}
