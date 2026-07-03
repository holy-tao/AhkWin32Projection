#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_PAUSE_CLUSTER_NODE_EX2 {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_PAUSE_CLUSTER_NODE_EX2) {
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
     * @param {BOOL} bDrainNode 
     * @param {Integer} dwPauseFlags 
     * @param {HNODE} hNodeDrainTarget 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hNode, bDrainNode, dwPauseFlags, hNodeDrainTarget, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HNODE, _hNode, BOOL, bDrainNode, UInt32, dwPauseFlags, HNODE, hNodeDrainTarget, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_PAUSE_CLUSTER_NODE_EX2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_PAUSE_CLUSTER_NODE_EX2 {
        /**
         * Creates a PCLUSAPI_PAUSE_CLUSTER_NODE_EX2 pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, BOOL, UInt32, HNODE, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, BOOL, UInt32, HNODE, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
