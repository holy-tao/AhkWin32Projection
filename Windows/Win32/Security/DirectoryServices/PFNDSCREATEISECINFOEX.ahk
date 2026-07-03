#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Authorization\UI\ISecurityInformation.ahk" { ISecurityInformation }
#Import ".\PFNREADOBJECTSECURITY.ahk" { PFNREADOBJECTSECURITY }
#Import ".\PFNWRITEOBJECTSECURITY.ahk" { PFNWRITEOBJECTSECURITY }

/**
 * @namespace Windows.Win32.Security.DirectoryServices
 */
export default struct PFNDSCREATEISECINFOEX {
    value : IntPtr

    __value {
        set {
            if (value is PFNDSCREATEISECINFOEX) {
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
     * @param {PWSTR} param2 
     * @param {PWSTR} param3 
     * @param {PWSTR} param4 
     * @param {Integer} param5 
     * @param {Pointer<PFNREADOBJECTSECURITY>} param7 
     * @param {Pointer<PFNWRITEOBJECTSECURITY>} param8 
     * @param {LPARAM} param9 
     * @returns {ISecurityInformation} 
     */
    Call(param0, param1, param2, param3, param4, param5, param7, param8, param9) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2
        param3 := param3 is String ? StrPtr(param3) : param3
        param4 := param4 is String ? StrPtr(param4) : param4

        result := DllCall(this.value, "ptr", param0, "ptr", param1, "ptr", param2, "ptr", param3, "ptr", param4, UInt32, param5, "ptr*", &param6 := 0, PFNREADOBJECTSECURITY, param7, PFNWRITEOBJECTSECURITY, param8, LPARAM, param9, "HRESULT")
        return ISecurityInformation(param6)
    }

    /**
     * A PFNDSCREATEISECINFOEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDSCREATEISECINFOEX {
        /**
         * Creates a PFNDSCREATEISECINFOEX pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, UInt32, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, UInt32, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
