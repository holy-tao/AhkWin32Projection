#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP) {
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
     * @param {HGROUP} _hGroup 
     * @returns {Integer} 
     */
    Call(_hResource, _hGroup) {
        result := DllCall(this.value, HRESOURCE, _hResource, HGROUP, _hGroup, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP {
        /**
         * Creates a PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, HGROUP) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, HGROUP, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
