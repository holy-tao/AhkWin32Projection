#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_SYNC_DATABASE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_SYNC_DATABASE) {
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
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    Call(_hCluster, flags) {
        result := DllCall(this.value, HCLUSTER, _hCluster, UInt32, flags, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_SYNC_DATABASE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_SYNC_DATABASE {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_SYNC_DATABASE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, UInt32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
