#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class PSTR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<Integer>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Creates and returns a `Buffer` containing a copy of `str` in ANSI encoding which can be passed
     * as an argument to functins requiring `PSTR`s.
     * @param {String} str the string to encode
     * @param {Integer} buffLen the length of the buffer to encode the string in. If unset, the returned
     *      buffer is exactly the number of bytes required to fit `str`. This can be used if the function
     *      you intend to call will modify the string in-place.
     * @returns {Buffer} a `Buffer` containing `str` encoded in ANSI  
     */
    static Alloc(str, buffLen?) {
        if(!(str is String))
            throw TypeError("Expected a String but got a(n) " . str, , str)
    
        if(str == "")
            str := Chr(0)
    
        requiredLen := StrPut(str, "CP0")
        buffLen := buffLen ?? requiredLen
    
        if(buffLen < requiredLen)
            throw MemoryError(Format("String requires {1} bytes but {2} were requrested", requiredLen, buffLen))
    
        buf := Buffer(buffLen, 0)
        StrPut(str, buf, "CP0")
        return buf
    }
}
