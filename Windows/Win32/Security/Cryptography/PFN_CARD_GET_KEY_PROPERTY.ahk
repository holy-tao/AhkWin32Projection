#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_GET_KEY_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_GET_KEY_PROPERTY) {
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
     * @param {Pointer} _hKey 
     * @param {PWSTR} pwszProperty 
     * @param {Integer} pbData 
     * @param {Integer} cbData 
     * @param {Pointer<Integer>} pdwDataLen 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(pCardData, _hKey, pwszProperty, pbData, cbData, pdwDataLen, dwFlags) {
        pwszProperty := pwszProperty is String ? StrPtr(pwszProperty) : pwszProperty

        pdwDataLenMarshal := pdwDataLen is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, IntPtr, _hKey, "ptr", pwszProperty, IntPtr, pbData, UInt32, cbData, pdwDataLenMarshal, pdwDataLen, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A PFN_CARD_GET_KEY_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_GET_KEY_PROPERTY {
        /**
         * Creates a PFN_CARD_GET_KEY_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, IntPtr, PWSTR, IntPtr, UInt32, "uint*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, IntPtr, PWSTR, IntPtr, UInt32, "uint*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
