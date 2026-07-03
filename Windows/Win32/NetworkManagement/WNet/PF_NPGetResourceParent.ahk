#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NETRESOURCEW.ahk" { NETRESOURCEW }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetResourceParent {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetResourceParent) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {Integer} lpBuffer 
     * @param {Pointer<Integer>} lpBufferSize 
     * @returns {Integer} 
     */
    Call(lpNetResource, lpBuffer, lpBufferSize) {
        lpBufferSizeMarshal := lpBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, NETRESOURCEW.Ptr, lpNetResource, IntPtr, lpBuffer, lpBufferSizeMarshal, lpBufferSize, UInt32)
        return result
    }

    /**
     * A PF_NPGetResourceParent that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetResourceParent {
        /**
         * Creates a PF_NPGetResourceParent pointer that invokes the given AHK function when called.
         * @param {Func(NETRESOURCEW, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NETRESOURCEW.Ptr, IntPtr, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
