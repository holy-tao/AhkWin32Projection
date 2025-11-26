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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Uninitialize", "GenerateChallenge", "VerifyRequest", "Notify"]

    /**
     * Initializes the NDES policy module.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-indespolicy-initialize
     */
    Initialize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Uninitializes the NDES policy module.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-indespolicy-uninitialize
     */
    Uninitialize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Performs the policy decision whether to issue a challenge password to the SCEP client.
     * @param {PWSTR} pwszTemplate The template being requested for, as determined by NDES.
     * @param {PWSTR} pwszParams Parameters specific to the policy module implementation.
     * @returns {PWSTR} After the user has been authenticated and authorized, the <i>ppwsxResponse</i> parameter contains the SCEP challenge password for the user. NDES will free this resource.
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-indespolicy-generatechallenge
     */
    GenerateChallenge(pwszTemplate, pwszParams) {
        pwszTemplate := pwszTemplate is String ? StrPtr(pwszTemplate) : pwszTemplate
        pwszParams := pwszParams is String ? StrPtr(pwszParams) : pwszParams

        result := ComCall(5, this, "ptr", pwszTemplate, "ptr", pwszParams, "ptr*", &ppwszResponse := 0, "HRESULT")
        return ppwszResponse
    }

    /**
     * Verifies the NDES certificate request for submission to the CA.
     * @param {Pointer<CERTTRANSBLOB>} pctbRequest The encoded PKCS#10 request.
     * @param {Pointer<CERTTRANSBLOB>} pctbSigningCertEncoded The valid signing certificate for a renewal request.
     * @param {PWSTR} pwszTemplate The template being requested for, as determined by NDES.
     * @param {PWSTR} pwszTransactionId The SCEP request transaction ID.
     * @returns {BOOL} True if the challenge is verified; otherwise false.
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-indespolicy-verifyrequest
     */
    VerifyRequest(pctbRequest, pctbSigningCertEncoded, pwszTemplate, pwszTransactionId) {
        pwszTemplate := pwszTemplate is String ? StrPtr(pwszTemplate) : pwszTemplate
        pwszTransactionId := pwszTransactionId is String ? StrPtr(pwszTransactionId) : pwszTransactionId

        result := ComCall(6, this, "ptr", pctbRequest, "ptr", pctbSigningCertEncoded, "ptr", pwszTemplate, "ptr", pwszTransactionId, "int*", &pfVerified := 0, "HRESULT")
        return pfVerified
    }

    /**
     * Notifies the plug-in of the transaction status of the SCEP certificate request.
     * @param {PWSTR} pwszChallenge The authentication and authorization SCEP challenge password for the user.
     * @param {PWSTR} pwszTransactionId The SCEP request transaction ID.
     * @param {Integer} disposition The disposition of the transaction.
     * @param {Integer} lastHResult The <b>HRESULT</b> of the last operation.
     * @param {Pointer<CERTTRANSBLOB>} pctbIssuedCertEncoded The requested certificate, if issued.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-indespolicy-notify
     */
    Notify(pwszChallenge, pwszTransactionId, disposition, lastHResult, pctbIssuedCertEncoded) {
        pwszChallenge := pwszChallenge is String ? StrPtr(pwszChallenge) : pwszChallenge
        pwszTransactionId := pwszTransactionId is String ? StrPtr(pwszTransactionId) : pwszTransactionId

        result := ComCall(7, this, "ptr", pwszChallenge, "ptr", pwszTransactionId, "int", disposition, "int", lastHResult, "ptr", pctbIssuedCertEncoded, "HRESULT")
        return result
    }
}
