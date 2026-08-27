#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_CONTROL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * @param {HCLUSTER} _hCluster 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Integer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Integer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<Integer>} lpBytesReturned 
     * @returns {Integer} 
     */
    Call(_hCluster, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned) {
        hHostNodeMarshal := hHostNode == 0 ? IntPtr : HNODE
        lpInBufferMarshal := lpInBuffer == 0 ? IntPtr : IntPtr
        lpOutBufferMarshal := lpOutBuffer == 0 ? IntPtr : IntPtr
        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : IntPtr
        lpBytesReturnedMarshal := lpBytesReturned == 0 ? IntPtr : "uint*"

        result := DllCall(this.value, HCLUSTER, _hCluster, hHostNodeMarshal, hHostNode, UInt32, dwControlCode, lpInBufferMarshal, lpInBuffer, UInt32, nInBufferSize, lpOutBufferMarshal, lpOutBuffer, UInt32, nOutBufferSize, lpBytesReturnedMarshal, lpBytesReturned, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_CONTROL {
        /**
         * Creates a PCLUSAPI_CLUSTER_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HNODE, UInt32, IntPtr, UInt32, IntPtr, UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HNODE, UInt32, IntPtr, UInt32, IntPtr, UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
