#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\PFNWRITEOBJECTSECURITY.ahk" { PFNWRITEOBJECTSECURITY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Authorization\UI\ISecurityInformation.ahk" { ISecurityInformation }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PFNREADOBJECTSECURITY.ahk" { PFNREADOBJECTSECURITY }

/**
 * @namespace Windows.Win32.Security.DirectoryServices
 */
export default struct PFNDSCREATEISECINFO {
    value : IntPtr

    __value {
        set {
            if (value is PFNDSCREATEISECINFO) {
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
     * @param {Pointer<PFNREADOBJECTSECURITY>} param4 
     * @param {Pointer<PFNWRITEOBJECTSECURITY>} param5 
     * @param {LPARAM} param6 
     * @returns {ISecurityInformation} 
     */
    Call(param0, param1, param2, param4, param5, param6) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall(this.value, "ptr", param0, "ptr", param1, UInt32, param2, "ptr*", &param3 := 0, PFNREADOBJECTSECURITY, param4, PFNWRITEOBJECTSECURITY, param5, LPARAM, param6, "HRESULT")
        return ISecurityInformation(param3)
    }

    /**
     * A PFNDSCREATEISECINFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDSCREATEISECINFO {
        /**
         * Creates a PFNDSCREATEISECINFO pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
