#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CARD_ENCRYPTED_DATA.ahk" { CARD_ENCRYPTED_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_PROCESS_ENCRYPTED_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_PROCESS_ENCRYPTED_DATA) {
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
     * @param {PWSTR} pwszSecureFunction 
     * @param {Pointer<CARD_ENCRYPTED_DATA>} pEncryptedData 
     * @param {Integer} cEncryptedData 
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Pointer<Integer>} pdwOutputLen 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(pCardData, _hKey, pwszSecureFunction, pEncryptedData, cEncryptedData, pbOutput, cbOutput, pdwOutputLen, dwFlags) {
        pwszSecureFunction := pwszSecureFunction is String ? StrPtr(pwszSecureFunction) : pwszSecureFunction

        pdwOutputLenMarshal := pdwOutputLen is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, IntPtr, _hKey, "ptr", pwszSecureFunction, CARD_ENCRYPTED_DATA.Ptr, pEncryptedData, UInt32, cEncryptedData, IntPtr, pbOutput, UInt32, cbOutput, pdwOutputLenMarshal, pdwOutputLen, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A PFN_CARD_PROCESS_ENCRYPTED_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_PROCESS_ENCRYPTED_DATA {
        /**
         * Creates a PFN_CARD_PROCESS_ENCRYPTED_DATA pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, IntPtr, PWSTR, CARD_ENCRYPTED_DATA, UInt32, IntPtr, UInt32, "uint*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, IntPtr, PWSTR, CARD_ENCRYPTED_DATA.Ptr, UInt32, IntPtr, UInt32, "uint*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
