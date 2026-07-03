#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.LibraryLoader
 * @charset Unicode
 */
export default struct ENUMRESLANGPROCW {
    value : IntPtr

    __value {
        set {
            if (value is ENUMRESLANGPROCW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HMODULE} _hModule 
     * @param {PWSTR} lpType 
     * @param {PWSTR} lpName 
     * @param {Integer} wLanguage 
     * @param {Pointer} _lParam 
     * @returns {BOOL} 
     */
    Call(_hModule, lpType, lpName, wLanguage, _lParam) {
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall(this.value, HMODULE, _hModule, "ptr", lpType, "ptr", lpName, UInt16, wLanguage, IntPtr, _lParam, BOOL)
        return result
    }

    /**
     * A ENUMRESLANGPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ENUMRESLANGPROCW {
        /**
         * Creates a ENUMRESLANGPROCW pointer that invokes the given AHK function when called.
         * @param {Func(HMODULE, PWSTR, PWSTR, UInt16, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HMODULE, PWSTR, PWSTR, UInt16, IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
