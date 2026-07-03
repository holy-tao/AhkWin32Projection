#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_EXPAND_ENVIRONMENT_STRINGS {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_EXPAND_ENVIRONMENT_STRINGS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszSrc 
     * @returns {PWSTR} 
     */
    Call(pszSrc) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        result := DllCall(this.value, "ptr", pszSrc, PWSTR)
        return result
    }

    /**
     * A PRESUTIL_EXPAND_ENVIRONMENT_STRINGS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_EXPAND_ENVIRONMENT_STRINGS {
        /**
         * Creates a PRESUTIL_EXPAND_ENVIRONMENT_STRINGS pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => PWSTR} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR])
        }

        __Delete() => CallbackFree(this.value)
    }
}
