#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_DELETE_CONTAINER {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_DELETE_CONTAINER) {
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
     * @param {Integer} bContainerIndex 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    Call(pCardData, bContainerIndex, dwReserved) {
        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, Int8, bContainerIndex, UInt32, dwReserved, UInt32)
        return result
    }

    /**
     * A PFN_CARD_DELETE_CONTAINER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_DELETE_CONTAINER {
        /**
         * Creates a PFN_CARD_DELETE_CONTAINER pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, Int8, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, Int8, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
