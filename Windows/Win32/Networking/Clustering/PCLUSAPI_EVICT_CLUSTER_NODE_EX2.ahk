#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNODE.ahk" { HNODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_EVICT_CLUSTER_NODE_EX2 {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_EVICT_CLUSTER_NODE_EX2) {
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
     * @param {Integer} dwTimeout 
     * @param {Pointer<HRESULT>} phrCleanupStatus 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hNode, dwTimeout, phrCleanupStatus, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        phrCleanupStatusMarshal := phrCleanupStatus is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, HNODE, _hNode, UInt32, dwTimeout, phrCleanupStatusMarshal, phrCleanupStatus, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_EVICT_CLUSTER_NODE_EX2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_EVICT_CLUSTER_NODE_EX2 {
        /**
         * Creates a PCLUSAPI_EVICT_CLUSTER_NODE_EX2 pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, UInt32, "int*", PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, UInt32, "int*", PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
