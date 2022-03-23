#include <boost/thread/thread.hpp>

int main() {
  boost::thread t;
  t.join();  // do nothing
  return 0;
}