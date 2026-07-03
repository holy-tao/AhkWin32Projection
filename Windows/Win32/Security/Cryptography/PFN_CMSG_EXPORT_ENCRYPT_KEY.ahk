#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_EXPORT_ENCRYPT_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_EXPORT_ENCRYPT_KEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} hCryptProv 
     * @param {Pointer} hEncryptKey 
     * @param {Pointer<CERT_PUBLIC_KEY_INFO>} pPublicKeyInfo 
     * @param {Integer} pbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {BOOL} 
     */
    Call(hCryptProv, hEncryptKey, pPublicKeyInfo, pbData, pcbData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, hCryptProv, IntPtr, hEncryptKey, CERT_PUBLIC_KEY_INFO.Ptr, pPublicKeyInfo, IntPtr, pbData, pcbDataMarshal, pcbData, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_EXPORT_ENCRYPT_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_EXPORT_ENCRYPT_KEY {
        /**
         * Creates a PFN_CMSG_EXPORT_ENCRYPT_KEY pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, CERT_PUBLIC_KEY_INFO, IntPtr, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, CERT_PUBLIC_KEY_INFO.Ptr, IntPtr, "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
