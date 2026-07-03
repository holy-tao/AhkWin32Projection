#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct PREGISTERCLASSNAMEW {
    value : IntPtr

    __value {
        set {
            if (value is PREGISTERCLASSNAMEW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @returns {BOOLEAN} 
     */
    Call(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, BOOLEAN)
        return result
    }

    /**
     * A PREGISTERCLASSNAMEW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREGISTERCLASSNAMEW {
        /**
         * Creates a PREGISTERCLASSNAMEW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
