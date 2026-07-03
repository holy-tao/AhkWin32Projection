#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct PLA_CABEXTRACT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PLA_CABEXTRACT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} FileName 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(FileName, _Context) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, "ptr", FileName, _ContextMarshal, _Context)
    }

    /**
     * A PLA_CABEXTRACT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLA_CABEXTRACT_CALLBACK {
        /**
         * Creates a PLA_CABEXTRACT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
