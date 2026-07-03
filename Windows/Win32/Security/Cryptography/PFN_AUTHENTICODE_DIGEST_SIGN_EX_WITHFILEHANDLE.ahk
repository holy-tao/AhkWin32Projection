#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ALG_ID.ahk" { ALG_ID }
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * The PFN_AUTHENTICODE_DIGEST_SIGN_EX_WITHFILEHANDLE user supplied callback function implements digest signing.
 * @remarks
 * The parameter pSignedDigest->pbData must be allocated by calling HeapAlloc passing the result of GetProcessHeap() as the first parameter. The parameter \*ppSignerCert will be freed by the caller by calling CertFreeCertificateContext.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/pfn-authenticode-digest-sign-ex-withfilehandle
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_AUTHENTICODE_DIGEST_SIGN_EX_WITHFILEHANDLE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTHENTICODE_DIGEST_SIGN_EX_WITHFILEHANDLE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pMetadataBlob Pointer to a [**CRYPT_DATA_BLOB**](/windows/win32/api/wincrypt/ns-wincrypt-crypt_integer_blob) structure that contains metadata for digest signing.
     * @param {ALG_ID} digestAlgId Specifies the digest algorithm to be used for digest signing.
     * @param {Pointer<Integer>} pbToBeSignedDigest Pointer to a buffer which contains the digest to be signed.
     * @param {Integer} cbToBeSignedDigest The size, in bytes, of the pbToBeSignedDigest buffer.
     * @param {HANDLE} hFile Handle to the file being signed.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pSignedDigest Pointer to [**CRYPT_DATA_BLOB**](/windows/win32/api/wincrypt/ns-wincrypt-crypt_integer_blob) which receives the signed digest.
     * @param {HCERTSTORE} hCertChainStore Optional, receives the cert chain of the signer cert.
     * @returns {Pointer<CERT_CONTEXT>} 
     */
    Call(pMetadataBlob, digestAlgId, pbToBeSignedDigest, cbToBeSignedDigest, hFile, pSignedDigest, hCertChainStore) {
        pbToBeSignedDigestMarshal := pbToBeSignedDigest is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, CRYPT_INTEGER_BLOB.Ptr, pMetadataBlob, ALG_ID, digestAlgId, pbToBeSignedDigestMarshal, pbToBeSignedDigest, UInt32, cbToBeSignedDigest, HANDLE, hFile, CRYPT_INTEGER_BLOB.Ptr, pSignedDigest, "ptr*", &ppSignerCert := 0, HCERTSTORE, hCertChainStore, "HRESULT")
        return ppSignerCert
    }

    /**
     * A PFN_AUTHENTICODE_DIGEST_SIGN_EX_WITHFILEHANDLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTHENTICODE_DIGEST_SIGN_EX_WITHFILEHANDLE {
        /**
         * Creates a PFN_AUTHENTICODE_DIGEST_SIGN_EX_WITHFILEHANDLE pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_INTEGER_BLOB, ALG_ID, "char*", UInt32, HANDLE, CRYPT_INTEGER_BLOB, HCERTSTORE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_INTEGER_BLOB.Ptr, ALG_ID, "char*", UInt32, HANDLE, CRYPT_INTEGER_BLOB.Ptr, HCERTSTORE, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
