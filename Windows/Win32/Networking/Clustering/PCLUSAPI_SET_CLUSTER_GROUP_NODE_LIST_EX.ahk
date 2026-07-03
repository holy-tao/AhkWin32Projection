#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HGROUP.ahk" { HGROUP }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} _hGroup 
     * @param {Integer} NodeCount 
     * @param {Pointer<HNODE>} NodeList 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hGroup, NodeCount, NodeList, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        NodeListMarshal := NodeList is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HGROUP, _hGroup, UInt32, NodeCount, NodeListMarshal, NodeList, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST_EX {
        /**
         * Creates a PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST_EX pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, UInt32, HNODE, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, UInt32, HNODE.Ptr, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
