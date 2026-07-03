#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_GET_CHALLENGE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_GET_CHALLENGE) {
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
     * @param {Pointer<Pointer<Integer>>} ppbChallengeData 
     * @param {Pointer<Integer>} pcbChallengeData 
     * @returns {Integer} 
     */
    Call(pCardData, ppbChallengeData, pcbChallengeData) {
        ppbChallengeDataMarshal := ppbChallengeData is VarRef ? "ptr*" : "ptr"
        pcbChallengeDataMarshal := pcbChallengeData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, ppbChallengeDataMarshal, ppbChallengeData, pcbChallengeDataMarshal, pcbChallengeData, UInt32)
        return result
    }

    /**
     * A PFN_CARD_GET_CHALLENGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_GET_CHALLENGE {
        /**
         * Creates a PFN_CARD_GET_CHALLENGE pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, "ptr*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
