#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The NDES Policy Module Interface. When installed against an enterprise CA, NDES generates a password after checking that the user has enrollment permission on the configured NDES templates, both user and machine templates.
 * @see https://docs.microsoft.com/windows/win32/api//certpol/nn-certpol-indespolicy
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class INDESPolicy extends IUnknown{
    /**
     * The interface identifier for INDESPolicy
     * @type {Guid}
     */
    static IID => Guid("{13ca515d-431d-46cc-8c2e-1da269bbd625}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
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
    Initialize() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Uninitialize() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszTemplate 
     * @param {PWSTR} pwszParams 
     * @param {Pointer<PWSTR>} ppwszResponse 
     * @returns {HRESULT} 
     */
    GenerateChallenge(pwszTemplate, pwszParams, ppwszResponse) {
        pwszTemplate := pwszTemplate is String ? StrPtr(pwszTemplate) : pwszTemplate
        pwszParams := pwszParams is String ? StrPtr(pwszParams) : pwszParams

        result := ComCall(5, this, "ptr", pwszTemplate, "ptr", pwszParams, "ptr", ppwszResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CERTTRANSBLOB>} pctbRequest 
     * @param {Pointer<CERTTRANSBLOB>} pctbSigningCertEncoded 
     * @param {PWSTR} pwszTemplate 
     * @param {PWSTR} pwszTransactionId 
     * @param {Pointer<BOOL>} pfVerified 
     * @returns {HRESULT} 
     */
    VerifyRequest(pctbRequest, pctbSigningCertEncoded, pwszTemplate, pwszTransactionId, pfVerified) {
        pwszTemplate := pwszTemplate is String ? StrPtr(pwszTemplate) : pwszTemplate
        pwszTransactionId := pwszTransactionId is String ? StrPtr(pwszTransactionId) : pwszTransactionId

        result := ComCall(6, this, "ptr", pctbRequest, "ptr", pctbSigningCertEncoded, "ptr", pwszTemplate, "ptr", pwszTransactionId, "ptr", pfVerified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszChallenge 
     * @param {PWSTR} pwszTransactionId 
     * @param {Integer} disposition 
     * @param {Integer} lastHResult 
     * @param {Pointer<CERTTRANSBLOB>} pctbIssuedCertEncoded 
     * @returns {HRESULT} 
     */
    Notify(pwszChallenge, pwszTransactionId, disposition, lastHResult, pctbIssuedCertEncoded) {
        pwszChallenge := pwszChallenge is String ? StrPtr(pwszChallenge) : pwszChallenge
        pwszTransactionId := pwszTransactionId is String ? StrPtr(pwszTransactionId) : pwszTransactionId

        result := ComCall(7, this, "ptr", pwszChallenge, "ptr", pwszTransactionId, "int", disposition, "int", lastHResult, "ptr", pctbIssuedCertEncoded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
