#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ALG_ID.ahk" { ALG_ID }
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * The PFN_AUTHENTICODE_DIGEST_SIGN user supplied callback function implements digest signing.
 * @remarks
 * The parameter `pSignedDigest->pbData` must be allocated by calling `HeapAlloc` passing the result of `GetProcessHeap()` as the first parameter.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/pfn-authenticode-digest-sign
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_AUTHENTICODE_DIGEST_SIGN {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTHENTICODE_DIGEST_SIGN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pSigningCert A pointer to a [**CERT\_CONTEXT**](/windows/desktop/api/Wincrypt/ns-wincrypt-cert_context) structure that specifies the certificate used to create the digital signature.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pMetadataBlob Pointer to a [**CRYPT_DATA_BLOB**](/windows/win32/api/wincrypt/ns-wincrypt-crypt_integer_blob) structure that contains metadata for digest signing.
     * @param {ALG_ID} digestAlgId Specifies the digest algorithm to be used for digest signing.
     * @param {Pointer<Integer>} pbToBeSignedDigest Pointer to a buffer which contains the digest to be signed.
     * @param {Integer} cbToBeSignedDigest The size, in bytes, of the pbToBeSignedDigest buffer.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pSignedDigest Pointer to [**CRYPT_DATA_BLOB**](/windows/win32/api/wincrypt/ns-wincrypt-crypt_integer_blob) which receives the signed digest.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * If the function fails, it returns an HRESULT value that indicates the error. For a list of common error codes, see [Common HRESULT Values](/windows/win32/seccrypto/common-hresult-values).
     */
    Call(pSigningCert, pMetadataBlob, digestAlgId, pbToBeSignedDigest, cbToBeSignedDigest, pSignedDigest) {
        pbToBeSignedDigestMarshal := pbToBeSignedDigest is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, CERT_CONTEXT.Ptr, pSigningCert, CRYPT_INTEGER_BLOB.Ptr, pMetadataBlob, ALG_ID, digestAlgId, pbToBeSignedDigestMarshal, pbToBeSignedDigest, UInt32, cbToBeSignedDigest, CRYPT_INTEGER_BLOB.Ptr, pSignedDigest, "HRESULT")
        return result
    }

    /**
     * A PFN_AUTHENTICODE_DIGEST_SIGN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTHENTICODE_DIGEST_SIGN {
        /**
         * Creates a PFN_AUTHENTICODE_DIGEST_SIGN pointer that invokes the given AHK function when called.
         * @param {Func(CERT_CONTEXT, CRYPT_INTEGER_BLOB, ALG_ID, "char*", UInt32, CRYPT_INTEGER_BLOB) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_CONTEXT.Ptr, CRYPT_INTEGER_BLOB.Ptr, ALG_ID, "char*", UInt32, CRYPT_INTEGER_BLOB.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
