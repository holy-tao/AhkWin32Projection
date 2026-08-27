#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AUTHENTICATOR_STATE.ahk" { AUTHENTICATOR_STATE }
#Import ".\WEBAUTHN_ASSERTION.ahk" { WEBAUTHN_ASSERTION }
#Import ".\WEBAUTHN_AUTHENTICATOR_DETAILS_LIST.ahk" { WEBAUTHN_AUTHENTICATOR_DETAILS_LIST }
#Import ".\WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS.ahk" { WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS }
#Import ".\WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS.ahk" { WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS }
#Import ".\WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS.ahk" { WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS }
#Import ".\WEBAUTHN_CLIENT_DATA.ahk" { WEBAUTHN_CLIENT_DATA }
#Import ".\WEBAUTHN_COSE_CREDENTIAL_PARAMETERS.ahk" { WEBAUTHN_COSE_CREDENTIAL_PARAMETERS }
#Import ".\WEBAUTHN_CREDENTIAL_ATTESTATION.ahk" { WEBAUTHN_CREDENTIAL_ATTESTATION }
#Import ".\WEBAUTHN_CREDENTIAL_DETAILS_LIST.ahk" { WEBAUTHN_CREDENTIAL_DETAILS_LIST }
#Import ".\WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST.ahk" { WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST }
#Import ".\WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE.ahk" { WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE }
#Import ".\WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST.ahk" { WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST }
#Import ".\WEBAUTHN_GET_CREDENTIALS_OPTIONS.ahk" { WEBAUTHN_GET_CREDENTIALS_OPTIONS }
#Import ".\WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS.ahk" { WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS }
#Import ".\WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE.ahk" { WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE }
#Import ".\WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS.ahk" { WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS }
#Import ".\WEBAUTHN_PLUGIN_STATUS_CHANGE_CALLBACK.ahk" { WEBAUTHN_PLUGIN_STATUS_CHANGE_CALLBACK }
#Import ".\WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS.ahk" { WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS }
#Import ".\WEBAUTHN_PLUGIN_USER_VERIFICATION_REQUEST.ahk" { WEBAUTHN_PLUGIN_USER_VERIFICATION_REQUEST }
#Import ".\WEBAUTHN_RP_ENTITY_INFORMATION.ahk" { WEBAUTHN_RP_ENTITY_INFORMATION }
#Import ".\WEBAUTHN_USER_ENTITY_INFORMATION.ahk" { WEBAUTHN_USER_ENTITY_INFORMATION }

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
    pWebAuthNMakeCredentialOptionsMarshal := pWebAuthNMakeCredentialOptions == 0 ? IntPtr : WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS.Ptr

    result := DllCall("webauthn.dll\WebAuthNAuthenticatorMakeCredential", HWND, _hWnd, WEBAUTHN_RP_ENTITY_INFORMATION.Ptr, pRpInformation, WEBAUTHN_USER_ENTITY_INFORMATION.Ptr, pUserInformation, WEBAUTHN_COSE_CREDENTIAL_PARAMETERS.Ptr, pPubKeyCredParams, WEBAUTHN_CLIENT_DATA.Ptr, pWebAuthNClientData, pWebAuthNMakeCredentialOptionsMarshal, pWebAuthNMakeCredentialOptions, "ptr*", &ppWebAuthNCredentialAttestation := 0, "HRESULT")
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

    pWebAuthNGetAssertionOptionsMarshal := pWebAuthNGetAssertionOptions == 0 ? IntPtr : WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS.Ptr

    result := DllCall("webauthn.dll\WebAuthNAuthenticatorGetAssertion", HWND, _hWnd, "ptr", pwszRpId, WEBAUTHN_CLIENT_DATA.Ptr, pWebAuthNClientData, pWebAuthNGetAssertionOptionsMarshal, pWebAuthNGetAssertionOptions, "ptr*", &ppWebAuthNAssertion := 0, "HRESULT")
    return ppWebAuthNAssertion
}

