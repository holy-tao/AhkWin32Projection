#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_DUP_STRING {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_DUP_STRING) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszInString 
     * @returns {PWSTR} 
     */
    Call(pszInString) {
        pszInString := pszInString is String ? StrPtr(pszInString) : pszInString

        result := DllCall(this.value, "ptr", pszInString, PWSTR)
        return result
    }

    /**
     * A PRESUTIL_DUP_STRING that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_DUP_STRING {
        /**
         * Creates a PRESUTIL_DUP_STRING pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => PWSTR} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
