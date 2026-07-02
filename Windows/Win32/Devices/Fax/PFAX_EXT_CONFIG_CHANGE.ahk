#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_EXT_CONFIG_CHANGE {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_EXT_CONFIG_CHANGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param2Marshal := param2 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, UInt32, param0, "ptr", param1, param2Marshal, param2, UInt32, param3, "HRESULT")
        return result
    }

    /**
     * A PFAX_EXT_CONFIG_CHANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_EXT_CONFIG_CHANGE {
        /**
         * Creates a PFAX_EXT_CONFIG_CHANGE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PWSTR, "char*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PWSTR, "char*", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
