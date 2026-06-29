#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { SysAllocString, SysFreeString, SysReallocString, SysStringLen, SysStringByteLen }

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct BSTR {
    Value : IntPtr

    __value {
        set {
            if (value is BSTR) {
                this.Value := value.Value
            }
            else {
                this.Value := value
            }
        }
    }

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    __New(Value := 0) {
        this.Value := Value
    }

    /**
     * @readonly The length of the allocated string in characters, not including the null terminator
     * @type {Integer}
     */
    length => SysStringLen(this)
    
    /**
     * @readonly The length of the allocated string in bytes, not including the null terminator
     * @type {Integer}
     */
    byteLength => SysStringByteLen(this)
    
    /**
     * Creates a new BSTR from an existing AHK string
     * @param {String | Integer} str the string to allocate, or a pointer to a string to allocate
     */
    static Alloc(str){
        return SysAllocString(str)
    }
    
    /**
     * Changes the contents of the BSTR, resizing it if necessary
     * @param {String} str the new contents of the BSTR
     */
    ReAlloc(str){
        result := SysReallocString(this, str)
        if(result == 0)
            throw MemoryError("Not enough memory to reallocate string")
    }
    
    /**
     * Gets the value of the BSTR as a native AHK string
     * @returns {String}
     */
    ToString(){
        return StrGet(this.value, this.length, "UTF-16")
    }
    

    Free() {
        ; Do nothing if the handle is invalid already
        if (this.Value != 0) {
            SysFreeString(this.Value)
            this.Value := 0
        }
    }

    /**
     * A `BSTR` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends BSTR {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this BSTR, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {BSTR.Owned}
     */
    Adopt() {
        if (this is BSTR.Owned) {
            throw TypeError("Cannot adopt an owned BSTR", -1)
        }
        owned := BSTR.Owned(this.Value)
        this.Value := 0
        return owned
    }
}
