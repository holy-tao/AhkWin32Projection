#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY) {
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
     * @param {HRESOURCE} hDependsOn 
     * @returns {Integer} 
     */
    Call(_hResource, hDependsOn) {
        result := DllCall(this.value, HRESOURCE, _hResource, HRESOURCE, hDependsOn, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY {
        /**
         * Creates a PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, HRESOURCE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, HRESOURCE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
