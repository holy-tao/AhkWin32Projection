#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PFNREADOBJECTSECURITY.ahk" { PFNREADOBJECTSECURITY }
#Import ".\PFNWRITEOBJECTSECURITY.ahk" { PFNWRITEOBJECTSECURITY }
#Import "..\..\UI\Controls\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }

/**
 * @namespace Windows.Win32.Security.DirectoryServices
 */
export default struct PFNDSCREATESECPAGE {
    value : IntPtr

    __value {
        set {
            if (value is PFNDSCREATESECPAGE) {
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
     * @param {PWSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<HPROPSHEETPAGE>} param3 
     * @param {Pointer<PFNREADOBJECTSECURITY>} param4 
     * @param {Pointer<PFNWRITEOBJECTSECURITY>} param5 
     * @param {LPARAM} param6 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall(this.value, "ptr", param0, "ptr", param1, UInt32, param2, HPROPSHEETPAGE.Ptr, param3, PFNREADOBJECTSECURITY, param4, PFNWRITEOBJECTSECURITY, param5, LPARAM, param6, "HRESULT")
        return result
    }

    /**
     * A PFNDSCREATESECPAGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDSCREATESECPAGE {
        /**
         * Creates a PFNDSCREATESECPAGE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32, HPROPSHEETPAGE, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, HPROPSHEETPAGE.Ptr, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
