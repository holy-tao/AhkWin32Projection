#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11EXT_IHV_INDICATION_TYPE.ahk" { DOT11EXT_IHV_INDICATION_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_RECEIVE_INDICATION {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_RECEIVE_INDICATION) {
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
     * @param {DOT11EXT_IHV_INDICATION_TYPE} indicationType 
     * @param {Integer} uBufferLength 
     * @param {Integer} pvBuffer 
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter, indicationType, uBufferLength, pvBuffer) {
        result := DllCall(this.value, HANDLE, hIhvExtAdapter, DOT11EXT_IHV_INDICATION_TYPE, indicationType, UInt32, uBufferLength, IntPtr, pvBuffer, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_RECEIVE_INDICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_RECEIVE_INDICATION {
        /**
         * Creates a DOT11EXTIHV_RECEIVE_INDICATION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DOT11EXT_IHV_INDICATION_TYPE, UInt32, IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DOT11EXT_IHV_INDICATION_TYPE, UInt32, IntPtr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
