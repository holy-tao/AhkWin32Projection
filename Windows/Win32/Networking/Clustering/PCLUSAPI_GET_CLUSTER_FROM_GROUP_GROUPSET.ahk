#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUPSET.ahk" { HGROUPSET }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_FROM_GROUP_GROUPSET {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_FROM_GROUP_GROUPSET) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUPSET} _hGroupSet 
     * @returns {HCLUSTER} 
     */
    Call(_hGroupSet) {
        result := DllCall(this.value, HGROUPSET, _hGroupSet, HCLUSTER)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_FROM_GROUP_GROUPSET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_FROM_GROUP_GROUPSET {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_FROM_GROUP_GROUPSET pointer that invokes the given AHK function when called.
         * @param {Func(HGROUPSET) => HCLUSTER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUPSET, HCLUSTER])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
