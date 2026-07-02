#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_ENUM_DEVICE_ID_SOURCE.ahk" { FAX_ENUM_DEVICE_ID_SOURCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_EXT_GET_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_EXT_GET_DATA) {
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
     * @param {FAX_ENUM_DEVICE_ID_SOURCE} param1 
     * @param {PWSTR} param2 
     * @param {Pointer<Pointer<Integer>>} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4) {
        param2 := param2 is String ? StrPtr(param2) : param2

        param3Marshal := param3 is VarRef ? "ptr*" : "ptr"
        param4Marshal := param4 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, param0, FAX_ENUM_DEVICE_ID_SOURCE, param1, "ptr", param2, param3Marshal, param3, param4Marshal, param4, UInt32)
        return result
    }

    /**
     * A PFAX_EXT_GET_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_EXT_GET_DATA {
        /**
         * Creates a PFAX_EXT_GET_DATA pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, FAX_ENUM_DEVICE_ID_SOURCE, PWSTR, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, FAX_ENUM_DEVICE_ID_SOURCE, PWSTR, "ptr*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
