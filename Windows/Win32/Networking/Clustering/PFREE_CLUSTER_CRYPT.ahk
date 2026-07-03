#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PFREE_CLUSTER_CRYPT {
    value : IntPtr

    __value {
        set {
            if (value is PFREE_CLUSTER_CRYPT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pCryptInfo 
     * @returns {Integer} 
     */
    Call(pCryptInfo) {
        pCryptInfoMarshal := pCryptInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pCryptInfoMarshal, pCryptInfo, UInt32)
        return result
    }

    /**
     * A PFREE_CLUSTER_CRYPT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFREE_CLUSTER_CRYPT {
        /**
         * Creates a PFREE_CLUSTER_CRYPT pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
