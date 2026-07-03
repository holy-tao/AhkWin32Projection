#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PFNSHOWSHAREFOLDERUIW {
    value : IntPtr

    __value {
        set {
            if (value is PFNSHOWSHAREFOLDERUIW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    Call(hwndParent, pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := DllCall(this.value, HWND, hwndParent, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * A PFNSHOWSHAREFOLDERUIW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSHOWSHAREFOLDERUIW {
        /**
         * Creates a PFNSHOWSHAREFOLDERUIW pointer that invokes the given AHK function when called.
         * @param {Func(HWND, PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, PWSTR, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
