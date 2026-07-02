#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_NODE_RESUME_FAILBACK_TYPE.ahk" { CLUSTER_NODE_RESUME_FAILBACK_TYPE }
#Import ".\HNODE.ahk" { HNODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_RESUME_CLUSTER_NODE_EX2 {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_RESUME_CLUSTER_NODE_EX2) {
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
     * @param {CLUSTER_NODE_RESUME_FAILBACK_TYPE} eResumeFailbackType 
     * @param {Integer} dwResumeFlagsReserved 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hNode, eResumeFailbackType, dwResumeFlagsReserved, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HNODE, _hNode, CLUSTER_NODE_RESUME_FAILBACK_TYPE, eResumeFailbackType, UInt32, dwResumeFlagsReserved, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_RESUME_CLUSTER_NODE_EX2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_RESUME_CLUSTER_NODE_EX2 {
        /**
         * Creates a PCLUSAPI_RESUME_CLUSTER_NODE_EX2 pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, CLUSTER_NODE_RESUME_FAILBACK_TYPE, UInt32, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, CLUSTER_NODE_RESUME_FAILBACK_TYPE, UInt32, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
