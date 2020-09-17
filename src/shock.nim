import tables, random, os, strutils

type
  Convert = object
    tags: seq[string]
    val: string

const
  version = "v1"
  tagArithmeticExpansion = "arithmetic"
  tagQuoting = "quoting"
  converters = {
    "0": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[]"),
    ],
    "1": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$]"),
    ],
    "2": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$+$$/$$]"),
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$<<$$/$$]"),
    ],
    "3": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$+$$/$$+$$/$$]"),
    ],
    "4": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$+$$/$$+$$/$$+$$/$$]"),
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$<<$$/$$<<$$/$$]"),
    ],
    "5": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$+$$/$$+$$/$$+$$/$$+$$/$$]"),
    ],
    "6": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$]"),
    ],
    "7": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$]"),
      Convert(tags: @[tagArithmeticExpansion], val: "$[$[]$[$$/$$]$[]-$$/$$]"),
    ],
    "8": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$]"),
      Convert(tags: @[tagArithmeticExpansion], val: "$[$[]$[$$/$$]$[]]"),
    ],
    "9": @[
      Convert(tags: @[tagArithmeticExpansion], val: "$[$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$+$$/$$]"),
      Convert(tags: @[tagArithmeticExpansion], val: "$[$[]$[$$/$$]$[]+$$/$$]"),
    ],
    "A": @[
      Convert(tags: @[tagQuoting], val: "$'\\101'"),
    ],
    "B": @[
      Convert(tags: @[tagQuoting], val: "$'\\102'"),
    ],
    "C": @[
      Convert(tags: @[tagQuoting], val: "$'\\103'"),
    ],
    "D": @[
      Convert(tags: @[tagQuoting], val: "$'\\104'"),
    ],
    "E": @[
      Convert(tags: @[tagQuoting], val: "$'\\105'"),
    ],
    "F": @[
      Convert(tags: @[tagQuoting], val: "$'\\106'"),
    ],
    "G": @[
      Convert(tags: @[tagQuoting], val: "$'\\107'"),
    ],
    "H": @[
      Convert(tags: @[tagQuoting], val: "$'\\110'"),
    ],
    "I": @[
      Convert(tags: @[tagQuoting], val: "$'\\111'"),
    ],
    "J": @[
      Convert(tags: @[tagQuoting], val: "$'\\112'"),
    ],
    "K": @[
      Convert(tags: @[tagQuoting], val: "$'\\113'"),
    ],
    "L": @[
      Convert(tags: @[tagQuoting], val: "$'\\114'"),
    ],
    "M": @[
      Convert(tags: @[tagQuoting], val: "$'\\115'"),
    ],
    "N": @[
      Convert(tags: @[tagQuoting], val: "$'\\116'"),
    ],
    "O": @[
      Convert(tags: @[tagQuoting], val: "$'\\117'"),
    ],
    "P": @[
      Convert(tags: @[tagQuoting], val: "$'\\120'"),
    ],
    "Q": @[
      Convert(tags: @[tagQuoting], val: "$'\\121'"),
    ],
    "R": @[
      Convert(tags: @[tagQuoting], val: "$'\\122'"),
    ],
    "S": @[
      Convert(tags: @[tagQuoting], val: "$'\\123'"),
    ],
    "T": @[
      Convert(tags: @[tagQuoting], val: "$'\\124'"),
    ],
    "U": @[
      Convert(tags: @[tagQuoting], val: "$'\\125'"),
    ],
    "V": @[
      Convert(tags: @[tagQuoting], val: "$'\\126'"),
    ],
    "W": @[
      Convert(tags: @[tagQuoting], val: "$'\\127'"),
    ],
    "X": @[
      Convert(tags: @[tagQuoting], val: "$'\\130'"),
    ],
    "Y": @[
      Convert(tags: @[tagQuoting], val: "$'\\131'"),
    ],
    "Z": @[
      Convert(tags: @[tagQuoting], val: "$'\\132'"),
    ],
    "a": @[
      Convert(tags: @[tagQuoting], val: "$'\\141'"),
    ],
    "b": @[
      Convert(tags: @[tagQuoting], val: "$'\\142'"),
    ],
    "c": @[
      Convert(tags: @[tagQuoting], val: "$'\\143'"),
    ],
    "d": @[
      Convert(tags: @[tagQuoting], val: "$'\\144'"),
    ],
    "e": @[
      Convert(tags: @[tagQuoting], val: "$'\\145'"),
    ],
    "f": @[
      Convert(tags: @[tagQuoting], val: "$'\\146'"),
    ],
    "h": @[
      Convert(tags: @[tagQuoting], val: "$'\\150'"),
    ],
    "i": @[
      Convert(tags: @[tagQuoting], val: "$'\\151'"),
    ],
    "j": @[
      Convert(tags: @[tagQuoting], val: "$'\\152'"),
    ],
    "k": @[
      Convert(tags: @[tagQuoting], val: "$'\\153'"),
    ],
    "l": @[
      Convert(tags: @[tagQuoting], val: "$'\\154'"),
    ],
    "m": @[
      Convert(tags: @[tagQuoting], val: "$'\\155'"),
    ],
    "n": @[
      Convert(tags: @[tagQuoting], val: "$'\\156'"),
    ],
    "o": @[
      Convert(tags: @[tagQuoting], val: "$'\\157'"),
    ],
    "p": @[
      Convert(tags: @[tagQuoting], val: "$'\\160'"),
    ],
    "q": @[
      Convert(tags: @[tagQuoting], val: "$'\\161'"),
    ],
    "r": @[
      Convert(tags: @[tagQuoting], val: "$'\\162'"),
    ],
    "s": @[
      Convert(tags: @[tagQuoting], val: "$'\\163'"),
    ],
    "t": @[
      Convert(tags: @[tagQuoting], val: "$'\\164'"),
    ],
    "u": @[
      Convert(tags: @[tagQuoting], val: "$'\\165'"),
    ],
    "v": @[
      Convert(tags: @[tagQuoting], val: "$'\\166'"),
    ],
    "w": @[
      Convert(tags: @[tagQuoting], val: "$'\\167'"),
    ],
    "x": @[
      Convert(tags: @[tagQuoting], val: "$'\\170'"),
    ],
    "y": @[
      Convert(tags: @[tagQuoting], val: "$'\\171'"),
    ],
    "z": @[
      Convert(tags: @[tagQuoting], val: "$'\\172'"),
    ],
  }.toTable

