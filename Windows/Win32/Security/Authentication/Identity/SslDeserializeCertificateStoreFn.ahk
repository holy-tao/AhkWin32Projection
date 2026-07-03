#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SslDeserializeCertificateStoreFn {
    value : IntPtr

    __value {
        set {
            if (value is SslDeserializeCertificateStoreFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {CRYPT_INTEGER_BLOB} SerializedCertificateStore 
     * @returns {Pointer<CERT_CONTEXT>} 
     */
    Call(SerializedCertificateStore) {
        result := DllCall(this.value, CRYPT_INTEGER_BLOB, SerializedCertificateStore, "ptr*", &ppCertContext := 0, "HRESULT")
        return ppCertContext
    }

    /**
     * A SslDeserializeCertificateStoreFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslDeserializeCertificateStoreFn {
        /**
         * Creates a SslDeserializeCertificateStoreFn pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_INTEGER_BLOB) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_INTEGER_BLOB, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
