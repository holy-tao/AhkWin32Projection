#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import ".\CARD_KEY_SIZES.ahk" { CARD_KEY_SIZES }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_QUERY_KEY_SIZES {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_QUERY_KEY_SIZES) {
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
     * @param {Integer} dwKeySpec 
     * @param {Integer} dwFlags 
     * @param {Pointer<CARD_KEY_SIZES>} pKeySizes 
     * @returns {Integer} 
     */
    Call(pCardData, dwKeySpec, dwFlags, pKeySizes) {
        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, UInt32, dwKeySpec, UInt32, dwFlags, CARD_KEY_SIZES.Ptr, pKeySizes, UInt32)
        return result
    }

    /**
     * A PFN_CARD_QUERY_KEY_SIZES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_QUERY_KEY_SIZES {
        /**
         * Creates a PFN_CARD_QUERY_KEY_SIZES pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, UInt32, UInt32, CARD_KEY_SIZES) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, UInt32, UInt32, CARD_KEY_SIZES.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
