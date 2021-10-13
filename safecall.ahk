safecall(function, args*) {
  if not function is Func
    throw valueError("Parameter #1 (function) must be of type Func.", -1)

  ; Set the args array length to the correct value:
  if function.isVariadic
    args.length := max(args.length, function.minParams)
  else
    args.length := min(max(args.length, function.minParams), function.maxParams)

  ; Replace all empty spots with empty strings, except for optional parameters:
  ; (This is important to catch empty spots in the middle of args.)
  for index, _ in args
    if not args.has(index) and not function.isOptional(index)
      args[index] := ""

  return function(args*)
}
