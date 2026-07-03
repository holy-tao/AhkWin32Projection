#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.LibraryLoader
 * @charset Unicode
 */
export default struct PGET_MODULE_HANDLE_EXW {
    value : IntPtr

    __value {
        set {
            if (value is PGET_MODULE_HANDLE_EXW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpModuleName 
     * @param {Pointer<HMODULE>} phModule 
     * @returns {BOOL} 
     */
    Call(dwFlags, lpModuleName, phModule) {
        lpModuleName := lpModuleName is String ? StrPtr(lpModuleName) : lpModuleName

        result := DllCall(this.value, UInt32, dwFlags, "ptr", lpModuleName, HMODULE.Ptr, phModule, BOOL)
        return result
    }

    /**
     * A PGET_MODULE_HANDLE_EXW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_MODULE_HANDLE_EXW {
        /**
         * Creates a PGET_MODULE_HANDLE_EXW pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PWSTR, HMODULE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PWSTR, HMODULE.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
