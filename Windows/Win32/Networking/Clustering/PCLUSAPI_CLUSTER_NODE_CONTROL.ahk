#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_NODE_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_NODE_CONTROL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HNODE} _hNode 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Integer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Integer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<Integer>} lpBytesReturned 
     * @returns {Integer} 
     */
    Call(_hNode, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned) {
        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HNODE, _hNode, HNODE, hHostNode, UInt32, dwControlCode, IntPtr, lpInBuffer, UInt32, nInBufferSize, IntPtr, lpOutBuffer, UInt32, nOutBufferSize, lpBytesReturnedMarshal, lpBytesReturned, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_NODE_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_NODE_CONTROL {
        /**
         * Creates a PCLUSAPI_CLUSTER_NODE_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, HNODE, UInt32, IntPtr, UInt32, IntPtr, UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, HNODE, UInt32, IntPtr, UInt32, IntPtr, UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
