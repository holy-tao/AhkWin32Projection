#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_PORT_STATE.ahk" { DOT11_PORT_STATE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_PERFORM_POST_ASSOCIATE {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_PERFORM_POST_ASSOCIATE) {
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
     * @param {HANDLE} hSecuritySessionID 
     * @param {Pointer<DOT11_PORT_STATE>} pPortState 
     * @param {Integer} uDot11AssocParamsBytes 
     * @param {Integer} pDot11AssocParams 
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter, hSecuritySessionID, pPortState, uDot11AssocParamsBytes, pDot11AssocParams) {
        result := DllCall(this.value, HANDLE, hIhvExtAdapter, HANDLE, hSecuritySessionID, DOT11_PORT_STATE.Ptr, pPortState, UInt32, uDot11AssocParamsBytes, IntPtr, pDot11AssocParams, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_PERFORM_POST_ASSOCIATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_PERFORM_POST_ASSOCIATE {
        /**
         * Creates a DOT11EXTIHV_PERFORM_POST_ASSOCIATE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, DOT11_PORT_STATE, UInt32, IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, DOT11_PORT_STATE.Ptr, UInt32, IntPtr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
