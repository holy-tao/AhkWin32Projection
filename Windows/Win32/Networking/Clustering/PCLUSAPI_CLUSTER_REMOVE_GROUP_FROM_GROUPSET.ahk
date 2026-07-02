#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUPSET.ahk" { HGROUPSET }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET) {
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
     * @returns {Integer} 
     */
    Call(_hGroupSet) {
        result := DllCall(this.value, HGROUPSET, _hGroupSet, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET {
        /**
         * Creates a PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET pointer that invokes the given AHK function when called.
         * @param {Func(HGROUPSET) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUPSET, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
