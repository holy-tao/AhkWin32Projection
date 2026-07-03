#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HCHANGE.ahk" { HCHANGE }
#Import ".\NOTIFY_FILTER_AND_TYPE.ahk" { NOTIFY_FILTER_AND_TYPE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_REGISTER_CLUSTER_NOTIFY_V2 {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_REGISTER_CLUSTER_NOTIFY_V2) {
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
     * @param {NOTIFY_FILTER_AND_TYPE} Filter 
     * @param {HANDLE} hObject 
     * @param {Pointer} dwNotifyKey 
     * @returns {Integer} 
     */
    Call(_hChange, Filter, hObject, dwNotifyKey) {
        result := DllCall(this.value, HCHANGE, _hChange, NOTIFY_FILTER_AND_TYPE, Filter, HANDLE, hObject, IntPtr, dwNotifyKey, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_REGISTER_CLUSTER_NOTIFY_V2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_REGISTER_CLUSTER_NOTIFY_V2 {
        /**
         * Creates a PCLUSAPI_REGISTER_CLUSTER_NOTIFY_V2 pointer that invokes the given AHK function when called.
         * @param {Func(HCHANGE, NOTIFY_FILTER_AND_TYPE, HANDLE, IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCHANGE, NOTIFY_FILTER_AND_TYPE, HANDLE, IntPtr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
