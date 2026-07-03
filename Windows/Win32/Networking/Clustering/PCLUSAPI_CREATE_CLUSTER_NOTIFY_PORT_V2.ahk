#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCHANGE.ahk" { HCHANGE }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\NOTIFY_FILTER_AND_TYPE.ahk" { NOTIFY_FILTER_AND_TYPE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT_V2 {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT_V2) {
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
     * @param {HCLUSTER} _hCluster 
     * @param {Pointer<NOTIFY_FILTER_AND_TYPE>} Filters 
     * @param {Integer} dwFilterCount 
     * @param {Pointer} dwNotifyKey 
     * @returns {HCHANGE} 
     */
    Call(_hChange, _hCluster, Filters, dwFilterCount, dwNotifyKey) {
        result := DllCall(this.value, HCHANGE, _hChange, HCLUSTER, _hCluster, NOTIFY_FILTER_AND_TYPE.Ptr, Filters, UInt32, dwFilterCount, IntPtr, dwNotifyKey, HCHANGE)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT_V2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT_V2 {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT_V2 pointer that invokes the given AHK function when called.
         * @param {Func(HCHANGE, HCLUSTER, NOTIFY_FILTER_AND_TYPE, UInt32, IntPtr) => HCHANGE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCHANGE, HCLUSTER, NOTIFY_FILTER_AND_TYPE.Ptr, UInt32, IntPtr, HCHANGE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
