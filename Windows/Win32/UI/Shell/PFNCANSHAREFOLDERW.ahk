#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PFNCANSHAREFOLDERW {
    value : IntPtr

    __value {
        set {
            if (value is PFNCANSHAREFOLDERW) {
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
     * @returns {HRESULT} 
     */
    Call(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := DllCall(this.value, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * A PFNCANSHAREFOLDERW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCANSHAREFOLDERW {
        /**
         * Creates a PFNCANSHAREFOLDERW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
