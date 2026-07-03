#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
export default struct SSL_EMPTY_CACHE_FN_W {
    value : IntPtr

    __value {
        set {
            if (value is SSL_EMPTY_CACHE_FN_W) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {Integer} dwFlags 
     * @returns {BOOL} 
     */
    Call(pszTargetName, dwFlags) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := DllCall(this.value, "ptr", pszTargetName, UInt32, dwFlags, BOOL)
        return result
    }

    /**
     * A SSL_EMPTY_CACHE_FN_W that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SSL_EMPTY_CACHE_FN_W {
        /**
         * Creates a SSL_EMPTY_CACHE_FN_W pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
