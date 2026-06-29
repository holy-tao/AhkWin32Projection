#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct PWSTR {
    value : IntPtr

    __value {
        set {
            if (value is PWSTR) {
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
     * Extracts the String pointed at by this `PWSTR` to an AutoHotkey string
     * @returns {String}
     */
    ToString() => StrGet(this.value, "UTF-16")
    
    /**
     * Creates and returns a `Buffer` containing a copy of `str` in UTF-16 encoding which can be passed
     * as an argument to functions requiring `PWSTR`s.
     * @param {String} str the string to encode
     * @param {Integer} buffLen the length of the buffer to encode the string in. If unset, the returned
     *      buffer is exactly the number of bytes required to fit `str`. This can be used if the function
     *      you intend to call will modify the string in-place.
     * @returns {Buffer} a `Buffer` containing `str` encoded in UTF-16
     */
    static Alloc(str, buffLen?) {
        if(!(str is String))
            throw TypeError("Expected a String but got a(n) " . str, , str)
    
        if(str == "")
            str := Chr(0)
    
        requiredLen := StrPut(str, "UTF-16")
        buffLen := buffLen ?? requiredLen
    
        if(buffLen < requiredLen)
            throw MemoryError(Format("String requires {1} bytes but {2} were requrested", requiredLen, buffLen))
    
        buf := Buffer(buffLen, 0)
        StrPut(str, buf, "UTF-16")
        return buf
    }
    
}
