#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX) {
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
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    Call(_hResource, _hGroup, Flags) {
        result := DllCall(this.value, HRESOURCE, _hResource, HGROUP, _hGroup, Int64, Flags, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX {
        /**
         * Creates a PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, HGROUP, Int64) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, HGROUP, Int64, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
