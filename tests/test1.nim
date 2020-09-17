import unittest

include shock

suite "proc questionPath":
  test "/media == /?????":
    check "/?????" == "/media".questionPath
  test "/ == /":
    check "/" == "/".questionPath
  test "'' == ''":
    check "" == "".questionPath
