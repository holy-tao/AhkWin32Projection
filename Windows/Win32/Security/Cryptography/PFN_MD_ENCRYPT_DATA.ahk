#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CARD_ENCRYPTED_DATA.ahk" { CARD_ENCRYPTED_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_MD_ENCRYPT_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PFN_MD_ENCRYPT_DATA) {
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
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<CARD_ENCRYPTED_DATA>>} ppEncryptedData 
     * @param {Pointer<Integer>} pcEncryptedData 
     * @returns {Integer} 
     */
    Call(pCardData, _hKey, pwszSecureFunction, pbInput, cbInput, dwFlags, ppEncryptedData, pcEncryptedData) {
        pwszSecureFunction := pwszSecureFunction is String ? StrPtr(pwszSecureFunction) : pwszSecureFunction

        ppEncryptedDataMarshal := ppEncryptedData is VarRef ? "ptr*" : "ptr"
        pcEncryptedDataMarshal := pcEncryptedData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, IntPtr, _hKey, "ptr", pwszSecureFunction, IntPtr, pbInput, UInt32, cbInput, UInt32, dwFlags, ppEncryptedDataMarshal, ppEncryptedData, pcEncryptedDataMarshal, pcEncryptedData, UInt32)
        return result
    }

    /**
     * A PFN_MD_ENCRYPT_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_MD_ENCRYPT_DATA {
        /**
         * Creates a PFN_MD_ENCRYPT_DATA pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, IntPtr, PWSTR, IntPtr, UInt32, UInt32, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, IntPtr, PWSTR, IntPtr, UInt32, UInt32, "ptr*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
