#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCHANGE.ahk" { HCHANGE }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT) {
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
     * @param {Integer} dwFilter 
     * @param {Pointer} dwNotifyKey 
     * @returns {HCHANGE} 
     */
    Call(_hChange, _hCluster, dwFilter, dwNotifyKey) {
        result := DllCall(this.value, HCHANGE, _hChange, HCLUSTER, _hCluster, UInt32, dwFilter, IntPtr, dwNotifyKey, HCHANGE)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT pointer that invokes the given AHK function when called.
         * @param {Func(HCHANGE, HCLUSTER, UInt32, IntPtr) => HCHANGE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCHANGE, HCLUSTER, UInt32, IntPtr, HCHANGE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
