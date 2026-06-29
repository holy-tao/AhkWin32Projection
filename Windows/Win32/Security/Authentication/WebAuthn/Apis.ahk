#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS.ahk" { WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS }
#Import ".\WEBAUTHN_RP_ENTITY_INFORMATION.ahk" { WEBAUTHN_RP_ENTITY_INFORMATION }
#Import ".\WEBAUTHN_ASSERTION.ahk" { WEBAUTHN_ASSERTION }
#Import ".\WEBAUTHN_CREDENTIAL_ATTESTATION.ahk" { WEBAUTHN_CREDENTIAL_ATTESTATION }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\WEBAUTHN_AUTHENTICATOR_DETAILS_LIST.ahk" { WEBAUTHN_AUTHENTICATOR_DETAILS_LIST }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WEBAUTHN_CLIENT_DATA.ahk" { WEBAUTHN_CLIENT_DATA }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WEBAUTHN_USER_ENTITY_INFORMATION.ahk" { WEBAUTHN_USER_ENTITY_INFORMATION }
#Import ".\WEBAUTHN_COSE_CREDENTIAL_PARAMETERS.ahk" { WEBAUTHN_COSE_CREDENTIAL_PARAMETERS }
#Import ".\WEBAUTHN_CREDENTIAL_DETAILS_LIST.ahk" { WEBAUTHN_CREDENTIAL_DETAILS_LIST }
#Import ".\WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS.ahk" { WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\WEBAUTHN_GET_CREDENTIALS_OPTIONS.ahk" { WEBAUTHN_GET_CREDENTIALS_OPTIONS }
#Import ".\WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS.ahk" { WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */

;@region Functions
/**
 * Gets the API version number.
 * @returns {Integer} The WebAuthN API version number.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetapiversionnumber
 */
export WebAuthNGetApiVersionNumber() {
    result := DllCall("webauthn.dll\WebAuthNGetApiVersionNumber", UInt32)
    return result
}

/**
 * Determines if the platform authenticator service is available.
 * @returns {BOOL} A pointer to a **BOOL** that is set to **TRUE** if the authenticator service is available, or **FALSE** otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnisuserverifyingplatformauthenticatoravailable
 */
export WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable() {
    result := DllCall("webauthn.dll\WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable", BOOL.Ptr, &pbIsUserVerifyingPlatformAuthenticatorAvailable := 0, "HRESULT")
    return pbIsUserVerifyingPlatformAuthenticatorAvailable
}

/**
 * Creates a public key credential source bound to a managing authenticator and returns the credential public key associated with its credential private key.
 * @param {HWND} _hWnd The handle for the window that will be used to display the UI.
 * @param {Pointer<WEBAUTHN_RP_ENTITY_INFORMATION>} pRpInformation The Relying Party's **WEBAUTHN_RP_ENTITY_INFORMATION**.
 * @param {Pointer<WEBAUTHN_USER_ENTITY_INFORMATION>} pUserInformation The user account’s **WEBAUTHN_USER_ENTITY_INFORMATION**, containing the user handle given by the Relying Party.
 * @param {Pointer<WEBAUTHN_COSE_CREDENTIAL_PARAMETERS>} pPubKeyCredParams A sequence of pairs of public key credential type and public key algorithms requested by the Relying Party. This sequence is ordered from most preferred to least preferred. The authenticator makes a best-effort to create the most preferred credential that it can.
 * @param {Pointer<WEBAUTHN_CLIENT_DATA>} pWebAuthNClientData The client data to be sent to the authenticator for the Relying Party.
 * @param {Pointer<WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS>} pWebAuthNMakeCredentialOptions Provides the options to use when creating the public key credential source.
 * @returns {Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>} On successful completion of this operation, the authenticator returns the attestation object to the client.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnauthenticatormakecredential
 */
export WebAuthNAuthenticatorMakeCredential(_hWnd, pRpInformation, pUserInformation, pPubKeyCredParams, pWebAuthNClientData, pWebAuthNMakeCredentialOptions) {
    result := DllCall("webauthn.dll\WebAuthNAuthenticatorMakeCredential", HWND, _hWnd, WEBAUTHN_RP_ENTITY_INFORMATION.Ptr, pRpInformation, WEBAUTHN_USER_ENTITY_INFORMATION.Ptr, pUserInformation, WEBAUTHN_COSE_CREDENTIAL_PARAMETERS.Ptr, pPubKeyCredParams, WEBAUTHN_CLIENT_DATA.Ptr, pWebAuthNClientData, WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS.Ptr, pWebAuthNMakeCredentialOptions, "ptr*", &ppWebAuthNCredentialAttestation := 0, "HRESULT")
    return ppWebAuthNCredentialAttestation
}