/**
 * Frees a previously allocated credential attestation.
 * @param {Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>} pWebAuthNCredentialAttestation The credential attestation to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreecredentialattestation
 */
export WebAuthNFreeCredentialAttestation(pWebAuthNCredentialAttestation) {
    pWebAuthNCredentialAttestationMarshal := pWebAuthNCredentialAttestation == 0 ? IntPtr : WEBAUTHN_CREDENTIAL_ATTESTATION.Ptr

    DllCall("webauthn.dll\WebAuthNFreeCredentialAttestation", pWebAuthNCredentialAttestationMarshal, pWebAuthNCredentialAttestation)
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
    result := DllCall("webauthn.dll\WebAuthNDeletePlatformCredential", UInt32, cbCredentialId, IntPtr, pbCredentialId, "HRESULT")
    return result
}

/**
 * @param {Pointer<WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS>} pWebAuthNGetAuthenticatorListOptions 
 * @returns {Pointer<WEBAUTHN_AUTHENTICATOR_DETAILS_LIST>} 
 */
export WebAuthNGetAuthenticatorList(pWebAuthNGetAuthenticatorListOptions) {
    pWebAuthNGetAuthenticatorListOptionsMarshal := pWebAuthNGetAuthenticatorListOptions == 0 ? IntPtr : WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS.Ptr

    result := DllCall("webauthn.dll\WebAuthNGetAuthenticatorList", pWebAuthNGetAuthenticatorListOptionsMarshal, pWebAuthNGetAuthenticatorListOptions, "ptr*", &ppAuthenticatorDetailsList := 0, "HRESULT")
    return ppAuthenticatorDetailsList
}

/**
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

/**
 * @param {Pointer<Guid>} rclsid 
 * @returns {AUTHENTICATOR_STATE} 
 */
export WebAuthNPluginGetAuthenticatorState(rclsid) {
    result := DllCall("webauthn.dll\WebAuthNPluginGetAuthenticatorState", Guid.Ptr, rclsid, "int*", &pluginAuthenticatorState := 0, "HRESULT")
    return pluginAuthenticatorState
}

/**
 * @param {Pointer<WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS>} pPluginAddAuthenticatorOptions 
 * @returns {Pointer<WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE>} 
 */
export WebAuthNPluginAddAuthenticator(pPluginAddAuthenticatorOptions) {
    result := DllCall("webauthn.dll\WebAuthNPluginAddAuthenticator", WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS.Ptr, pPluginAddAuthenticatorOptions, "ptr*", &ppPluginAddAuthenticatorResponse := 0, "HRESULT")
    return ppPluginAddAuthenticatorResponse
}

/**
 * @param {Pointer<WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE>} pPluginAddAuthenticatorResponse 
 * @returns {String} Nothing - always returns an empty string
 */
export WebAuthNPluginFreeAddAuthenticatorResponse(pPluginAddAuthenticatorResponse) {
    pPluginAddAuthenticatorResponseMarshal := pPluginAddAuthenticatorResponse == 0 ? IntPtr : WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE.Ptr

    DllCall("webauthn.dll\WebAuthNPluginFreeAddAuthenticatorResponse", pPluginAddAuthenticatorResponseMarshal, pPluginAddAuthenticatorResponse)
}

/**
 * @param {Pointer<Guid>} rclsid 
 * @returns {HRESULT} 
 */
export WebAuthNPluginRemoveAuthenticator(rclsid) {
    result := DllCall("webauthn.dll\WebAuthNPluginRemoveAuthenticator", Guid.Ptr, rclsid, "HRESULT")
    return result
}

/**
 * @param {Pointer<WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS>} pPluginUpdateAuthenticatorDetails 
 * @returns {HRESULT} 
 */
export WebAuthNPluginUpdateAuthenticatorDetails(pPluginUpdateAuthenticatorDetails) {
    result := DllCall("webauthn.dll\WebAuthNPluginUpdateAuthenticatorDetails", WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS.Ptr, pPluginUpdateAuthenticatorDetails, "HRESULT")
    return result
}

