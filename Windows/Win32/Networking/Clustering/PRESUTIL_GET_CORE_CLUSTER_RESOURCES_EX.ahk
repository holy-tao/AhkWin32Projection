#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_CORE_CLUSTER_RESOURCES_EX {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_CORE_CLUSTER_RESOURCES_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} hClusterIn 
     * @param {Pointer<HRESOURCE>} phClusterNameResourceOut 
     * @param {Pointer<HRESOURCE>} phClusterIPAddressResourceOut 
     * @param {Pointer<HRESOURCE>} phClusterQuorumResourceOut 
     * @param {Integer} dwDesiredAccess 
     * @returns {Integer} 
     */
    Call(hClusterIn, phClusterNameResourceOut, phClusterIPAddressResourceOut, phClusterQuorumResourceOut, dwDesiredAccess) {
        phClusterNameResourceOutMarshal := phClusterNameResourceOut is VarRef ? "ptr*" : "ptr"
        phClusterIPAddressResourceOutMarshal := phClusterIPAddressResourceOut is VarRef ? "ptr*" : "ptr"
        phClusterQuorumResourceOutMarshal := phClusterQuorumResourceOut is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HCLUSTER, hClusterIn, phClusterNameResourceOutMarshal, phClusterNameResourceOut, phClusterIPAddressResourceOutMarshal, phClusterIPAddressResourceOut, phClusterQuorumResourceOutMarshal, phClusterQuorumResourceOut, UInt32, dwDesiredAccess, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_CORE_CLUSTER_RESOURCES_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_CORE_CLUSTER_RESOURCES_EX {
        /**
         * Creates a PRESUTIL_GET_CORE_CLUSTER_RESOURCES_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HRESOURCE, HRESOURCE, HRESOURCE, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HRESOURCE.Ptr, HRESOURCE.Ptr, HRESOURCE.Ptr, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