/**
 * Produces an assertion signature representing an assertion by the authenticator that the user has consented to a specific transaction.
 * @remarks
 * > Note:
 * > Before performing this operation, all other operations in progress in the authenticator session MUST be aborted by running the [WebAuthNCancelCurrentOperation](./nf-webauthn-webauthncancelcurrentoperation.md) operation.
 * 
 * If the authenticator cannot find any credential corresponding to the specified Relying Party that matches the specified criteria, it terminates the operation and returns an error.
 * @param {HWND} _hWnd The handle for the window that will be used to display the UI.
 * @param {PWSTR} pwszRpId The ID of the Relying Party.
 * @param {Pointer<WEBAUTHN_CLIENT_DATA>} pWebAuthNClientData The client data to be sent to the authenticator for the Relying Party.
 * @param {Pointer<WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS>} pWebAuthNGetAssertionOptions The options for the **WebAuthNAuthenticatorGetAssertion** operation.
 * @returns {Pointer<WEBAUTHN_ASSERTION>} A pointer to a **WEBAUTHN_ASSERTION** that receives the assertion.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnauthenticatorgetassertion
 */
export WebAuthNAuthenticatorGetAssertion(_hWnd, pwszRpId, pWebAuthNClientData, pWebAuthNGetAssertionOptions) {
    pwszRpId := pwszRpId is String ? StrPtr(pwszRpId) : pwszRpId

    result := DllCall("webauthn.dll\WebAuthNAuthenticatorGetAssertion", HWND, _hWnd, "ptr", pwszRpId, WEBAUTHN_CLIENT_DATA.Ptr, pWebAuthNClientData, WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS.Ptr, pWebAuthNGetAssertionOptions, "ptr*", &ppWebAuthNAssertion := 0, "HRESULT")
    return ppWebAuthNAssertion
}

/**
 * Frees a previously allocated credential attestation.
 * @param {Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>} pWebAuthNCredentialAttestation The credential attestation to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreecredentialattestation
 */
export WebAuthNFreeCredentialAttestation(pWebAuthNCredentialAttestation) {
    DllCall("webauthn.dll\WebAuthNFreeCredentialAttestation", WEBAUTHN_CREDENTIAL_ATTESTATION.Ptr, pWebAuthNCredentialAttestation)
}

/**
 * Frees a previously allocated WebAuthN assertion.
 * @param {Pointer<WEBAUTHN_ASSERTION>} pWebAuthNAssertion The **WEBAUTHN_ASSERTION** to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreeassertion
 */
export WebAuthNFreeAssertion(pWebAuthNAssertion) {
    DllCall("webauthn.dll\WebAuthNFreeAssertion", WEBAUTHN_ASSERTION.Ptr, pWebAuthNAssertion)
}

/**
 * Gets the cancellation ID for a canceled operation.
 * @param {Pointer<Guid>} pCancellationId The **GUID** returned, representing the ID of the cancelled operation.
 * @returns {HRESULT} An **HRESULT** indicating success or failure.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetcancellationid
 */
export WebAuthNGetCancellationId(pCancellationId) {
    result := DllCall("webauthn.dll\WebAuthNGetCancellationId", Guid.Ptr, pCancellationId, "HRESULT")
    return result
}

/**
 * Terminates operation currently in progress in the authenticator session.
 * @remarks
 * This operation is ignored if it is invoked in an authenticator session which does not have an **WebAuthNAuthenticatorMakeCredential** or **WebAuthNAuthenticatorGetAssertion** operation currently in progress.
 * @param {Pointer<Guid>} pCancellationId The **GUID** returned, representing the ID of the cancelled operation.
 * @returns {HRESULT} Returns an **HRESULT** indicating success or failure.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthncancelcurrentoperation
 */
export WebAuthNCancelCurrentOperation(pCancellationId) {
    result := DllCall("webauthn.dll\WebAuthNCancelCurrentOperation", Guid.Ptr, pCancellationId, "HRESULT")
    return result
}

/**
 * Gets the list of stored credentials.
 * @param {Pointer<WEBAUTHN_GET_CREDENTIALS_OPTIONS>} pGetCredentialsOptions The options for the operation.
 * @returns {Pointer<WEBAUTHN_CREDENTIAL_DETAILS_LIST>} The credentials list returned by the operation.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetplatformcredentiallist
 */
