#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PFN_AUTHENTICODE_DIGEST_SIGN_EX user supplied callback function implements digest signing.
 * @remarks
 * The parameter pSignedDigest->pbData must be allocated by calling HeapAlloc passing the result of GetProcessHeap() as the first parameter. The parameter \*ppSignerCert will be freed by the caller by calling CertFreeCertificateContext.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/SecCrypto/pfn-authenticode-digest-sign-ex
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_AUTHENTICODE_DIGEST_SIGN_EX extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pMetadataBlob 
     * @param {Integer} digestAlgId 
     * @param {Pointer<Integer>} pbToBeSignedDigest 
     * @param {Integer} cbToBeSignedDigest 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pSignedDigest 
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppSignerCert 
     * @param {HCERTSTORE} hCertChainStore 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pMetadataBlob, digestAlgId, pbToBeSignedDigest, cbToBeSignedDigest, pSignedDigest, ppSignerCert, hCertChainStore) {
        hCertChainStore := hCertChainStore is Win32Handle ? NumGet(hCertChainStore, "ptr") : hCertChainStore

        pbToBeSignedDigestMarshal := pbToBeSignedDigest is VarRef ? "char*" : "ptr"
        ppSignerCertMarshal := ppSignerCert is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pMetadataBlob, "uint", digestAlgId, pbToBeSignedDigestMarshal, pbToBeSignedDigest, "uint", cbToBeSignedDigest, "ptr", pSignedDigest, ppSignerCertMarshal, ppSignerCert, "ptr", hCertChainStore, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
