#include ../safecall.ahk

assert "abc" == safecall(concat_3_3, "a", "b", "c")
assert "ab" ==  safecall(concat_3_3, "a", "b")
assert "a" ==   safecall(concat_3_3, "a")
assert "" ==    safecall(concat_3_3)
assert "ac" ==  safecall(concat_3_3, "a",, "c")
assert "bc" ==  safecall(concat_3_3,, "b", "c")
assert "abc" == safecall(concat_3_3, "a", "b", "c", "d")
assert "abc" == safecall(concat_3_3, "a", "b", "c", ["d", "e", "f"]*)
concat_3_3(a, b, c) {
  return a . b . c
}

assert "abc" == safecall(concat_2_3, "a", "b", "c")
assert "abz" == safecall(concat_2_3, "a", "b")
assert "az" ==  safecall(concat_2_3, "a")
assert "z" ==   safecall(concat_2_3)
assert "ac" ==  safecall(concat_2_3, "a",, "c")
assert "bc" ==  safecall(concat_2_3,, "b", "c")
assert "abc" == safecall(concat_2_3, "a", "b", "c", "d")
assert "abc" == safecall(concat_2_3, "a", "b", "c", ["d", "e", "f"]*)
concat_2_3(a, b, c := "z") {
  return a . b . c
}

assert "abc" == safecall(concat_1_3, "a", "b", "c")
assert "abz" == safecall(concat_1_3, "a", "b")
assert "ayz" == safecall(concat_1_3, "a")
assert "yz" ==  safecall(concat_1_3)
assert "ayc" == safecall(concat_1_3, "a",, "c")
assert "bc" ==  safecall(concat_1_3,, "b", "c")
assert "abc" == safecall(concat_1_3, "a", "b", "c", "d")
assert "abc" == safecall(concat_1_3, "a", "b", "c", ["d", "e", "f"]*)
concat_1_3(a, b := "y", c := "z") {
  return a . b . c
}

assert "abc" == safecall(concat_0_3, "a", "b", "c")
assert "abz" == safecall(concat_0_3, "a", "b")
assert "ayz" == safecall(concat_0_3, "a")
assert "xyz" == safecall(concat_0_3)
assert "ayc" == safecall(concat_0_3, "a",, "c")
assert "xbc" == safecall(concat_0_3,, "b", "c")
assert "abc" == safecall(concat_0_3, "a", "b", "c", "d")
assert "abc" == safecall(concat_0_3, "a", "b", "c", ["d", "e", "f"]*)
concat_0_3(a := "x", b := "y", c := "z") {
  return a . b . c
}

assert "ab" ==  safecall(concat_2_2, "a", "b")
assert "a" ==   safecall(concat_2_2, "a")
assert "" ==    safecall(concat_2_2)
assert "b" ==   safecall(concat_2_2,, "b")
assert "ab" ==  safecall(concat_2_2, "a", "b", "c")
assert "ab" ==  safecall(concat_2_2, "a", "b", ["c", "d", "e"]*)
concat_2_2(a, b) {
  return a . b
}

assert "ab" ==  safecall(concat_1_2, "a", "b")
assert "ay" ==  safecall(concat_1_2, "a")
assert "y" ==   safecall(concat_1_2)
assert "b" ==   safecall(concat_1_2,, "b")
assert "ab" ==  safecall(concat_1_2, "a", "b", "c")
assert "ab" ==  safecall(concat_1_2, "a", "b", ["c", "d", "e"]*)
concat_1_2(a, b := "y") {
  return a . b
}

assert "ab" ==  safecall(concat_0_2, "a", "b")
assert "ay" ==  safecall(concat_0_2, "a")
assert "xy" ==  safecall(concat_0_2)
assert "xb" ==  safecall(concat_0_2,, "b")
assert "ab" ==  safecall(concat_0_2, "a", "b", "c")
assert "ab" ==  safecall(concat_0_2, "a", "b", ["c", "d", "e"]*)
concat_0_2(a := "x", b := "y") {
  return a . b
}

assert "a" ==   safecall(concat_1_1, "a")
assert "" ==    safecall(concat_1_1)
assert "" ==    safecall(concat_1_1,, "b")
assert "a" ==   safecall(concat_1_1, "a", "b")
assert "a" ==   safecall(concat_1_1, "a", ["b", "c", "d"]*)
concat_1_1(a) {
  return a
}

assert "a" ==   safecall(concat_0_1, "a")
assert "x" ==   safecall(concat_0_1)
assert "x" ==   safecall(concat_0_1,, "b")
assert "a" ==   safecall(concat_0_1, "a", "b")
assert "a" ==   safecall(concat_0_1, "a", ["b", "c", "d"]*)
concat_0_1(a := "x") {
  return a
}

assert "0" ==   safecall(concat_2_v)
assert "a0" ==  safecall(concat_2_v, "a")
assert "ab0" == safecall(concat_2_v, "a", "b")
assert "ab1" == safecall(concat_2_v, "a", "b", "c")
assert "ab2" == safecall(concat_2_v, "a", "b", "c", "d")
assert "a1"  == safecall(concat_2_v, "a",, "c")
assert "a2"  == safecall(concat_2_v, "a",, "c", "d")
assert "b1"  == safecall(concat_2_v,, "b", "c")
assert "b2"  == safecall(concat_2_v,, "b", "c", "d")
assert "1"   == safecall(concat_2_v,,, "c")
assert "2"   == safecall(concat_2_v,,, "c", "d")
concat_2_v(a, b, c*) {
  return a . b . c.length
}

assert "0" ==   safecall(concat_1_v)
assert "a0" ==  safecall(concat_1_v, "a")
assert "a1" ==  safecall(concat_1_v, "a", "b")
assert "a2" ==  safecall(concat_1_v, "a", "b", "c")
assert "1" ==   safecall(concat_1_v,, "b")
assert "2" ==   safecall(concat_1_v,, "b", "c")
concat_1_v(a, b*) {
  return a . b.length
}

assert "0" ==   safecall(concat_0_v)
assert "1" ==   safecall(concat_0_v, "a")
assert "2" ==   safecall(concat_0_v, "a", "b")
concat_0_v(a*) {
  return a.length
}

/*
  Utilitary functions for testing
*/

assert(condition) {
  if not condition
    throw error("Assertion failed!", -1)
}

onExit (reason, code) => reason != "Error" ? msgBox("All tests succeeded!") : 0