export WebAuthNGetPlatformCredentialList(pGetCredentialsOptions) {
    result := DllCall("webauthn.dll\WebAuthNGetPlatformCredentialList", WEBAUTHN_GET_CREDENTIALS_OPTIONS.Ptr, pGetCredentialsOptions, "ptr*", &ppCredentialDetailsList := 0, "HRESULT")
    return ppCredentialDetailsList
}

/**
 * Frees the allocation for the platform credential list.
 * @param {Pointer<WEBAUTHN_CREDENTIAL_DETAILS_LIST>} pCredentialDetailsList The platform credential list to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreeplatformcredentiallist
 */
export WebAuthNFreePlatformCredentialList(pCredentialDetailsList) {
    DllCall("webauthn.dll\WebAuthNFreePlatformCredentialList", WEBAUTHN_CREDENTIAL_DETAILS_LIST.Ptr, pCredentialDetailsList)
}

/**
 * Removes a credential source stored on an authenticator.
 * @param {Integer} cbCredentialId The ID of the credential to be removed.
 * @param {Integer} pbCredentialId A pointer to the credential ID to be removed.
 * @returns {HRESULT} Returns an **HRESULT** indicating success or failure.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthndeleteplatformcredential
 */
export WebAuthNDeletePlatformCredential(cbCredentialId, pbCredentialId) {
    result := DllCall("webauthn.dll\WebAuthNDeletePlatformCredential", "uint", cbCredentialId, "ptr", pbCredentialId, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS>} pWebAuthNGetAuthenticatorListOptions 
 * @returns {Pointer<WEBAUTHN_AUTHENTICATOR_DETAILS_LIST>} 
 */
export WebAuthNGetAuthenticatorList(pWebAuthNGetAuthenticatorListOptions) {
    result := DllCall("webauthn.dll\WebAuthNGetAuthenticatorList", WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS.Ptr, pWebAuthNGetAuthenticatorListOptions, "ptr*", &ppAuthenticatorDetailsList := 0, "HRESULT")
    return ppAuthenticatorDetailsList
}

/**
 * 
 * @param {Pointer<WEBAUTHN_AUTHENTICATOR_DETAILS_LIST>} pAuthenticatorDetailsList 
 * @returns {String} Nothing - always returns an empty string
 */
export WebAuthNFreeAuthenticatorList(pAuthenticatorDetailsList) {
    DllCall("webauthn.dll\WebAuthNFreeAuthenticatorList", WEBAUTHN_AUTHENTICATOR_DETAILS_LIST.Ptr, pAuthenticatorDetailsList)
}

/**
 * Gets the error name for an error code.
 * @remarks
 * Returns the following error codes:
 * 
 * | Error Code | Error Name |
 * |------------|------------|
 * | **S_OK** | Success |
 * | **NTE_EXISTS** | InvalidStateError |
 * | **HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)**<br>**NTE_NOT_SUPPORTED**<br>**NTE_TOKEN_KEYSET_STORAGE_FULL** | ConstraintError |
 * | **NTE_INVALID_PARAMETER** | NotSupporedError |
 * | **NTE_DEVICE_NOT_FOUND**<br>**NTE_NOT_FOUND**<br>**HRESULT_FROM_WIN32(ERROR_CANCELLED)**<br>**NTE_USER_CANCELLED**<br>**HRESULT_FROM_WIN32(ERROR_TIMEOUT)** | NotAllowedError |
 * | All other **HRESULT** values | UnknownError |
 * @param {HRESULT} hr The **HRESULT** to get the error name for.
 * @returns {PWSTR} An error name string.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngeterrorname
 */
export WebAuthNGetErrorName(hr) {
    result := DllCall("webauthn.dll\WebAuthNGetErrorName", "int", hr, PWSTR)
    return result
}

/**
 * Gets the W3C DOM error code for the last failed operation.
 * @param {HRESULT} hr The **HRESULT** returned by the last failed operation in the session.
 * @returns {HRESULT} An **HRESULT** with the failure status.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetw3cexceptiondomerror
 */
export WebAuthNGetW3CExceptionDOMError(hr) {
    result := DllCall("webauthn.dll\WebAuthNGetW3CExceptionDOMError", "int", hr, "HRESULT")
    return result
}

;@endregion Functions
