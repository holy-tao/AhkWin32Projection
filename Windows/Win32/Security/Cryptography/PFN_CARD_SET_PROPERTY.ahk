#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_SET_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_SET_PROPERTY) {
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
     * @param {PWSTR} wszProperty 
     * @param {Integer} pbData 
     * @param {Integer} cbDataLen 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(pCardData, wszProperty, pbData, cbDataLen, dwFlags) {
        wszProperty := wszProperty is String ? StrPtr(wszProperty) : wszProperty

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, "ptr", wszProperty, IntPtr, pbData, UInt32, cbDataLen, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A PFN_CARD_SET_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_SET_PROPERTY {
        /**
         * Creates a PFN_CARD_SET_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, PWSTR, IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, PWSTR, IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
