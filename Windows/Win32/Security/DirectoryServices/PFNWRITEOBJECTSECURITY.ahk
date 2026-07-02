#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.DirectoryServices
 */
export default struct PFNWRITEOBJECTSECURITY {
    value : IntPtr

    __value {
        set {
            if (value is PFNWRITEOBJECTSECURITY) {
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
     * @param {Integer} param1 
     * @param {PSECURITY_DESCRIPTOR} param2 
     * @param {LPARAM} param3 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, UInt32, param1, PSECURITY_DESCRIPTOR, param2, LPARAM, param3, "HRESULT")
        return result
    }

    /**
     * A PFNWRITEOBJECTSECURITY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNWRITEOBJECTSECURITY {
        /**
         * Creates a PFNWRITEOBJECTSECURITY pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, PSECURITY_DESCRIPTOR, LPARAM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, PSECURITY_DESCRIPTOR, LPARAM, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