proc simpleConvert(text: string): string =
  for ch in text:
    result.add converters[$ch].sample.val

proc simpleConvert(num: int): string =
  simpleConvert($num)

proc questionPath(path: string): string =
  if path.len < 1: return
  path[0] & "?".repeat(path[1..^1].len)

proc indexOfPathnameExpansion(ch: char, path: string): int =
  for p in walkPattern(path):
    if ch in p:
      return
    inc result

proc bashExpansionStringToGetChar(path: string, ch: char, varLen: int): (string, string) =
  let pathStr = path.questionPath
  let i = indexOfPathnameExpansion(ch, pathStr)
  let chIdx = path.find(ch)
  let varName = "_".repeat(varLen)
  let varDef = varName & "=(" & pathStr & ");"
  let exp = "${" & varName & "[" & i.simpleConvert & "]:" & chIdx.simpleConvert & ":$[$$/$$]}"
  result = (varDef, exp)

proc shock(useEcho = false, tags: seq[string] = @[], args: seq[string]): int =
  for arg in args:
    var varDef: string
    var varLen = 2
    var s: string
    if useEcho:
      s.add "echo "
    for ch in arg:
      var found: bool
      if ch in 'a'..'z':
        for path in walkPattern("/*"):
          if ch in path:
            let (defStr, exp) = bashExpansionStringToGetChar(path, ch, varLen)
            varDef.add defStr
            s.add exp
            inc varLen
            found = true
            break

      if not found:
        s.add converters[$ch].sample.val
    echo varDef & s

when isMainModule and not defined modeTest:
  import cligen
  clCfg.version = version
  dispatch(shock, short = {"useEcho":'e'})
