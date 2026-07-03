#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_GET_SHARED_KEY_HANDLE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_GET_SHARED_KEY_HANDLE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CARD_DATA>} pCardData 
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Pointer<Pointer<Integer>>} ppbOutput 
     * @param {Pointer<Integer>} pcbOutput 
     * @param {Pointer<Pointer>} phKey 
     * @returns {Integer} 
     */
    Call(pCardData, pbInput, cbInput, ppbOutput, pcbOutput, phKey) {
        ppbOutputMarshal := ppbOutput is VarRef ? "ptr*" : "ptr"
        pcbOutputMarshal := pcbOutput is VarRef ? "uint*" : "ptr"
        phKeyMarshal := phKey is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, IntPtr, pbInput, UInt32, cbInput, ppbOutputMarshal, ppbOutput, pcbOutputMarshal, pcbOutput, phKeyMarshal, phKey, UInt32)
        return result
    }

    /**
     * A PFN_CARD_GET_SHARED_KEY_HANDLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_GET_SHARED_KEY_HANDLE {
        /**
         * Creates a PFN_CARD_GET_SHARED_KEY_HANDLE pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, IntPtr, UInt32, "ptr*", "uint*", "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, IntPtr, UInt32, "ptr*", "uint*", "ptr*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
