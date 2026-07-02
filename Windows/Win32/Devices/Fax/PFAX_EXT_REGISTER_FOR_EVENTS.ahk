#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFAX_EXT_CONFIG_CHANGE.ahk" { PFAX_EXT_CONFIG_CHANGE }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\FAX_ENUM_DEVICE_ID_SOURCE.ahk" { FAX_ENUM_DEVICE_ID_SOURCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_EXT_REGISTER_FOR_EVENTS {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_EXT_REGISTER_FOR_EVENTS) {
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
     * @param {Pointer<PFAX_EXT_CONFIG_CHANGE>} param4 
     * @returns {HANDLE} 
     */
    Call(param0, param1, param2, param3, param4) {
        param3 := param3 is String ? StrPtr(param3) : param3

        result := DllCall(this.value, HINSTANCE, param0, UInt32, param1, FAX_ENUM_DEVICE_ID_SOURCE, param2, "ptr", param3, PFAX_EXT_CONFIG_CHANGE, param4, HANDLE.Owned)
        return result
    }

    /**
     * A PFAX_EXT_REGISTER_FOR_EVENTS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_EXT_REGISTER_FOR_EVENTS {
        /**
         * Creates a PFAX_EXT_REGISTER_FOR_EVENTS pointer that invokes the given AHK function when called.
         * @param {Func(HINSTANCE, UInt32, FAX_ENUM_DEVICE_ID_SOURCE, PWSTR, PFAX_EXT_CONFIG_CHANGE) => HANDLE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HINSTANCE, UInt32, FAX_ENUM_DEVICE_ID_SOURCE, PWSTR, PFAX_EXT_CONFIG_CHANGE, HANDLE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
