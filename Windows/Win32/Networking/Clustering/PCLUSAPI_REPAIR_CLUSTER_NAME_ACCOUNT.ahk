#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_REPAIR_CLUSTER_NAME_ACCOUNT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_REPAIR_CLUSTER_NAME_ACCOUNT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} _hCluster 
     * @returns {Integer} 
     */
    Call(_hCluster) {
        result := DllCall(this.value, HCLUSTER, _hCluster, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_REPAIR_CLUSTER_NAME_ACCOUNT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_REPAIR_CLUSTER_NAME_ACCOUNT {
        /**
         * Creates a PCLUSAPI_REPAIR_CLUSTER_NAME_ACCOUNT pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
