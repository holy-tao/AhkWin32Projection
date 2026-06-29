#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\CERTTRANSBLOB.ahk" { CERTTRANSBLOB }
#Import ".\X509SCEPDisposition.ahk" { X509SCEPDisposition }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The NDES Policy Module Interface. When installed against an enterprise CA, NDES generates a password after checking that the user has enrollment permission on the configured NDES templates, both user and machine templates.
 * @see https://learn.microsoft.com/windows/win32/api/certpol/nn-certpol-indespolicy
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct INDESPolicy extends IUnknown {
    /**
     * The interface identifier for INDESPolicy
     * @type {Guid}
     */
    static IID := Guid("{13ca515d-431d-46cc-8c2e-1da269bbd625}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INDESPolicy interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize        : IntPtr
        Uninitialize      : IntPtr
        GenerateChallenge : IntPtr
        VerifyRequest     : IntPtr
        Notify            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INDESPolicy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the NDES policy module.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certpol/nf-certpol-indespolicy-initialize
     */
    Initialize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Uninitializes the NDES policy module.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certpol/nf-certpol-indespolicy-uninitialize
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
     * @see https://learn.microsoft.com/windows/win32/api/certpol/nf-certpol-indespolicy-generatechallenge
     */
    GenerateChallenge(pwszTemplate, pwszParams) {
        pwszTemplate := pwszTemplate is String ? StrPtr(pwszTemplate) : pwszTemplate
        pwszParams := pwszParams is String ? StrPtr(pwszParams) : pwszParams

        result := ComCall(5, this, "ptr", pwszTemplate, "ptr", pwszParams, PWSTR.Ptr, &ppwszResponse := 0, "HRESULT")
        return ppwszResponse
    }

    /**
     * Verifies the NDES certificate request for submission to the CA.
     * @param {Pointer<CERTTRANSBLOB>} pctbRequest The encoded PKCS#10 request.
     * @param {Pointer<CERTTRANSBLOB>} pctbSigningCertEncoded The valid signing certificate for a renewal request.
     * @param {PWSTR} pwszTemplate The template being requested for, as determined by NDES.
     * @param {PWSTR} pwszTransactionId The SCEP request transaction ID.
     * @returns {BOOL} True if the challenge is verified; otherwise false.
     * @see https://learn.microsoft.com/windows/win32/api/certpol/nf-certpol-indespolicy-verifyrequest
     */
    VerifyRequest(pctbRequest, pctbSigningCertEncoded, pwszTemplate, pwszTransactionId) {
        pwszTemplate := pwszTemplate is String ? StrPtr(pwszTemplate) : pwszTemplate
        pwszTransactionId := pwszTransactionId is String ? StrPtr(pwszTransactionId) : pwszTransactionId

        result := ComCall(6, this, CERTTRANSBLOB.Ptr, pctbRequest, CERTTRANSBLOB.Ptr, pctbSigningCertEncoded, "ptr", pwszTemplate, "ptr", pwszTransactionId, BOOL.Ptr, &pfVerified := 0, "HRESULT")
        return pfVerified
    }

    /**
     * Notifies the plug-in of the transaction status of the SCEP certificate request.
     * @param {PWSTR} pwszChallenge The authentication and authorization SCEP challenge password for the user.
     * @param {PWSTR} pwszTransactionId The SCEP request transaction ID.
     * @param {X509SCEPDisposition} disposition The disposition of the transaction.
     * @param {Integer} lastHResult The <b>HRESULT</b> of the last operation.
     * @param {Pointer<CERTTRANSBLOB>} pctbIssuedCertEncoded The requested certificate, if issued.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certpol/nf-certpol-indespolicy-notify
     */
    Notify(pwszChallenge, pwszTransactionId, disposition, lastHResult, pctbIssuedCertEncoded) {
        pwszChallenge := pwszChallenge is String ? StrPtr(pwszChallenge) : pwszChallenge
        pwszTransactionId := pwszTransactionId is String ? StrPtr(pwszTransactionId) : pwszTransactionId

        result := ComCall(7, this, "ptr", pwszChallenge, "ptr", pwszTransactionId, X509SCEPDisposition, disposition, "int", lastHResult, CERTTRANSBLOB.Ptr, pctbIssuedCertEncoded, "HRESULT")
        return result
    }

    Query(iid) {
        if (INDESPolicy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 1)
        this.vtbl.Uninitialize := CallbackCreate(GetMethod(implObj, "Uninitialize"), flags, 1)
        this.vtbl.GenerateChallenge := CallbackCreate(GetMethod(implObj, "GenerateChallenge"), flags, 4)
        this.vtbl.VerifyRequest := CallbackCreate(GetMethod(implObj, "VerifyRequest"), flags, 6)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Uninitialize)
        CallbackFree(this.vtbl.GenerateChallenge)
        CallbackFree(this.vtbl.VerifyRequest)
        CallbackFree(this.vtbl.Notify)
    }
}
