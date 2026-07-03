#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNODE.ahk" { HNODE }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE) {
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
     * @param {HNODE} _hNode 
     * @returns {Integer} 
     */
    Call(_hResource, _hNode) {
        result := DllCall(this.value, HRESOURCE, _hResource, HNODE, _hNode, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE {
        /**
         * Creates a PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, HNODE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, HNODE, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
