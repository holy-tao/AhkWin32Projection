#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11EXT_IHV_CONNECTION_PHASE.ahk" { DOT11EXT_IHV_CONNECTION_PHASE }
#Import ".\DOT11EXT_IHV_UI_REQUEST.ahk" { DOT11EXT_IHV_UI_REQUEST }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_QUERY_UI_REQUEST {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_QUERY_UI_REQUEST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hIhvExtAdapter 
     * @param {DOT11EXT_IHV_CONNECTION_PHASE} connectionPhase 
     * @param {Pointer<Pointer<DOT11EXT_IHV_UI_REQUEST>>} ppIhvUIRequest 
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter, connectionPhase, ppIhvUIRequest) {
        ppIhvUIRequestMarshal := ppIhvUIRequest is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, hIhvExtAdapter, DOT11EXT_IHV_CONNECTION_PHASE, connectionPhase, ppIhvUIRequestMarshal, ppIhvUIRequest, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_QUERY_UI_REQUEST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_QUERY_UI_REQUEST {
        /**
         * Creates a DOT11EXTIHV_QUERY_UI_REQUEST pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DOT11EXT_IHV_CONNECTION_PHASE, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DOT11EXT_IHV_CONNECTION_PHASE, "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
