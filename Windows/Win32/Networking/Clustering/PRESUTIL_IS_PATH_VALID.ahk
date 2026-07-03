#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_IS_PATH_VALID {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_IS_PATH_VALID) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {BOOL} 
     */
    Call(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := DllCall(this.value, "ptr", pszPath, BOOL)
        return result
    }

    /**
     * A PRESUTIL_IS_PATH_VALID that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_IS_PATH_VALID {
        /**
         * Creates a PRESUTIL_IS_PATH_VALID pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