/**
 * @param {Pointer<Guid>} rclsid 
 * @param {Integer} cCredentialDetails 
 * @param {Pointer<WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS>} pCredentialDetails 
 * @returns {HRESULT} 
 */
export WebAuthNPluginAuthenticatorAddCredentials(rclsid, cCredentialDetails, pCredentialDetails) {
    result := DllCall("webauthn.dll\WebAuthNPluginAuthenticatorAddCredentials", Guid.Ptr, rclsid, UInt32, cCredentialDetails, WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS.Ptr, pCredentialDetails, "HRESULT")
    return result
}

/**
 * @param {Pointer<Guid>} rclsid 
 * @param {Integer} cCredentialDetails 
 * @param {Pointer<WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS>} pCredentialDetails 
 * @returns {HRESULT} 
 */
export WebAuthNPluginAuthenticatorRemoveCredentials(rclsid, cCredentialDetails, pCredentialDetails) {
    result := DllCall("webauthn.dll\WebAuthNPluginAuthenticatorRemoveCredentials", Guid.Ptr, rclsid, UInt32, cCredentialDetails, WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS.Ptr, pCredentialDetails, "HRESULT")
    return result
}

/**
 * @param {Pointer<Guid>} rclsid 
 * @returns {HRESULT} 
 */
export WebAuthNPluginAuthenticatorRemoveAllCredentials(rclsid) {
    result := DllCall("webauthn.dll\WebAuthNPluginAuthenticatorRemoveAllCredentials", Guid.Ptr, rclsid, "HRESULT")
    return result
}

/**
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Integer>} pcCredentialDetails 
 * @param {Pointer<Pointer<WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS>>} ppCredentialDetailsArray 
 * @returns {HRESULT} 
 */
export WebAuthNPluginAuthenticatorGetAllCredentials(rclsid, pcCredentialDetails, ppCredentialDetailsArray) {
    pcCredentialDetailsMarshal := pcCredentialDetails is VarRef ? "uint*" : IntPtr
    ppCredentialDetailsArrayMarshal := ppCredentialDetailsArray is VarRef ? "ptr*" : IntPtr

    result := DllCall("webauthn.dll\WebAuthNPluginAuthenticatorGetAllCredentials", Guid.Ptr, rclsid, pcCredentialDetailsMarshal, pcCredentialDetails, ppCredentialDetailsArrayMarshal, ppCredentialDetailsArray, "HRESULT")
    return result
}

/**
 * @param {Integer} cCredentialDetails 
 * @param {Pointer<WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS>} pCredentialDetailsArray 
 * @returns {String} Nothing - always returns an empty string
 */
export WebAuthNPluginAuthenticatorFreeCredentialDetailsArray(cCredentialDetails, pCredentialDetailsArray) {
    DllCall("webauthn.dll\WebAuthNPluginAuthenticatorFreeCredentialDetailsArray", UInt32, cCredentialDetails, WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS.Ptr, pCredentialDetailsArray)
}

/**
 * @param {Pointer<WEBAUTHN_PLUGIN_USER_VERIFICATION_REQUEST>} pPluginUserVerification 
 * @param {Pointer<Integer>} pcbResponse 
 * @param {Pointer<Pointer<Integer>>} ppbResponse 
 * @returns {HRESULT} 
 */
export WebAuthNPluginPerformUserVerification(pPluginUserVerification, pcbResponse, ppbResponse) {
    pcbResponseMarshal := pcbResponse is VarRef ? "uint*" : IntPtr
    ppbResponseMarshal := ppbResponse is VarRef ? "ptr*" : IntPtr

    result := DllCall("webauthn.dll\WebAuthNPluginPerformUserVerification", WEBAUTHN_PLUGIN_USER_VERIFICATION_REQUEST.Ptr, pPluginUserVerification, pcbResponseMarshal, pcbResponse, ppbResponseMarshal, ppbResponse, "HRESULT")
    return result
}

/**
 * @param {Pointer<Integer>} ppbResponse 
 * @returns {String} Nothing - always returns an empty string
 */
