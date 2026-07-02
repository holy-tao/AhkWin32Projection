#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_DESTROY_CLUSTER_GROUP {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_DESTROY_CLUSTER_GROUP) {
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
     * @returns {Integer} 
     */
    Call(_hGroup) {
        result := DllCall(this.value, HGROUP, _hGroup, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_DESTROY_CLUSTER_GROUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_DESTROY_CLUSTER_GROUP {
        /**
         * Creates a PCLUSAPI_DESTROY_CLUSTER_GROUP pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
