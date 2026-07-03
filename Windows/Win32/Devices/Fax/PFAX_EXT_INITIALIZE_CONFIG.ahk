#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_EXT_INITIALIZE_CONFIG {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_EXT_INITIALIZE_CONFIG) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PFAX_EXT_GET_DATA>} param0 
     * @param {Pointer<PFAX_EXT_SET_DATA>} param1 
     * @param {Pointer<PFAX_EXT_REGISTER_FOR_EVENTS>} param2 
     * @param {Pointer<PFAX_EXT_UNREGISTER_FOR_EVENTS>} param3 
     * @param {Pointer<PFAX_EXT_FREE_BUFFER>} param4 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4) {
        result := DllCall(this.value, "ptr", param0, "ptr", param1, "ptr", param2, "ptr", param3, "ptr", param4, "HRESULT")
        return result
    }

    /**
     * A PFAX_EXT_INITIALIZE_CONFIG that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_EXT_INITIALIZE_CONFIG {
        /**
         * Creates a PFAX_EXT_INITIALIZE_CONFIG pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "ptr", "ptr", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "ptr", "ptr", "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
