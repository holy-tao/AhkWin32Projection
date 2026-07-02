#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_FROM_GROUP {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_FROM_GROUP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} _hGroup 
     * @returns {HCLUSTER} 
     */
    Call(_hGroup) {
        result := DllCall(this.value, HGROUP, _hGroup, HCLUSTER)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_FROM_GROUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_FROM_GROUP {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_FROM_GROUP pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP) => HCLUSTER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, HCLUSTER])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
