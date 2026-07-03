#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_ENUM_DEVICE_ID_SOURCE.ahk" { FAX_ENUM_DEVICE_ID_SOURCE }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_EXT_SET_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_EXT_SET_DATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HINSTANCE} param0 
     * @param {Integer} param1 
     * @param {FAX_ENUM_DEVICE_ID_SOURCE} param2 
     * @param {PWSTR} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Integer} param5 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param3 := param3 is String ? StrPtr(param3) : param3

        param4Marshal := param4 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, HINSTANCE, param0, UInt32, param1, FAX_ENUM_DEVICE_ID_SOURCE, param2, "ptr", param3, param4Marshal, param4, UInt32, param5, UInt32)
        return result
    }

    /**
     * A PFAX_EXT_SET_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_EXT_SET_DATA {
        /**
         * Creates a PFAX_EXT_SET_DATA pointer that invokes the given AHK function when called.
         * @param {Func(HINSTANCE, UInt32, FAX_ENUM_DEVICE_ID_SOURCE, PWSTR, "char*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HINSTANCE, UInt32, FAX_ENUM_DEVICE_ID_SOURCE, PWSTR, "char*", UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
