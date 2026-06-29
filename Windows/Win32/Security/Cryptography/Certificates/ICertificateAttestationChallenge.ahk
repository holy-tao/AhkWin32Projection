#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Allows applications to decrypt a key attestation challenge received from a server.
 * @remarks
 * If the challenge is successfully decrypted, the decrypted secret needs to be sent back to the server so that an attested end entity certificate can be issued.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertificateattestationchallenge
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertificateAttestationChallenge extends IDispatch {
    /**
     * The interface identifier for ICertificateAttestationChallenge
     * @type {Guid}
     */
    static IID := Guid("{6f175a7c-4a3a-40ae-9dba-592fd6bbf9b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertificateAttestationChallenge interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize       : IntPtr
        DecryptChallenge : IntPtr
        get_RequestID    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertificateAttestationChallenge.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    RequestID {
        get => this.get_RequestID()
    }

    /**
     * Initialize using the full Certificate Management over CMS (CMC) response returned from the CA.
     * @remarks
     * The CA should have returned a pending CMC response. The content of the CMC response should contain a challenge. There must be only one CMC response and it must contain pending information.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the  response. The default value is XCN_CRYPT_STRING_BASE64.
     * @param {BSTR} strPendingFullCmcResponseWithChallenge The pending CMC response from the CA.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificateattestationchallenge-initialize
     */
    Initialize(Encoding, strPendingFullCmcResponseWithChallenge) {
        strPendingFullCmcResponseWithChallenge := strPendingFullCmcResponseWithChallenge is String ? BSTR.Alloc(strPendingFullCmcResponseWithChallenge).Value : strPendingFullCmcResponseWithChallenge

        result := ComCall(7, this, EncodingType, Encoding, BSTR, strPendingFullCmcResponseWithChallenge, "HRESULT")
        return result
    }

    /**
     * Decrypts the challenge from the Certificate Management over CMS (CMC) response and creates a re-encrypted response to send to the CA.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the  attestation challenge. The default value is XCN_CRYPT_STRING_BASE64.
     * @returns {BSTR} The decrypted challenge from the CMC response re-encrypted for the CA.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificateattestationchallenge-decryptchallenge
     */
    DecryptChallenge(Encoding) {
        pstrEnvelopedPkcs7ReencryptedToCA := BSTR.Owned()
        result := ComCall(8, this, EncodingType, Encoding, BSTR.Ptr, pstrEnvelopedPkcs7ReencryptedToCA, "HRESULT")
        return pstrEnvelopedPkcs7ReencryptedToCA
    }

    /**
     * Gets the request ID from the Certificate Management over CMS (CMC) response.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificateattestationchallenge-get_requestid
     */
    get_RequestID() {
        pstrRequestID := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pstrRequestID, "HRESULT")
        return pstrRequestID
    }

    Query(iid) {
        if (ICertificateAttestationChallenge.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.DecryptChallenge := CallbackCreate(GetMethod(implObj, "DecryptChallenge"), flags, 3)
        this.vtbl.get_RequestID := CallbackCreate(GetMethod(implObj, "get_RequestID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.DecryptChallenge)
        CallbackFree(this.vtbl.get_RequestID)
    }
}
