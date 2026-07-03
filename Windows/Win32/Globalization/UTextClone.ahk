#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UErrorCode.ahk" { UErrorCode }
#Import ".\UText.ahk" { UText }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTextClone {
    value : IntPtr

    __value {
        set {
            if (value is UTextClone) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UText>} dest 
     * @param {Pointer<UText>} src 
     * @param {Integer} deep 
     * @param {Pointer<UErrorCode>} _status 
     * @returns {Pointer<UText>} 
     */
    Call(dest, src, deep, _status) {
        _statusMarshal := _status is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UText.Ptr, dest, UText.Ptr, src, Int8, deep, _statusMarshal, _status, UText.Ptr)
        return result
    }

    /**
     * A UTextClone that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTextClone {
        /**
         * Creates a UTextClone pointer that invokes the given AHK function when called.
         * @param {Func(UText, UText, Int8, "int*") => UText.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UText.Ptr, UText.Ptr, Int8, "int*", UText.Ptr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