export WebAuthNPluginFreeUserVerificationResponse(ppbResponse) {
    ppbResponseMarshal := ppbResponse is VarRef ? "char*" : IntPtr
    ppbResponseMarshal := ppbResponse == 0 ? IntPtr : "char*"

    DllCall("webauthn.dll\WebAuthNPluginFreeUserVerificationResponse", ppbResponseMarshal, ppbResponse)
}

/**
 * @param {Pointer<Guid>} rclsid 
 * @returns {Integer} 
 */
export WebAuthNPluginGetUserVerificationCount(rclsid) {
    result := DllCall("webauthn.dll\WebAuthNPluginGetUserVerificationCount", Guid.Ptr, rclsid, "uint*", &pdwVerificationCount := 0, "HRESULT")
    return pdwVerificationCount
}

/**
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Integer>} pcbPublicKey 
 * @param {Pointer<Pointer<Integer>>} ppbPublicKey 
 * @returns {HRESULT} 
 */
export WebAuthNPluginGetUserVerificationPublicKey(rclsid, pcbPublicKey, ppbPublicKey) {
    pcbPublicKeyMarshal := pcbPublicKey is VarRef ? "uint*" : IntPtr
    ppbPublicKeyMarshal := ppbPublicKey is VarRef ? "ptr*" : IntPtr

    result := DllCall("webauthn.dll\WebAuthNPluginGetUserVerificationPublicKey", Guid.Ptr, rclsid, pcbPublicKeyMarshal, pcbPublicKey, ppbPublicKeyMarshal, ppbPublicKey, "HRESULT")
    return result
}

/**
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Integer>} pcbOpSignPubKey 
 * @param {Pointer<Pointer<Integer>>} ppbOpSignPubKey 
 * @returns {HRESULT} 
 */
export WebAuthNPluginGetOperationSigningPublicKey(rclsid, pcbOpSignPubKey, ppbOpSignPubKey) {
    pcbOpSignPubKeyMarshal := pcbOpSignPubKey is VarRef ? "uint*" : IntPtr
    ppbOpSignPubKeyMarshal := ppbOpSignPubKey is VarRef ? "ptr*" : IntPtr

    result := DllCall("webauthn.dll\WebAuthNPluginGetOperationSigningPublicKey", Guid.Ptr, rclsid, pcbOpSignPubKeyMarshal, pcbOpSignPubKey, ppbOpSignPubKeyMarshal, ppbOpSignPubKey, "HRESULT")
    return result
}

/**
 * @param {Pointer<Integer>} pbOpSignPubKey 
 * @returns {String} Nothing - always returns an empty string
 */
export WebAuthNPluginFreePublicKeyResponse(pbOpSignPubKey) {
    pbOpSignPubKeyMarshal := pbOpSignPubKey is VarRef ? "char*" : IntPtr
    pbOpSignPubKeyMarshal := pbOpSignPubKey == 0 ? IntPtr : "char*"

    DllCall("webauthn.dll\WebAuthNPluginFreePublicKeyResponse", pbOpSignPubKeyMarshal, pbOpSignPubKey)
}

/**
 * @param {Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>} pCredentialAttestation 
 * @param {Pointer<Integer>} pcbResp 
 * @param {Pointer<Pointer<Integer>>} ppbResp 
 * @returns {HRESULT} 
 */
export WebAuthNEncodeMakeCredentialResponse(pCredentialAttestation, pcbResp, ppbResp) {
    pcbRespMarshal := pcbResp is VarRef ? "uint*" : IntPtr
    ppbRespMarshal := ppbResp is VarRef ? "ptr*" : IntPtr

    result := DllCall("webauthn.dll\WebAuthNEncodeMakeCredentialResponse", WEBAUTHN_CREDENTIAL_ATTESTATION.Ptr, pCredentialAttestation, pcbRespMarshal, pcbResp, ppbRespMarshal, ppbResp, "HRESULT")
    return result
}

/**
 * @param {Integer} cbEncoded 
 * @param {Integer} pbEncoded 
 * @returns {Pointer<WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST>} 
 */
