#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNODE.ahk" { HNODE }
#Import ".\HNODEENUMEX.ahk" { HNODEENUMEX }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_NODE_OPEN_ENUM_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_NODE_OPEN_ENUM_EX) {
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
     * @param {Integer} dwType 
     * @param {Pointer<Void>} pOptions 
     * @returns {HNODEENUMEX} 
     */
    Call(_hNode, dwType, pOptions) {
        pOptionsMarshal := pOptions is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HNODE, _hNode, UInt32, dwType, pOptionsMarshal, pOptions, HNODEENUMEX)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_NODE_OPEN_ENUM_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_NODE_OPEN_ENUM_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_NODE_OPEN_ENUM_EX pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, UInt32, "ptr") => HNODEENUMEX} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, UInt32, "ptr", HNODEENUMEX])
        }

        __Delete() => CallbackFree(this.value)
    }
}
