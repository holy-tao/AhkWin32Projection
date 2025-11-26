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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} Encoding 
     * @param {BSTR} strPendingFullCmcResponseWithChallenge 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(Encoding, strPendingFullCmcResponseWithChallenge) {
        strPendingFullCmcResponseWithChallenge := strPendingFullCmcResponseWithChallenge is String ? BSTR.Alloc(strPendingFullCmcResponseWithChallenge).Value : strPendingFullCmcResponseWithChallenge

        result := ComCall(7, this, "int", Encoding, "ptr", strPendingFullCmcResponseWithChallenge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificateattestationchallenge-decryptchallenge
     */
    DecryptChallenge(Encoding) {
        pstrEnvelopedPkcs7ReencryptedToCA := BSTR()
        result := ComCall(8, this, "int", Encoding, "ptr", pstrEnvelopedPkcs7ReencryptedToCA, "HRESULT")
        return pstrEnvelopedPkcs7ReencryptedToCA
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificateattestationchallenge-get_requestid
     */
    get_RequestID() {
        pstrRequestID := BSTR()
        result := ComCall(9, this, "ptr", pstrRequestID, "HRESULT")
        return pstrRequestID
    }
}
