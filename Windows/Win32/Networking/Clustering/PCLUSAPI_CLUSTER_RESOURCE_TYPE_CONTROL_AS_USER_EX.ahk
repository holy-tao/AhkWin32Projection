#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNODE.ahk" { HNODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL_AS_USER_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL_AS_USER_EX) {
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
     * @param {PWSTR} lpszResourceTypeName 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Integer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Integer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<Integer>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszResourceTypeName, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpszReason) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszResourceTypeName, HNODE, hHostNode, UInt32, dwControlCode, IntPtr, lpInBuffer, UInt32, nInBufferSize, IntPtr, lpOutBuffer, UInt32, nOutBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL_AS_USER_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL_AS_USER_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL_AS_USER_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, HNODE, UInt32, IntPtr, UInt32, IntPtr, UInt32, "uint*", PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, HNODE, UInt32, IntPtr, UInt32, IntPtr, UInt32, "uint*", PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
