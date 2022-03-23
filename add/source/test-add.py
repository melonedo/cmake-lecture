from ctypes import CDLL, c_int
libadd_path = r"$<TARGET_FILE:add>"
libadd = CDLL(libadd_path)
libadd.add.argtypes = [c_int, c_int]
libadd.add.restype = c_int
print(libadd.add(1,2))
