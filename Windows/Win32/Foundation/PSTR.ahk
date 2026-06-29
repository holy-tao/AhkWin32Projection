#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct PSTR {
    value : IntPtr

    __value {
        set {
            if (value is PSTR) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Extracts the String pointed at by this `PSTR` to an AutoHotkey string
     * @returns {String}
     */
    ToString() => StrGet(this.value, "UTF-8")
    
    /**
     * Creates and returns a `Buffer` containing a copy of `str` in ANSI encoding which can be passed
     * as an argument to functions requiring `PSTR`s.
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
