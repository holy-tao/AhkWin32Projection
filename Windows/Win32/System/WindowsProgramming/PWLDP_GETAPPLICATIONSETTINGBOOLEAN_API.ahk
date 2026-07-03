#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_GETAPPLICATIONSETTINGBOOLEAN_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_GETAPPLICATIONSETTINGBOOLEAN_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} id 
     * @param {PWSTR} setting 
     * @returns {BOOL} 
     */
    Call(id, setting) {
        id := id is String ? StrPtr(id) : id
        setting := setting is String ? StrPtr(setting) : setting

        result := DllCall(this.value, "ptr", id, "ptr", setting, BOOL.Ptr, &result := 0, "HRESULT")
        return result
    }

    /**
     * A PWLDP_GETAPPLICATIONSETTINGBOOLEAN_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_GETAPPLICATIONSETTINGBOOLEAN_API {
        /**
         * Creates a PWLDP_GETAPPLICATIONSETTINGBOOLEAN_API pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