export WebAuthNDecodeMakeCredentialRequest(cbEncoded, pbEncoded) {
    result := DllCall("webauthn.dll\WebAuthNDecodeMakeCredentialRequest", UInt32, cbEncoded, IntPtr, pbEncoded, "ptr*", &ppMakeCredentialRequest := 0, "HRESULT")
    return ppMakeCredentialRequest
}

/**
 * @param {Pointer<WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST>} pMakeCredentialRequest 
 * @returns {String} Nothing - always returns an empty string
 */
export WebAuthNFreeDecodedMakeCredentialRequest(pMakeCredentialRequest) {
    pMakeCredentialRequestMarshal := pMakeCredentialRequest == 0 ? IntPtr : WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST.Ptr

    DllCall("webauthn.dll\WebAuthNFreeDecodedMakeCredentialRequest", pMakeCredentialRequestMarshal, pMakeCredentialRequest)
}

/**
 * @param {Integer} cbEncoded 
 * @param {Integer} pbEncoded 
 * @returns {Pointer<WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST>} 
 */
export WebAuthNDecodeGetAssertionRequest(cbEncoded, pbEncoded) {
    result := DllCall("webauthn.dll\WebAuthNDecodeGetAssertionRequest", UInt32, cbEncoded, IntPtr, pbEncoded, "ptr*", &ppGetAssertionRequest := 0, "HRESULT")
    return ppGetAssertionRequest
}

/**
 * @param {Pointer<WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST>} pGetAssertionRequest 
 * @returns {String} Nothing - always returns an empty string
 */
export WebAuthNFreeDecodedGetAssertionRequest(pGetAssertionRequest) {
    pGetAssertionRequestMarshal := pGetAssertionRequest == 0 ? IntPtr : WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST.Ptr

    DllCall("webauthn.dll\WebAuthNFreeDecodedGetAssertionRequest", pGetAssertionRequestMarshal, pGetAssertionRequest)
}

/**
 * @param {Pointer<WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE>} pGetAssertionResponse 
 * @param {Pointer<Integer>} pcbResp 
 * @param {Pointer<Pointer<Integer>>} ppbResp 
 * @returns {HRESULT} 
 */
export WebAuthNEncodeGetAssertionResponse(pGetAssertionResponse, pcbResp, ppbResp) {
    pcbRespMarshal := pcbResp is VarRef ? "uint*" : IntPtr
    ppbRespMarshal := ppbResp is VarRef ? "ptr*" : IntPtr

    result := DllCall("webauthn.dll\WebAuthNEncodeGetAssertionResponse", WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE.Ptr, pGetAssertionResponse, pcbRespMarshal, pcbResp, ppbRespMarshal, ppbResp, "HRESULT")
    return result
}

/**
 * @param {Pointer<WEBAUTHN_PLUGIN_STATUS_CHANGE_CALLBACK>} callback 
 * @param {Pointer<Void>} _context 
 * @param {Pointer<Guid>} rclsid 
 * @returns {Integer} 
 */
export WebAuthNPluginRegisterStatusChangeCallback(callback, _context, rclsid) {
    _contextMarshal := _context is VarRef ? "ptr" : IntPtr

    result := DllCall("webauthn.dll\WebAuthNPluginRegisterStatusChangeCallback", WEBAUTHN_PLUGIN_STATUS_CHANGE_CALLBACK, callback, _contextMarshal, _context, Guid.Ptr, rclsid, "uint*", &pdwRegister := 0, "HRESULT")
    return pdwRegister
}

/**
 * @param {Pointer<Integer>} pdwRegister 
 * @returns {HRESULT} 
 */
export WebAuthNPluginUnregisterStatusChangeCallback(pdwRegister) {
    pdwRegisterMarshal := pdwRegister is VarRef ? "uint*" : IntPtr

    result := DllCall("webauthn.dll\WebAuthNPluginUnregisterStatusChangeCallback", pdwRegisterMarshal, pdwRegister, "HRESULT")
    return result
}

;@endregion Functions
