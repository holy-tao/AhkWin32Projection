#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_CORE_CLUSTER_RESOURCES {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_CORE_CLUSTER_RESOURCES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} _hCluster 
     * @param {Pointer<HRESOURCE>} phClusterNameResource 
     * @param {Pointer<HRESOURCE>} phClusterIPAddressResource 
     * @param {Pointer<HRESOURCE>} phClusterQuorumResource 
     * @returns {Integer} 
     */
    Call(_hCluster, phClusterNameResource, phClusterIPAddressResource, phClusterQuorumResource) {
        phClusterNameResourceMarshal := phClusterNameResource is VarRef ? "ptr*" : "ptr"
        phClusterIPAddressResourceMarshal := phClusterIPAddressResource is VarRef ? "ptr*" : "ptr"
        phClusterQuorumResourceMarshal := phClusterQuorumResource is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, phClusterNameResourceMarshal, phClusterNameResource, phClusterIPAddressResourceMarshal, phClusterIPAddressResource, phClusterQuorumResourceMarshal, phClusterQuorumResource, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_CORE_CLUSTER_RESOURCES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_CORE_CLUSTER_RESOURCES {
        /**
         * Creates a PRESUTIL_GET_CORE_CLUSTER_RESOURCES pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HRESOURCE, HRESOURCE, HRESOURCE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HRESOURCE.Ptr, HRESOURCE.Ptr, HRESOURCE.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
