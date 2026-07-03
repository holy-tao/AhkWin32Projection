#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HCHANGE.ahk" { HCHANGE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_NOTIFY_EVENT_HANDLE_V2 {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_NOTIFY_EVENT_HANDLE_V2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCHANGE} _hChange 
     * @param {Pointer<HANDLE>} lphTargetEvent 
     * @returns {Integer} 
     */
    Call(_hChange, lphTargetEvent) {
        result := DllCall(this.value, HCHANGE, _hChange, HANDLE.Ptr, lphTargetEvent, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_GET_NOTIFY_EVENT_HANDLE_V2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_NOTIFY_EVENT_HANDLE_V2 {
        /**
         * Creates a PCLUSAPI_GET_NOTIFY_EVENT_HANDLE_V2 pointer that invokes the given AHK function when called.
         * @param {Func(HCHANGE, HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCHANGE, HANDLE.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
