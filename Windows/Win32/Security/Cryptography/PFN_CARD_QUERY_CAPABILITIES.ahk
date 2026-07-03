#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_CAPABILITIES.ahk" { CARD_CAPABILITIES }
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_QUERY_CAPABILITIES {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_QUERY_CAPABILITIES) {
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
     * @param {Pointer<CARD_CAPABILITIES>} pCardCapabilities 
     * @returns {Integer} 
     */
    Call(pCardData, pCardCapabilities) {
        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, CARD_CAPABILITIES.Ptr, pCardCapabilities, UInt32)
        return result
    }

    /**
     * A PFN_CARD_QUERY_CAPABILITIES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_QUERY_CAPABILITIES {
        /**
         * Creates a PFN_CARD_QUERY_CAPABILITIES pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, CARD_CAPABILITIES) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, CARD_CAPABILITIES.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
