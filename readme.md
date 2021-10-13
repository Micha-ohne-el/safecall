# SafeCall
Call any function with any amount of arguments.

## Use-Case
Say, you wanted to make it possible for someone using your library to specify
a callback function.
More often than not, it can be useful to pass arguments to that function.
But as soon as you do that, the user of your library is required to define
corresponding parameters on their function.  
This is cumbersome, either for the user of your library, or for you.

`safecall` fixes this issue, by performing all necessary checks to ensure that
the callback is only passed the arguments it expects.
You can simply call `safecall(callback, arg1, arg2, ...)`, and only the
arguments that `callback` accepts will actually be passed.

## Usage
```ahk
result := safecall(function, args*)
```
*   `result`: The return value of the function call.
*   `function`: The function you want to call.  
    This *must* pass `function is Func`, otherwise a `valueError` is thrown.
*   `args`: Any arguments you want to pass to `function`.

Excessive arguments are discarded.
Missing but required arguments are filled with `""`.
Missing and optional arguments are not touched, their default value, as defined
in the function definition, is respected.
Variadic functions are supported.

### Adding this to `Func.prototype`
If you want a more ‘integrated’ feeling, you can add this function to the
prototype of all `Func` objects, meaning you can call it like this:
`myFunction.safecall(myArg1, myArg2, ...)`

To do this, add this line to your script:
```ahk
Func.prototype.defineProp("safecall", {call: safecall})
```

## Performance
The entirety of `safecall` is only 10 SLOC (5 semicolons if AHK had those),
but its algorithm is not optimal for a lot of repeated calls.
No caching is done.

## License
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
