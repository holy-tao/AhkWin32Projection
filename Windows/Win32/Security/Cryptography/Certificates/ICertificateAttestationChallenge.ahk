#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Allows applications to decrypt a key attestation challenge received from a server.
 * @remarks
 * 
 * If the challenge is successfully decrypted, the decrypted secret needs to be sent back to the server so that an attested end entity certificate can be issued.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertificateattestationchallenge
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertificateAttestationChallenge extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateAttestationChallenge
     * @type {Guid}
     */
    static IID => Guid("{6f175a7c-4a3a-40ae-9dba-592fd6bbf9b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "DecryptChallenge", "get_RequestID"]

    /**
     * @type {BSTR} 
     */
    RequestID {
        get => this.get_RequestID()
    }

    /**
     * Initialize using the full Certificate Management over CMS (CMC) response returned from the CA.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the  response. The default value is XCN_CRYPT_STRING_BASE64.
     * @param {BSTR} strPendingFullCmcResponseWithChallenge The pending CMC response from the CA.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertificateattestationchallenge-initialize
     */
    Initialize(Encoding, strPendingFullCmcResponseWithChallenge) {
        strPendingFullCmcResponseWithChallenge := strPendingFullCmcResponseWithChallenge is String ? BSTR.Alloc(strPendingFullCmcResponseWithChallenge).Value : strPendingFullCmcResponseWithChallenge

        result := ComCall(7, this, "int", Encoding, "ptr", strPendingFullCmcResponseWithChallenge, "HRESULT")
        return result
    }

    /**
     * Decrypts the challenge from the Certificate Management over CMS (CMC) response and creates a re-encrypted response to send to the CA.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the  attestation challenge. The default value is XCN_CRYPT_STRING_BASE64.
     * @returns {BSTR} The decrypted challenge from the CMC response re-encrypted for the CA.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertificateattestationchallenge-decryptchallenge
     */
    DecryptChallenge(Encoding) {
        pstrEnvelopedPkcs7ReencryptedToCA := BSTR()
        result := ComCall(8, this, "int", Encoding, "ptr", pstrEnvelopedPkcs7ReencryptedToCA, "HRESULT")
        return pstrEnvelopedPkcs7ReencryptedToCA
    }

    /**
     * Gets the request ID from the Certificate Management over CMS (CMC) response.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertificateattestationchallenge-get_requestid
     */
    get_RequestID() {
        pstrRequestID := BSTR()
        result := ComCall(9, this, "ptr", pstrRequestID, "HRESULT")
        return pstrRequestID
    }
}
