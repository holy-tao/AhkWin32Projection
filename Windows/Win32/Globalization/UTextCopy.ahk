#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UErrorCode.ahk" { UErrorCode }
#Import ".\UText.ahk" { UText }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTextCopy {
    value : IntPtr

    __value {
        set {
            if (value is UTextCopy) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UText>} ut 
     * @param {Integer} nativeStart 
     * @param {Integer} nativeLimit 
     * @param {Integer} nativeDest 
     * @param {Integer} move 
     * @param {Pointer<UErrorCode>} _status 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ut, nativeStart, nativeLimit, nativeDest, move, _status) {
        _statusMarshal := _status is VarRef ? "int*" : "ptr"

        DllCall(this.value, UText.Ptr, ut, Int64, nativeStart, Int64, nativeLimit, Int64, nativeDest, Int8, move, _statusMarshal, _status)
    }

    /**
     * A UTextCopy that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTextCopy {
        /**
         * Creates a UTextCopy pointer that invokes the given AHK function when called.
         * @param {Func(UText, Int64, Int64, Int64, Int8, "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UText.Ptr, Int64, Int64, Int64, Int8, "int*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
