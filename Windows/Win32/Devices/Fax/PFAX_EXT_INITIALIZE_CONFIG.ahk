#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFAX_EXT_UNREGISTER_FOR_EVENTS.ahk" { PFAX_EXT_UNREGISTER_FOR_EVENTS }
#Import ".\PFAX_EXT_FREE_BUFFER.ahk" { PFAX_EXT_FREE_BUFFER }
#Import ".\PFAX_EXT_SET_DATA.ahk" { PFAX_EXT_SET_DATA }
#Import ".\PFAX_EXT_GET_DATA.ahk" { PFAX_EXT_GET_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PFAX_EXT_REGISTER_FOR_EVENTS.ahk" { PFAX_EXT_REGISTER_FOR_EVENTS }

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
        result := DllCall(this.value, PFAX_EXT_GET_DATA, param0, PFAX_EXT_SET_DATA, param1, PFAX_EXT_REGISTER_FOR_EVENTS, param2, PFAX_EXT_UNREGISTER_FOR_EVENTS, param3, PFAX_EXT_FREE_BUFFER, param4, "HRESULT")
        return result
    }

    /**
     * A PFAX_EXT_INITIALIZE_CONFIG that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_EXT_INITIALIZE_CONFIG {
        /**
         * Creates a PFAX_EXT_INITIALIZE_CONFIG pointer that invokes the given AHK function when called.
         * @param {Func(PFAX_EXT_GET_DATA, PFAX_EXT_SET_DATA, PFAX_EXT_REGISTER_FOR_EVENTS, PFAX_EXT_UNREGISTER_FOR_EVENTS, PFAX_EXT_FREE_BUFFER) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PFAX_EXT_GET_DATA, PFAX_EXT_SET_DATA, PFAX_EXT_REGISTER_FOR_EVENTS, PFAX_EXT_UNREGISTER_FOR_EVENTS, PFAX_EXT_FREE_BUFFER, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
