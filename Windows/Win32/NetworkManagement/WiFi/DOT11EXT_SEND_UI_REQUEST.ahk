#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11EXT_IHV_UI_REQUEST.ahk" { DOT11EXT_IHV_UI_REQUEST }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_SEND_UI_REQUEST {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_SEND_UI_REQUEST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDot11SvcHandle 
     * @param {Pointer<DOT11EXT_IHV_UI_REQUEST>} pIhvUIRequest 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, pIhvUIRequest) {
        result := DllCall(this.value, HANDLE, hDot11SvcHandle, DOT11EXT_IHV_UI_REQUEST.Ptr, pIhvUIRequest, UInt32)
        return result
    }

    /**
     * A DOT11EXT_SEND_UI_REQUEST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_SEND_UI_REQUEST {
        /**
         * Creates a DOT11EXT_SEND_UI_REQUEST pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DOT11EXT_IHV_UI_REQUEST) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DOT11EXT_IHV_UI_REQUEST.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
