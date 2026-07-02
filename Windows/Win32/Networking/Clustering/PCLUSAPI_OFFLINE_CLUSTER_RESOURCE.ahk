#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_OFFLINE_CLUSTER_RESOURCE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_OFFLINE_CLUSTER_RESOURCE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESOURCE} _hResource 
     * @returns {Integer} 
     */
    Call(_hResource) {
        result := DllCall(this.value, HRESOURCE, _hResource, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_OFFLINE_CLUSTER_RESOURCE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_OFFLINE_CLUSTER_RESOURCE {
        /**
         * Creates a PCLUSAPI_OFFLINE_CLUSTER_RESOURCE pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
