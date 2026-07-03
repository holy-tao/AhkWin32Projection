#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.DirectoryServices
 */
export default struct PFNDSEDITSECURITY {
    value : IntPtr

    __value {
        set {
            if (value is PFNDSEDITSECURITY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {PWSTR} param1 
     * @param {PWSTR} param2 
     * @param {Integer} param3 
     * @param {PWSTR} param4 
     * @param {Pointer<PFNREADOBJECTSECURITY>} param5 
     * @param {Pointer<PFNWRITEOBJECTSECURITY>} param6 
     * @param {LPARAM} param7 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2
        param4 := param4 is String ? StrPtr(param4) : param4

        result := DllCall(this.value, HWND, param0, "ptr", param1, "ptr", param2, UInt32, param3, "ptr", param4, "ptr", param5, "ptr", param6, LPARAM, param7, "HRESULT")
        return result
    }

    /**
     * A PFNDSEDITSECURITY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDSEDITSECURITY {
        /**
         * Creates a PFNDSEDITSECURITY pointer that invokes the given AHK function when called.
         * @param {Func(HWND, PWSTR, PWSTR, UInt32, PWSTR, "ptr", "ptr", LPARAM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, PWSTR, PWSTR, UInt32, PWSTR, "ptr", "ptr", LPARAM, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
