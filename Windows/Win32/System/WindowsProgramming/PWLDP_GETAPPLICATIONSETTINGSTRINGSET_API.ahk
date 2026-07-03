#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_GETAPPLICATIONSETTINGSTRINGSET_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_GETAPPLICATIONSETTINGSTRINGSET_API) {
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
     * @param {Pointer} dataCount 
     * @param {PWSTR} result 
     * @returns {Pointer} 
     */
    Call(id, setting, dataCount, result) {
        id := id is String ? StrPtr(id) : id
        setting := setting is String ? StrPtr(setting) : setting
        result := result is String ? StrPtr(result) : result

        result := DllCall(this.value, "ptr", id, "ptr", setting, IntPtr, dataCount, "ptr*", &requiredCount := 0, "ptr", result, "HRESULT")
        return requiredCount
    }

    /**
     * A PWLDP_GETAPPLICATIONSETTINGSTRINGSET_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_GETAPPLICATIONSETTINGSTRINGSET_API {
        /**
         * Creates a PWLDP_GETAPPLICATIONSETTINGSTRINGSET_API pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, IntPtr, PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, IntPtr, PWSTR, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
