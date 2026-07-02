#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSENUM.ahk" { HCLUSENUM }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_OPEN_ENUM {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_OPEN_ENUM) {
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
     * @param {Integer} dwType 
     * @returns {HCLUSENUM} 
     */
    Call(_hCluster, dwType) {
        result := DllCall(this.value, HCLUSTER, _hCluster, UInt32, dwType, HCLUSENUM)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_OPEN_ENUM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_OPEN_ENUM {
        /**
         * Creates a PCLUSAPI_CLUSTER_OPEN_ENUM pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, UInt32) => HCLUSENUM} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, UInt32, HCLUSENUM])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
