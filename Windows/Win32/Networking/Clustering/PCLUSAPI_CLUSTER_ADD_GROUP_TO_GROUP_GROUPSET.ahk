#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }
#Import ".\HGROUPSET.ahk" { HGROUPSET }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUP_GROUPSET {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUP_GROUPSET) {
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
     * @param {HGROUP} _hGroup 
     * @returns {Integer} 
     */
    Call(_hGroupSet, _hGroup) {
        result := DllCall(this.value, HGROUPSET, _hGroupSet, HGROUP, _hGroup, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUP_GROUPSET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUP_GROUPSET {
        /**
         * Creates a PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUP_GROUPSET pointer that invokes the given AHK function when called.
         * @param {Func(HGROUPSET, HGROUP) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUPSET, HGROUP, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
