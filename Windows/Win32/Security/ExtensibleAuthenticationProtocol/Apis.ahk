#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EAP_METHOD_INFO_ARRAY.ahk" { EAP_METHOD_INFO_ARRAY }
#Import ".\EAP_ERROR.ahk" { EAP_ERROR }
#Import ".\EAP_CONFIG_INPUT_FIELD_ARRAY.ahk" { EAP_CONFIG_INPUT_FIELD_ARRAY }
#Import ".\EapHostPeerMethodResult.ahk" { EapHostPeerMethodResult }
#Import ".\EapHostPeerAuthParams.ahk" { EapHostPeerAuthParams }
#Import ".\EapHostPeerMethodResultReason.ahk" { EapHostPeerMethodResultReason }
#Import ".\EAP_ATTRIBUTES.ahk" { EAP_ATTRIBUTES }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\EAP_METHOD_TYPE.ahk" { EAP_METHOD_TYPE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Data\Xml\MsXml\IXMLDOMDocument2.ahk" { IXMLDOMDocument2 }
#Import ".\EAP_METHOD_PROPERTY_ARRAY.ahk" { EAP_METHOD_PROPERTY_ARRAY }
#Import ".\EapHostPeerResponseAction.ahk" { EapHostPeerResponseAction }
#Import "..\..\Data\Xml\MsXml\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import ".\EAP_INTERACTIVE_UI_DATA.ahk" { EAP_INTERACTIVE_UI_DATA }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */

;@region Functions
/**
 * Enumerates all EAP methods installed and available for use, including legacy EAP Methods.
 * @param {Pointer<EAP_METHOD_INFO_ARRAY>} pEapMethodInfoArray A pointer  to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info_array">EAP_METHOD_INFO_ARRAY</a> structure for installed EAP methods. The caller should free the inner pointers
 *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeErrorMemory</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeergetmethods
 * @since windows6.0.6000
 */
export EapHostPeerGetMethods(pEapMethodInfoArray, ppEapError) {
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerGetMethods", EAP_METHOD_INFO_ARRAY.Ptr, pEapMethodInfoArray, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Used to retrieve the properties of an EAP method given the connection and user data.
 * @remarks
 * <b>EapHostPeerGetMethodProperties</b> allows the user to retrieve the properties of an EAP method through the EAPHost supplicant interface. The properties returned by this API may be different from properties returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeergetmethods">EapHostPeerGetMethods</a> function. The <b>EapHostPeerGetMethodProperties</b> function returns the properties of an EAP method for a specific connection and user data.
 * @param {Integer} dwVersion The version number of the API. Set this parameter to zero.
 * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the EAP authentication session behavior.
 * @param {EAP_METHOD_TYPE} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the EAP method the supplicant is to use.
 * @param {HANDLE} hUserImpersonationToken A handle to the user impersonation token to use in this session.
 * @param {Integer} dwEapConnDataSize The size, in bytes, of the connection data buffer provided in <i>pbEapConnData</i>.
 * @param {Pointer<Integer>} pbEapConnData Connection data used for the EAP method. If set to <b>NULL</b>, the static property of the method, as configured in the registry, is returned.
 * @param {Integer} dwUserDataSize The size, in bytes, of the user data buffer provided in <i>pbUserData</i>.
 * @param {Pointer<Integer>} pbUserData A pointer to a byte buffer that contains the opaque user data  BLOB. This parameter can be <b>NULL</b>.
 * @param {Pointer<EAP_METHOD_PROPERTY_ARRAY>} pMethodPropertyArray A pointer to the method properties array <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property_array">EAP_METHOD_PROPERTY_ARRAY</a>. Caller should free the inner pointers using   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a> starting
 *                 at the innermost pointer. The caller should free an <b>empvString</b> value only when the type is <b>empvtString</b>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by passing a pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeErrorMemory</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeergetmethodproperties
 * @since windows6.1
 */
export EapHostPeerGetMethodProperties(dwVersion, dwFlags, eapMethodType, hUserImpersonationToken, dwEapConnDataSize, pbEapConnData, dwUserDataSize, pbUserData, pMethodPropertyArray, ppEapError) {
    pbEapConnDataMarshal := pbEapConnData is VarRef ? "char*" : "ptr"
    pbUserDataMarshal := pbUserData is VarRef ? "char*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerGetMethodProperties", "uint", dwVersion, "uint", dwFlags, EAP_METHOD_TYPE, eapMethodType, HANDLE, hUserImpersonationToken, "uint", dwEapConnDataSize, pbEapConnDataMarshal, pbEapConnData, "uint", dwUserDataSize, pbUserDataMarshal, pbUserData, EAP_METHOD_PROPERTY_ARRAY.Ptr, pMethodPropertyArray, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Starts the configuration user interface of the specified EAP method.
 * @param {HWND} hwndParent The handle of the parent window under which configuration dialog appears.
 * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
 * @param {EAP_METHOD_TYPE} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the EAP method.
 * @param {Integer} dwSizeOfConfigIn The size of input configuration. May be set to 0 (zero).
 * @param {Pointer<Integer>} pConfigIn A pointer to a byte buffer that contains configuration elements. The buffer is of size <i>dwSizeOfConfigIn</i>. This parameter can be <b>NULL</b>, if <i>dwSizeOfConfigIn</i> is set to 0 (zero).
 * @param {Pointer<Integer>} pdwSizeOfConfigOut A pointer to a DWORD that specifies the size of the buffer pointed to by <i>ppConfigOut</i>.
 * @param {Pointer<Pointer<Integer>>} ppConfigOut A pointer to a pointer to a byte buffer that contains updated configuration data from the user. After consuming the data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeconfigui
 * @since windows6.0.6000
 */
export EapHostPeerInvokeConfigUI(hwndParent, dwFlags, eapMethodType, dwSizeOfConfigIn, pConfigIn, pdwSizeOfConfigOut, ppConfigOut, ppEapError) {
    pConfigInMarshal := pConfigIn is VarRef ? "char*" : "ptr"
    pdwSizeOfConfigOutMarshal := pdwSizeOfConfigOut is VarRef ? "uint*" : "ptr"
    ppConfigOutMarshal := ppConfigOut is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerInvokeConfigUI", HWND, hwndParent, "uint", dwFlags, EAP_METHOD_TYPE, eapMethodType, "uint", dwSizeOfConfigIn, pConfigInMarshal, pConfigIn, pdwSizeOfConfigOutMarshal, pdwSizeOfConfigOut, ppConfigOutMarshal, ppConfigOut, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Allows the user to determine what kind of credentials are required by the methods to perform authentication in a Single-Sign-On (SSO) scenario.
 * @remarks
 * <b>EapHostPeerQueryCredentialInputFields</b> supports Single-Sign-On (SSO).  This supplicant function, like <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerqueryuserblobfromcredentialinputfields">EapHostPeerQueryUserBlobFromCredentialInputFields</a>, is used only in an SSO scenario.
 * 
 * <b>EapHostPeerQueryCredentialInputFields</b> obtains the fields to be displayed in the UI during the session. The input fields are obtained to display data entered by the user in the SSO UI. The <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_array">EAP_CONFIG_INPUT_FIELD_ARRAY</a> structure returned contains details on how to display the input fields.
 * 
 * After <b>EapHostPeerQueryCredentialInputFields</b>, EAPHost calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryuserblobfromcredentialinputfields">EapHostPeerQueryUserBlobFromCredentialInputFields</a>.
 * @param {HANDLE} hUserImpersonationToken A handle to the user impersonation token to use in this session.
 * @param {EAP_METHOD_TYPE} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that identifies the EAP method the supplicant is to use.
 * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
 * @param {Integer} dwEapConnDataSize The size, in bytes, of the connection data buffer provided in <i>pbEapConnData.</i>
 * @param {Pointer<Integer>} pbEapConnData Connection data used for the EAP method.
 * @param {Pointer<EAP_CONFIG_INPUT_FIELD_ARRAY>} pEapConfigInputFieldArray A pointer  to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info_array">EAP_METHOD_INFO_ARRAY</a> structure for installed EAP methods. The caller should free the inner pointers
 *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by passing a pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerquerycredentialinputfields
 * @since windows6.0.6000
 */
export EapHostPeerQueryCredentialInputFields(hUserImpersonationToken, eapMethodType, dwFlags, dwEapConnDataSize, pbEapConnData, pEapConfigInputFieldArray, ppEapError) {
    pbEapConnDataMarshal := pbEapConnData is VarRef ? "char*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerQueryCredentialInputFields", HANDLE, hUserImpersonationToken, EAP_METHOD_TYPE, eapMethodType, "uint", dwFlags, "uint", dwEapConnDataSize, pbEapConnDataMarshal, pbEapConnData, EAP_CONFIG_INPUT_FIELD_ARRAY.Ptr, pEapConfigInputFieldArray, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Obtains a credential BLOB that can be used to start authentication from user input received from the Single-Sign-On (SSO) UI.
 * @remarks
 * <b>EapHostPeerQueryUserBlobFromCredentialInputFields</b> supports SSO. This supplicant function, like <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerquerycredentialinputfields">EapHostPeerQueryCredentialInputFields</a>, is used only in an SSO scenario.
 * 
 * After <b>EapHostPeerQueryUserBlobFromCredentialInputFields</b>, EAPHost calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>. The supplicant  uses the <b>EAP_FLAG_PRE_LOGON</b> flag in <b>EapHostPeerBeginSession</b> to indicate that EAPHost should provide SSO.
 * @param {HANDLE} hUserImpersonationToken A handle to the user impersonation token to use in this session.
 * @param {EAP_METHOD_TYPE} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the type of EAP authentication to use for this session.
 * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
 * @param {Integer} dwEapConnDataSize The size, in bytes, of the connection data buffer provided in <i>pConnectionData.</i>
 * @param {Pointer<Integer>} pbEapConnData Connection data used for the EAP method.
 * @param {Pointer<EAP_CONFIG_INPUT_FIELD_ARRAY>} pEapConfigInputFieldArray A pointer  to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_array">EAP_CONFIG_INPUT_FIELD_ARRAY</a> structure the contains the UI input field data. The caller should free the inner pointers
 *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer.
 * @param {Pointer<Integer>} pdwUserBlobSize A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by <i>ppbUserBlob</i>. If this value is not set to zero, then a pointer to a buffer of the size specified in this parameter must be supplied to <i>ppbUserBlob</i>.
 * @param {Pointer<Pointer<Integer>>} ppbUserBlob A pointer to the credential BLOB that can be used in authentication.
 *                 Memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>. If a non-null value is supplied for this parameter (meaning that an existing data BLOB is passed to it), the supplied data BLOB will be updated and returned in this parameter.  If a non-NULL BLOB value is supplied, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> function should be used.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryuserblobfromcredentialinputfields
 * @since windows6.0.6000
 */
export EapHostPeerQueryUserBlobFromCredentialInputFields(hUserImpersonationToken, eapMethodType, dwFlags, dwEapConnDataSize, pbEapConnData, pEapConfigInputFieldArray, pdwUserBlobSize, ppbUserBlob, ppEapError) {
    pbEapConnDataMarshal := pbEapConnData is VarRef ? "char*" : "ptr"
    pdwUserBlobSizeMarshal := pdwUserBlobSize is VarRef ? "uint*" : "ptr"
    ppbUserBlobMarshal := ppbUserBlob is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerQueryUserBlobFromCredentialInputFields", HANDLE, hUserImpersonationToken, EAP_METHOD_TYPE, eapMethodType, "uint", dwFlags, "uint", dwEapConnDataSize, pbEapConnDataMarshal, pbEapConnData, EAP_CONFIG_INPUT_FIELD_ARRAY.Ptr, pEapConfigInputFieldArray, pdwUserBlobSizeMarshal, pdwUserBlobSize, ppbUserBlobMarshal, ppbUserBlob, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * This function is called by tunnel methods to invoke the identity UI of the inner methods. This function returns the identity as well as credentials to use in order to start the authentication.
 * @param {Integer} dwVersion The version number of the API. Must be set to zero.
 * @param {EAP_METHOD_TYPE} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the type of EAP authentication to use for this session.
 * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
 * @param {HWND} hwndParent Handle of the parent window under which the configuration dialog will show up.
 * @param {Integer} dwSizeofConnectionData Size of the buffer indicated by the <i>pConnectionData</i> parameter, in bytes.
 * @param {Pointer<Integer>} pConnectionData Pointer to configuration data that is used for the EAP method.
 * @param {Integer} dwSizeofUserData Size of the buffer indicated by the <i>pUserData</i> parameter, in bytes.
 * @param {Pointer<Integer>} pUserData Pointer to user credential information that pertains to this authentication.
 * @param {Pointer<Integer>} pdwSizeOfUserDataOut Size of the buffer set to receive the user data returned by the <i>ppUserDataOut</i> parameter, in bytes.
 * @param {Pointer<Pointer<Integer>>} ppUserDataOut A pointer to a pointer to a buffer that contains user data information returned by the method. After use, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
 * @param {Pointer<PWSTR>} ppwszIdentity A pointer to a NULL-terminated user identity string. After use, this memory must be freed by calling  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised during the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @param {Pointer<Pointer<Void>>} ppvReserved Reserved for future use.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeidentityui
 * @since windows6.0.6000
 */
export EapHostPeerInvokeIdentityUI(dwVersion, eapMethodType, dwFlags, hwndParent, dwSizeofConnectionData, pConnectionData, dwSizeofUserData, pUserData, pdwSizeOfUserDataOut, ppUserDataOut, ppwszIdentity, ppEapError, ppvReserved) {
    pConnectionDataMarshal := pConnectionData is VarRef ? "char*" : "ptr"
    pUserDataMarshal := pUserData is VarRef ? "char*" : "ptr"
    pdwSizeOfUserDataOutMarshal := pdwSizeOfUserDataOut is VarRef ? "uint*" : "ptr"
    ppUserDataOutMarshal := ppUserDataOut is VarRef ? "ptr*" : "ptr"
    ppwszIdentityMarshal := ppwszIdentity is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"
    ppvReservedMarshal := ppvReserved is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerInvokeIdentityUI", "uint", dwVersion, EAP_METHOD_TYPE, eapMethodType, "uint", dwFlags, HWND, hwndParent, "uint", dwSizeofConnectionData, pConnectionDataMarshal, pConnectionData, "uint", dwSizeofUserData, pUserDataMarshal, pUserData, pdwSizeOfUserDataOutMarshal, pdwSizeOfUserDataOut, ppUserDataOutMarshal, ppUserDataOut, ppwszIdentityMarshal, ppwszIdentity, ppEapErrorMarshal, ppEapError, ppvReservedMarshal, ppvReserved, UInt32)
    return result
}

/**
 * Raises an interactive user interface used to get credentials from the user.
 * @remarks
 * The supplicant should call [EAP_E_EAPHOST_METHOD_OPERATION_NOT_SUPPORTED](/windows/win32/eaphost/eap-related-error-and-information-constants) is returned, the supplicant should resort to the traditional model of invoking method interactive UI by calling <b>EapHostPeerInvokeInteractiveUI</b>. 
 * 
 * If called,<b>EapHostPeerInvokeInteractiveUI</b> raises the user interface for the EAP method after the supplicant calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeergetuicontext">EapHostPeerGetUIContext</a>. This occurs when a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerprocessreceivedpacket">EapHostPeerProcessReceivedPacket</a> 
 *    returns the <b>EapHostPeerResponseInvokeUi</b> action code. <b>EapHostPeerGetUIContext</b> returns UI context that 
 *    the supplicant then passes to <b>EapHostPeerInvokeInteractiveUI</b> to raise the UI.
 * @param {HWND} hwndParent The handle of the parent window under which configuration dialog appears.
 * @param {Integer} dwSizeofUIContextData The size, in bytes, of the buffer pointed to by the <i>pUIContextData</i> parameter.
 * @param {Pointer<Integer>} pUIContextData A pointer to a buffer that contains the supplicant UI context data from EAPHost. The context data is returned by  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeergetuicontext">EapHostPeerGetUIContext</a>. The buffer  is of size <i>dwSizeOfUIContextData</i>.
 * @param {Pointer<Integer>} pdwSizeOfDataFromInteractiveUI A pointer to a DWORD  that represents the size, in bytes, of the buffer pointed to by the <i>ppDataFromInteractiveUI</i> parameter.
 * @param {Pointer<Pointer<Integer>>} ppDataFromInteractiveUI A pointer to a pointer to a byte buffer that  contains data from the interactive UI necessary for authentication to continue. The parameter <i>ppDataFromInteractiveUI</i> should be passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeersetuicontext">EapHostPeerSetUIContext</a> as the IN parameter <i>pUIContextData</i>. After consuming the data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>. The buffer is of size <i>pdwSizeofDataFromInteractiveUI</i>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeinteractiveui
 * @since windows6.0.6000
 */
export EapHostPeerInvokeInteractiveUI(hwndParent, dwSizeofUIContextData, pUIContextData, pdwSizeOfDataFromInteractiveUI, ppDataFromInteractiveUI, ppEapError) {
    pUIContextDataMarshal := pUIContextData is VarRef ? "char*" : "ptr"
    pdwSizeOfDataFromInteractiveUIMarshal := pdwSizeOfDataFromInteractiveUI is VarRef ? "uint*" : "ptr"
    ppDataFromInteractiveUIMarshal := ppDataFromInteractiveUI is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerInvokeInteractiveUI", HWND, hwndParent, "uint", dwSizeofUIContextData, pUIContextDataMarshal, pUIContextData, pdwSizeOfDataFromInteractiveUIMarshal, pdwSizeOfDataFromInteractiveUI, ppDataFromInteractiveUIMarshal, ppDataFromInteractiveUI, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Obtains the input fields for interactive UI components to be raised on the supplicant.
 * @remarks
 * <b>EapHostPeerQueryInteractiveUIInputFields</b> can be employed to support Single-Sign-On (SSO). The supplicant  uses the <b>EAP_FLAG_PRE_LOGON</b> flag in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a> to indicate to EAPHost that SSO should be provided. If the <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerResponseInvokeUI</a> action code is received after calling <b>EapHostPeerBeginSession</b>, EAPHost then calls <b>EapHostPeerQueryInteractiveUIInputFields</b>, and later calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryuiblobfrominteractiveuiinputfields">EapHostPeerQueryUIBlobFromInteractiveUIInputFields</a>. 
 * 
 * The supplicant should call the [EAP_E_EAPHOST_METHOD_OPERATION_NOT_SUPPORTED](/windows/win32/eaphost/eap-related-error-and-information-constants) is returned, the supplicant should resort to the traditional model of invoking method interactive UI by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeinteractiveui">EapHostPeerInvokeInteractiveUI</a>. If there is an error, <b>EapHostPeerQueryInteractiveUIInputFields</b> will return a return code other than <b>NULL</b>.
 * @param {Integer} dwVersion The version number of the API. 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="EAPHOST_PEER_API_VERSION"></a><a id="eaphost_peer_api_version"></a><dl>
 * <dt><b>EAPHOST_PEER_API_VERSION</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The version of the EAPHost peer API.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
 * @param {Integer} dwSizeofUIContextData The size of the context data in <i>pUIContextData</i>, in bytes.
 * @param {Pointer<Integer>} pUIContextData Pointer to a BLOB that contains UI context data, represented as inner pointers to field data. These inner pointers must be freed by passing them to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting with the innermost pointer.
 * @param {Pointer<EAP_INTERACTIVE_UI_DATA>} pEapInteractiveUIData Pointer that receives an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_interactive_ui_data">EAP_INTERACTIVE_UI_DATA</a> structure that contains configuration information for interactive UI components raised on an EAP supplicant. The caller should free the inner pointers
 *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @param {Pointer<Pointer<Void>>} ppvReserved Reserved for future use. This parameter must be set to 0.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryinteractiveuiinputfields
 * @since windows6.0.6000
 */
export EapHostPeerQueryInteractiveUIInputFields(dwVersion, dwFlags, dwSizeofUIContextData, pUIContextData, pEapInteractiveUIData, ppEapError, ppvReserved) {
    pUIContextDataMarshal := pUIContextData is VarRef ? "char*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"
    ppvReservedMarshal := ppvReserved is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerQueryInteractiveUIInputFields", "uint", dwVersion, "uint", dwFlags, "uint", dwSizeofUIContextData, pUIContextDataMarshal, pUIContextData, EAP_INTERACTIVE_UI_DATA.Ptr, pEapInteractiveUIData, ppEapErrorMarshal, ppEapError, ppvReservedMarshal, ppvReserved, UInt32)
    return result
}

/**
 * Converts user information into a user BLOB that can be consumed by EAPHost run-time functions. (EapHostPeerQueryUIBlobFromInteractiveUIInputFields)
 * @remarks
 * [Supplicant API Call Sequence](/windows/win32/eaphost/supplicant-api-call-sequence).
 * @param {Integer} dwVersion The version number of the API.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="EAPHOST_PEER_API_VERSION"></a><a id="eaphost_peer_api_version"></a><dl>
 * <dt><b>EAPHOST_PEER_API_VERSION</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The version of the EAPHost Peer APIs.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
 * @param {Integer} dwSizeofUIContextData The size of the context data in <i>pUIContextData</i>, in bytes.
 * @param {Pointer<Integer>} pUIContextData Pointer to a BLOB that contains UI context data, represented as inner pointers to field data. These inner pointers must be freed by passing them to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting with the innermost pointer.
 * @param {Pointer<EAP_INTERACTIVE_UI_DATA>} pEapInteractiveUIData Pointer that receives an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_interactive_ui_data">EAP_INTERACTIVE_UI_DATA</a> structure that contains configuration information for interactive UI components raised on an EAP supplicant.
 * @param {Pointer<Integer>} pdwSizeOfDataFromInteractiveUI A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by <i>ppDataFromInteractiveUI</i>. If this value is not set to zero, then a pointer to a buffer of the size specified in this parameter must be supplied to <i>ppDataFromInteractiveUI</i>.
 * @param {Pointer<Pointer<Integer>>} ppDataFromInteractiveUI Pointer that receives a credentials BLOB that can be used in authentication.
 *                 The caller should free the inner pointers
 *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer. If a non-null value is supplied for this parameter (meaning that an existing data BLOB is passed to it), the supplied data BLOB will be updated and returned in this parameter. If a non-NULL BLOB value is supplied, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> function should be used.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @param {Pointer<Pointer<Void>>} ppvReserved Reserved for future use. This parameter must be set to 0.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryuiblobfrominteractiveuiinputfields
 * @since windows6.0.6000
 */
export EapHostPeerQueryUIBlobFromInteractiveUIInputFields(dwVersion, dwFlags, dwSizeofUIContextData, pUIContextData, pEapInteractiveUIData, pdwSizeOfDataFromInteractiveUI, ppDataFromInteractiveUI, ppEapError, ppvReserved) {
    pUIContextDataMarshal := pUIContextData is VarRef ? "char*" : "ptr"
    pdwSizeOfDataFromInteractiveUIMarshal := pdwSizeOfDataFromInteractiveUI is VarRef ? "uint*" : "ptr"
    ppDataFromInteractiveUIMarshal := ppDataFromInteractiveUI is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"
    ppvReservedMarshal := ppvReserved is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerQueryUIBlobFromInteractiveUIInputFields", "uint", dwVersion, "uint", dwFlags, "uint", dwSizeofUIContextData, pUIContextDataMarshal, pUIContextData, EAP_INTERACTIVE_UI_DATA.Ptr, pEapInteractiveUIData, pdwSizeOfDataFromInteractiveUIMarshal, pdwSizeOfDataFromInteractiveUI, ppDataFromInteractiveUIMarshal, ppDataFromInteractiveUI, ppEapErrorMarshal, ppEapError, ppvReservedMarshal, ppvReserved, UInt32)
    return result
}

/**
 * Converts XML into the configuration BLOB. (EapHostPeerConfigXml2Blob)
 * @param {Integer} dwFlags Not used. Set to 0.
 * @param {IXMLDOMNode} pConfigDoc Sends a pointer to the XML configuration to be converted.
 * @param {Pointer<Integer>} pdwSizeOfConfigOut A pointer to the size, in bytes, of the configuration BLOB.
 * @param {Pointer<Pointer<Integer>>} ppConfigOut A pointer to a pointer to a byte buffer that contains the configuration data converted from XML. The configuration data is created inside [EapHostConfig Schema](/windows/win32/eaphost/eaphostconfigschema-schema) element. The buffer is of size <i>pdwSizeOfConfigOut</i>. After consuming the data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
 * @param {Pointer<EAP_METHOD_TYPE>} pEapMethodType A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure referred to in the XML document.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised  by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerconfigxml2blob
 * @since windows6.0.6000
 */
export EapHostPeerConfigXml2Blob(dwFlags, pConfigDoc, pdwSizeOfConfigOut, ppConfigOut, pEapMethodType, ppEapError) {
    pdwSizeOfConfigOutMarshal := pdwSizeOfConfigOut is VarRef ? "uint*" : "ptr"
    ppConfigOutMarshal := ppConfigOut is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerConfigXml2Blob", "uint", dwFlags, "ptr", pConfigDoc, pdwSizeOfConfigOutMarshal, pdwSizeOfConfigOut, ppConfigOutMarshal, ppConfigOut, EAP_METHOD_TYPE.Ptr, pEapMethodType, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Generates the credentials BLOB.
 * @remarks
 * The configuration BLOB is originally returned by one of the following methods.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerconfigxml2blob">EapHostPeerConfigXml2Blob</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeconfigui">EapHostPeerInvokeConfigUI</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeergetresult">EapHostPeerGetResult</a>
 * </li>
 * </ul>
 *  The XML based credentials can come from group policy or from a system administrator.
 * @param {Integer} dwFlags Not used. Set to 0.
 * @param {IXMLDOMNode} pCredentialsDoc A pointer to an XML node of a document that contains credentials which are either user or machine credentials depending on the configuration passed in. The XML document is created with the [EapHostUserCredentials Schema](/windows/win32/eaphost/eaphostusercredentialsschema-schema).
 * @param {Integer} dwSizeOfConfigIn The size, in bytes, of the buffer pointed to by the <i>pConfigIn</i> parameter.
 * @param {Pointer<Integer>} pConfigIn A pointer to a byte buffer that contains a configuration BLOB for which the credentials are configured. The  buffer is of size <i>dwSizeofConfigIn</i>.
 * @param {Pointer<Integer>} pdwSizeOfCredentialsOut The size, in bytes, of the buffer pointed to by <i>ppCredentialsOut</i>.
 * @param {Pointer<Pointer<Integer>>} ppCredentialsOut A pointer to a pointer to a byte buffer that receives the credentials BLOB buffer generated by the input XML. The buffer can is of size <i>pdwSizeofCredentialsOut</i>. After consuming the data, this memory must be freed by calling  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
 * @param {Pointer<EAP_METHOD_TYPE>} pEapMethodType A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure referred to in the XML document.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised  by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeErrorMemory</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeercredentialsxml2blob
 * @since windows6.0.6000
 */
export EapHostPeerCredentialsXml2Blob(dwFlags, pCredentialsDoc, dwSizeOfConfigIn, pConfigIn, pdwSizeOfCredentialsOut, ppCredentialsOut, pEapMethodType, ppEapError) {
    pConfigInMarshal := pConfigIn is VarRef ? "char*" : "ptr"
    pdwSizeOfCredentialsOutMarshal := pdwSizeOfCredentialsOut is VarRef ? "uint*" : "ptr"
    ppCredentialsOutMarshal := ppCredentialsOut is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerCredentialsXml2Blob", "uint", dwFlags, "ptr", pCredentialsDoc, "uint", dwSizeOfConfigIn, pConfigInMarshal, pConfigIn, pdwSizeOfCredentialsOutMarshal, pdwSizeOfCredentialsOut, ppCredentialsOutMarshal, ppCredentialsOut, EAP_METHOD_TYPE.Ptr, pEapMethodType, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Converts the configuration BLOB to XML. (EapHostPeerConfigBlob2Xml)
 * @param {Integer} dwFlags Not used. Set to 0.
 * @param {EAP_METHOD_TYPE} eapMethodType Refers to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that is referred to in the XML document.
 * @param {Integer} dwSizeOfConfigIn The size, in bytes, of the configuration BLOB.
 * @param {Pointer<Integer>} pConfigIn A pointer to a buffer that  contains the configuration BLOB to convert.  The buffer is of size <i>dwSizeOfConfigIn</i>.
 * @param {Pointer<IXMLDOMDocument2>} ppConfigDoc A pointer to a pointer to an XML document that  contains the converted configuration. If the EAP method does not support
 *                 the [EapHostConfig Schema](/windows/win32/eaphost/eaphostconfigschema-schema) element.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerconfigblob2xml
 * @since windows6.0.6000
 */
export EapHostPeerConfigBlob2Xml(dwFlags, eapMethodType, dwSizeOfConfigIn, pConfigIn, ppConfigDoc, ppEapError) {
    pConfigInMarshal := pConfigIn is VarRef ? "char*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappcfg.dll\EapHostPeerConfigBlob2Xml", "uint", dwFlags, EAP_METHOD_TYPE, eapMethodType, "uint", dwSizeOfConfigIn, pConfigInMarshal, pConfigIn, IXMLDOMDocument2.Ptr, ppConfigDoc, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Frees memory returned by the configuration APIs.
 * @param {Pointer<Integer>} pData A pointer to the memory to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory
 * @since windows6.0.6000
 */
export EapHostPeerFreeMemory(pData) {
    pDataMarshal := pData is VarRef ? "char*" : "ptr"

    DllCall("eappcfg.dll\EapHostPeerFreeMemory", pDataMarshal, pData)
}

/**
 * Frees memory allocated to an EAP_ERROR structure.
 * @param {Pointer<EAP_ERROR>} pEapError A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that  contains the error data to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory
 * @since windows6.0.6000
 */
export EapHostPeerFreeErrorMemory(pEapError) {
    DllCall("eappcfg.dll\EapHostPeerFreeErrorMemory", EAP_ERROR.Ptr, pEapError)
}

/**
 * Initializes an EAPHost authentication session.
 * @remarks
 * <b>EapHostPeerInitialize</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeeruninitialize">EapHostPeerUninitialize</a> are always thread
 * safe.
 * 
 * The following call occurs within the <b>EapHostPeerInitialize</b> function:
 * 
 * <c>CoInitializeEx(NULL, COINIT_MULTITHREADED);</c>
 * 
 * The client should not initialize a conflicting COM environment.
 * If different COM environment (such as a single-threaded apartment) is required, the client should call  <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> directly, and not call <b>EapHostPeerInitialize</b>. If <b>CoInitializeEx</b> is called directly, then the client must call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> to uninitialize the session. In addition, the client must use COM functions (and not EAPHost supplicant functions) to allocate and free memory.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeerinitialize
 * @since windows6.0.6000
 */
export EapHostPeerInitialize() {
    result := DllCall("eappprxy.dll\EapHostPeerInitialize", UInt32)
    return result
}

/**
 * Uninitializes all EAPHost authentication sessions.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerinitialize">EapHostPeerInitialize</a> and <b>EapHostPeerUninitialize</b> are always thread
 * safe.
 * 
 * <b>EapHostPeerUninitialize</b> calls <b>CoUninitialize</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeeruninitialize
 * @since windows6.0.6000
 */
export EapHostPeerUninitialize() {
    DllCall("eappprxy.dll\EapHostPeerUninitialize")
}

/**
 * Starts an EAP authentication session.
 * @remarks
 * If an EAPHost supplicant is participating in NAP, the supplicant will respond to changes in the state of its network health. If that state changes, the supplicant must then initiate a re-authentication session as follows. 
 * 
 * <ul>
 * <li>If there is a current session when re-authentication occurs, the supplicant should tear down the current session by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerendsession">EapHostPeerEndSession</a>, and then start a new session by calling <b>EapHostPeerBeginSession</b>.</li>
 * <li>If there is no current session with re-authentication occurs, or the previous session was already ended by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerendsession">EapHostPeerEndSession</a>, the supplicant only needs to start a new session by calling <b>EapHostPeerBeginSession</b>.</li>
 * </ul>
 * The call to <b>EapHostPeerBeginSession</b> to establish the re-authentication session can be made from the callback specified in the <i>func</i> parameter  and called when the health state changes. This callback function indicates to the supplicant to tear down the network authentication associated with the GUID and re-authenticate.   
 * 
 * A  connection can be kept across multiple sessions because <b>EapHostPeerBeginSession</b> can provide a valid GUID to register the connection. When <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerendsession">EapHostPeerEndSession</a> is called, only the current session is terminated. Because the registration with the GUID isn't terminated, the original registration by <b>EapHostPeerBeginSession</b> remains intact. Therefore, the registration is effective across multiple sessions. 
 * 
 * <div class="alert"><b>Note</b>  Registering the connection refers to providing a valid GUID and valid callback function pointer.</div>
 * <div> </div>
 * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  new EAP authentication session behavior.
 * @param {EAP_METHOD_TYPE} eapType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the type of EAP authentication to use for this session.
 * @param {Pointer<EAP_ATTRIBUTES>} pAttributeArray Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EapAttributes</a> structure that specifies the EAP attributes of the entity to authenticate.
 * @param {HANDLE} hTokenImpersonateUser Handle to the user impersonation token to use in this session.
 * @param {Integer} dwSizeofConnectionData The size, in bytes, of the connection data buffer provided in <i>pConnectionData</i>.
 * @param {Pointer<Integer>} pConnectionData Describes the configuration used for authentication. <b>NULL</b> connection data is considered valid. The method should work with the default configuration.
 * @param {Integer} dwSizeofUserData The size, in bytes, of the user data buffer provided in <i>pUserData</i>.
 * @param {Pointer<Integer>} pUserData A pointer to a byte buffer that contains the opaque user data BLOB containing user data returned from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetidentity">EapPeerGetIdentity</a> function.  User data may include credentials or certificates used for authentication. <i>pUserData</i> can be <b>NULL</b>. The interpretation of a <b>NULL</b> pointer depends on the implementation of a method. The user data consists of user or machine credentials used for authentication. Typically the user data depends on the configuration data.
 * 
 * If <b>EAP_FLAG_PREFER_ALT_CREDENTIALS</b> is indicated in <i>dwflags</i>, then credentials passed into <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerbeginsession">EapPeerBeginSession</a> are preferred to all other forms of credential retrieval, even if configuration  data passed into <i>pConnectionData</i> requests a different mode of credential retrieval. If passing credentials into <b>EapPeerBeginSession</b> fails, then EAPHost resorts to method specific credential retrieval, in which case credentials could be obtained from a file, Windows login, or a certificate store, for example.
 * 
 * The EAP method author defines both the default credentials and alternate credentials. For example, in the case of EAP-MSCHAPv2 the default credentials are Windows credentials obtained from winlogon, and  alternate credentials are the credentials (user name, password, domain) passed into  <i>pUserData</i>.
 * @param {Integer} dwMaxSendPacketSize The maximum size, in bytes, of an EAP packet that can be sent during the session.
 * @param {Pointer<Guid>} pConnectionId A pointer to a GUID value that uniquely identifies the logical network interface over which the authentication of the supplicant will take place. If the supplicant seeks re-authentication after a NAP health change, it should provide a unique GUID.
 *    The parameter should be <b>NULL</b> when this function is called by a tunneling method to start its inner method.   When the <i>pConnectionId</i> parameter is <b>NULL</b>, the <i>func</i> and <i>pContextData</i> parameters are ignored.
 * @param {Pointer<NotificationHandler>} _func A <a href="https://docs.microsoft.com/windows/desktop/api/eappapis/nc-eappapis-notificationhandler">NotificationHandler</a> function pointer that provides the callback used by EAPHost to notify the supplicant when re-authentication is needed. 
 * 
 * If the function handler is <b>NULL</b>, the <i>pContextData</i> parameter is ignored. If the function handler is <b>NULL</b>, it also means that the caller is not interested in SoH change notification
 *    from the EAP quarantine enforcement client (QEC).
 * 
 * The following code shows a <a href="https://docs.microsoft.com/windows/desktop/api/eappapis/nc-eappapis-notificationhandler">NotificationHandler</a> callback call.
 * 
 * 
 * ``` syntax
 * func(*pConnectionId, pContextData);
 * ```
 * @param {Pointer<Void>} pContextData A pointer to re-authentication context data that the supplicant will associate with the connection when <i>func</i> is called. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} pSessionId A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeerbeginsession
 * @since windows6.0.6000
 */
export EapHostPeerBeginSession(dwFlags, eapType, pAttributeArray, hTokenImpersonateUser, dwSizeofConnectionData, pConnectionData, dwSizeofUserData, pUserData, dwMaxSendPacketSize, pConnectionId, _func, pContextData, pSessionId, ppEapError) {
    pConnectionDataMarshal := pConnectionData is VarRef ? "char*" : "ptr"
    pUserDataMarshal := pUserData is VarRef ? "char*" : "ptr"
    pContextDataMarshal := pContextData is VarRef ? "ptr" : "ptr"
    pSessionIdMarshal := pSessionId is VarRef ? "uint*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerBeginSession", "uint", dwFlags, EAP_METHOD_TYPE, eapType, EAP_ATTRIBUTES.Ptr, pAttributeArray, HANDLE, hTokenImpersonateUser, "uint", dwSizeofConnectionData, pConnectionDataMarshal, pConnectionData, "uint", dwSizeofUserData, pUserDataMarshal, pUserData, "uint", dwMaxSendPacketSize, Guid.Ptr, pConnectionId, "ptr", _func, pContextDataMarshal, pContextData, pSessionIdMarshal, pSessionId, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Is called by the supplicant every time the supplicant receives a packet that EAPHost needs to process.
 * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>. <i>sessionHandle</i> can be zero if the supplicant receives a new identity request not associated with any session.
 * @param {Integer} cbReceivePacket The size, in bytes, of the received packet buffer pointed to by the <i>cbReceivePacket</i> parameter.
 * @param {Pointer<Integer>} pReceivePacket A pointer to a buffer that contains the incoming EAP data received by 
 *       the supplicant.
 * @param {Pointer<EapHostPeerResponseAction>} pEapOutput A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerResponseAction</a> value that indicates the supplicant should take appropriate action. Typically the supplicant either calls 
 *       another method on EAPHost or acts  on its own.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeerprocessreceivedpacket
 * @since windows6.0.6000
 */
export EapHostPeerProcessReceivedPacket(sessionHandle, cbReceivePacket, pReceivePacket, pEapOutput, ppEapError) {
    pReceivePacketMarshal := pReceivePacket is VarRef ? "char*" : "ptr"
    pEapOutputMarshal := pEapOutput is VarRef ? "int*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerProcessReceivedPacket", "uint", sessionHandle, "uint", cbReceivePacket, pReceivePacketMarshal, pReceivePacket, pEapOutputMarshal, pEapOutput, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Is called by the supplicant when the supplicant needs to obtains a packet from EAPHost to send to the authenticator.
 * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {Pointer<Integer>} pcbSendPacket A pointer to a DWORD that specifies the maximum size, in bytes,  of the buffer pointed to by   <i>ppSendPacket</i>. <b>EapHostPeerGetSendPacket</b> on return is the size of the actual data pointed to by <i>ppSendPacket</i>.
 * @param {Pointer<Pointer<Integer>>} ppSendPacket A pointer to a pointer to a  buffer that contains the packet data returned by the EAP module. The buffer is allocated by EAPHost.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeergetsendpacket
 * @since windows6.0.6000
 */
export EapHostPeerGetSendPacket(sessionHandle, pcbSendPacket, ppSendPacket, ppEapError) {
    pcbSendPacketMarshal := pcbSendPacket is VarRef ? "uint*" : "ptr"
    ppSendPacketMarshal := ppSendPacket is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerGetSendPacket", "uint", sessionHandle, pcbSendPacketMarshal, pcbSendPacket, ppSendPacketMarshal, ppSendPacket, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Obtains the authentication result for the specified EAP authentication session.
 * @remarks
 * The supplicant calls <b>EapHostPeerGetResult</b> on completion of an authentication, which can occur in any of the following scenarios.
 *    
 * 
 * <ul>
 * <li>A call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerprocessreceivedpacket">EapHostPeerProcessReceivedPacket</a> returned the <b>EapHostPeerResponseResult</b> action code.</li>
 * <li> The client timed out and wants to get the result based on the current
 *    state.</li>
 * <li> The supplicant received an alternate result, perhaps from a packet on the 
 *    lower layer.</li>
 * </ul>
 * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {EapHostPeerMethodResultReason} reason An <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeermethodresultreason">EapHostPeerMethodResultReason</a> enumeration value that specifies the reason code for the authentication result returned in <i>ppResult</i>.
 * @param {Pointer<EapHostPeerMethodResult>} ppResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeermethodresultreason">EapHostPeerMethodResultReason</a> structure that contains the authentication results. EAPHost fills this structure with authentication related information defined in <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ns-eaphostpeertypes-eaphostpeermethodresult">EapHostPeerMethodResult</a>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. Supplicants must refer to this parameter to determine if the authentication was successful. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>. The return value does not indicate if the authentication was successful. Supplicants must refer to the <i>ppEapError</i> parameter to determine the authentication result.
 * 
 * If the function fails, the return value should be an appropriate error code from Winerror.h, Raserror.h, or Mprerror.h.
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeergetresult
 * @since windows6.0.6000
 */
export EapHostPeerGetResult(sessionHandle, reason, ppResult, ppEapError) {
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerGetResult", "uint", sessionHandle, EapHostPeerMethodResultReason, reason, EapHostPeerMethodResult.Ptr, ppResult, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Obtains the user interface context for the supplicant from EAPHost if the UI is to be raised.
 * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {Pointer<Integer>} pdwSizeOfUIContextData A pointer to a value that specifies the size, in bytes, of the UI context data  buffer returned in <i>ppUIContextData</i>.
 * @param {Pointer<Pointer<Integer>>} ppUIContextData A pointer to a pointer to a  buffer that contains the supplicant UI context data from EAPHost. The address pointed to by this parameter is passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeinteractiveui">EapHostPeerInvokeInteractiveUI</a> as IN parameter <i>pUIContextData</i>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeergetuicontext
 * @since windows6.0.6000
 */
export EapHostPeerGetUIContext(sessionHandle, pdwSizeOfUIContextData, ppUIContextData, ppEapError) {
    pdwSizeOfUIContextDataMarshal := pdwSizeOfUIContextData is VarRef ? "uint*" : "ptr"
    ppUIContextDataMarshal := ppUIContextData is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerGetUIContext", "uint", sessionHandle, pdwSizeOfUIContextDataMarshal, pdwSizeOfUIContextData, ppUIContextDataMarshal, ppUIContextData, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Provides a new or updated user interface context to the EAP peer method loaded on EAPHost after the UI has been raised.
 * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {Integer} dwSizeOfUIContextData The size, in bytes, of the user interface context data buffer provided in <i>pUIContextData</i>.
 * @param {Pointer<Integer>} pUIContextData A pointer to a byte buffer that contains the new supplicant UI context data to be set on EAPHost. The data is returned from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeinteractiveui">EapHostPeerInvokeInteractiveUI</a> OUT parameter.
 * @param {Pointer<EapHostPeerResponseAction>} pEapOutput A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerResponseAction</a> enumeration value that specifies the action code for the next step the supplicant must take as a response.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeersetuicontext
 * @since windows6.0.6000
 */
export EapHostPeerSetUIContext(sessionHandle, dwSizeOfUIContextData, pUIContextData, pEapOutput, ppEapError) {
    pUIContextDataMarshal := pUIContextData is VarRef ? "char*" : "ptr"
    pEapOutputMarshal := pEapOutput is VarRef ? "int*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerSetUIContext", "uint", sessionHandle, "uint", dwSizeOfUIContextData, pUIContextDataMarshal, pUIContextData, pEapOutputMarshal, pEapOutput, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Obtains an array of EAP authentication attributes from EAPHost.
 * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {Pointer<EAP_ATTRIBUTES>} pAttribs A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EAP_ATTRIBUTES</a> structure that contains an array of EAP authentication response attributes for the supplicant.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeergetresponseattributes
 * @since windows6.0.6000
 */
export EapHostPeerGetResponseAttributes(sessionHandle, pAttribs, ppEapError) {
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerGetResponseAttributes", "uint", sessionHandle, EAP_ATTRIBUTES.Ptr, pAttribs, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Provides updated EAP authentication attributes to EAPHost.
 * @remarks
 * To progress to the next step in the state machine after a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeergetresponseattributes">EapHostPeerGetResponseAttributes</a>, the supplicant must call <b>EapHostPeerSetResponseAttributes</b>. The supplicant must do so to pass a valid <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EapAttributes</a>  structure, even if the supplicant cannot use the attributes
 * returned from <b>EapHostPeerGetResponseAttributes</b>.   
 * 
 * The following example shows a  <b>EapHostPeerSetResponseAttributes</b> call that is made solely to progress to the next state in the state machine. 
 * 
 * 
 * ``` syntax
 * EapHostPeerGetResponseAttributes(session_id, &amp;eapAttributes, ppEapError);
 * 
 * // overwrite attributes returned by EapHostPeerGetResponseAttributes
 * EapAttributes eapAttributes={0,NULL};
 * 
 * // progress to the next state in the state machine
 * EapHostPeerSetResponseAttributes(session_id, &amp;eapAttributes, pEapOutput, ppEapError);
 * ```
 * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {Pointer<EAP_ATTRIBUTES>} pAttribs A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EapAttributes</a> structure that contains an array of new EAP authentication response attributes to set for the supplicant on EAPHost.
 * @param {Pointer<EapHostPeerResponseAction>} pEapOutput A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerResponseAction</a> enumeration value that specifies the action code for the next step the supplicant must take as a response.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeersetresponseattributes
 * @since windows6.0.6000
 */
export EapHostPeerSetResponseAttributes(sessionHandle, pAttribs, pEapOutput, ppEapError) {
    pEapOutputMarshal := pEapOutput is VarRef ? "int*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerSetResponseAttributes", "uint", sessionHandle, EAP_ATTRIBUTES.Ptr, pAttribs, pEapOutputMarshal, pEapOutput, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Obtains the supplicant's current EAP authentication status from EAPHost.
 * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {EapHostPeerAuthParams} authParam An <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerauthparams">EapHostPeerAuthParams</a> enumeration value that specifies the type of EAP authentication data to obtain from EAPHost.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="EapHostPeerAuthStatus"></a><a id="eaphostpeerauthstatus"></a><a id="EAPHOSTPEERAUTHSTATUS"></a><dl>
 * <dt><b>EapHostPeerAuthStatus</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>ppAuthData</i> contains a <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ns-eaphostpeertypes-eaphost_auth_info">EAPHOST_AUTH_INFO</a> structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="EapHostPeerIdentity"></a><a id="eaphostpeeridentity"></a><a id="EAPHOSTPEERIDENTITY"></a><dl>
 * <dt><b>EapHostPeerIdentity</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>ppAuthData</i> contains a <b>WCHAR</b> buffer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="EapHostPeerIdentityExtendedInfo"></a><a id="eaphostpeeridentityextendedinfo"></a><a id="EAPHOSTPEERIDENTITYEXTENDEDINFO"></a><dl>
 * <dt><b>EapHostPeerIdentityExtendedInfo</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>ppAuthData</i> contains a <b>CHAR</b> buffer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="EapHostNapInfo"></a><a id="eaphostnapinfo"></a><a id="EAPHOSTNAPINFO"></a><dl>
 * <dt><b>EapHostNapInfo</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Windows 7 or later: [EapHostPeerNapInfo](/windows/win32/eaphost/eaphostpeernapinfo) structure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pcbAuthData The size, in bytes, of the EAP authentication data buffer pointed to by the <i>ppAuthData</i> parameter.
 * @param {Pointer<Pointer<Integer>>} ppAuthData A pointer to a pointer to a byte buffer that contains the authentication data from EAPHost. The format of this data depends on the value supplied in <i>authParam</i>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeergetauthstatus
 * @since windows6.0.6000
 */
export EapHostPeerGetAuthStatus(sessionHandle, authParam, pcbAuthData, ppAuthData, ppEapError) {
    pcbAuthDataMarshal := pcbAuthData is VarRef ? "uint*" : "ptr"
    ppAuthDataMarshal := ppAuthData is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerGetAuthStatus", "uint", sessionHandle, EapHostPeerAuthParams, authParam, pcbAuthDataMarshal, pcbAuthData, ppAuthDataMarshal, ppAuthData, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Terminates the current EAP authentication session between EAPHost and the calling supplicant, and clears data stored for the session.
 * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeerendsession
 * @since windows6.0.6000
 */
export EapHostPeerEndSession(sessionHandle, ppEapError) {
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerEndSession", "uint", sessionHandle, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Returns the Connection Id,User Impersonation Token and Eaphost Process Id used by EAPHost to save the credentials for SSO. This data is needed to unplumb previously plumbed credentials.
 * @param {Pointer<Guid>} pConnectionIdThatLastSavedCreds The  GUID of the EAP peer session that last plumbed credentials.
 * @param {Pointer<Pointer>} phCredentialImpersonationToken Handle to impersonate the user at the time of plumbing credentials. The user can be impersonated by a call to <b>ImpersonateLoggedOnUser</b>.
 * @param {Integer} sessionHandle A pseudo handle to the EAPHost process. This is the  __int3264 value returned to EAPHost when it called <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {Pointer<BOOL>} fSaveToCredMan A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeergetdatatounplumbcredentials
 * @since windows10.0.10240
 */
export EapHostPeerGetDataToUnplumbCredentials(pConnectionIdThatLastSavedCreds, phCredentialImpersonationToken, sessionHandle, ppEapError, fSaveToCredMan) {
    phCredentialImpersonationTokenMarshal := phCredentialImpersonationToken is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"
    fSaveToCredManMarshal := fSaveToCredMan is VarRef ? "int*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerGetDataToUnplumbCredentials", Guid.Ptr, pConnectionIdThatLastSavedCreds, phCredentialImpersonationTokenMarshal, phCredentialImpersonationToken, "uint", sessionHandle, ppEapErrorMarshal, ppEapError, fSaveToCredManMarshal, fSaveToCredMan, UInt32)
    return result
}

/**
 * Clears the authentication session connection.
 * @param {Pointer<Guid>} pConnectionId A pointer to a GUID value that uniquely identifies a logical network interface for a connection to terminate between the supplicant and the EAPHost. This connection ID must have been provided in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeerclearconnection
 * @since windows6.0.6000
 */
export EapHostPeerClearConnection(pConnectionId, ppEapError) {
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerClearConnection", Guid.Ptr, pConnectionId, ppEapErrorMarshal, ppEapError, UInt32)
    return result
}

/**
 * Frees EAP_ERROR structures returned by EAPHost run-time APIs.
 * @remarks
 * To release all memory allocated by EAPHost for a authentication session, the caller must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerendsession">EapHostPeerEndSession</a>. To release all memory allocated by EAPHost for a connection, the caller must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerclearconnection">EapHostPeerClearConnection</a> function.
 * 
 * <b>EapHostPeerFreeEapError</b> is not thread safe. Any given <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> must be freed on one thread only. Do not call  <b>EapHostPeerFreeEapError</b> twice on the same <b>EAP_ERROR</b> structure.
 * @param {Pointer<EAP_ERROR>} pEapError A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that  contains the error data to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror
 * @since windows6.0.6000
 */
export EapHostPeerFreeEapError(pEapError) {
    DllCall("eappprxy.dll\EapHostPeerFreeEapError", EAP_ERROR.Ptr, pEapError)
}

/**
 * This function is called by tunnel methods to request identity information from the inner methods. This function returns the identity and user credential information.
 * @param {Integer} dwVersion The version number of the API. Must be set to zero.
 * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
 * @param {EAP_METHOD_TYPE} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the type of EAP authentication to use for this session.
 * @param {Integer} dwSizeofConnectionData Size of the buffer indicated by the <i>pConnectionData</i> parameter, in bytes.
 * @param {Pointer<Integer>} pConnectionData Pointer to configuration data that is used for the EAP method.
 * @param {Integer} dwSizeofUserData Size of the buffer indicated by the <i>pUserData</i> parameter, in bytes.
 * @param {Pointer<Integer>} pUserData Pointer to user credential information that pertains to this authentication session.
 * @param {HANDLE} hTokenImpersonateUser Impersonation token for a logged-on user to collect user-related information.
 * @param {Pointer<BOOL>} pfInvokeUI Returns <b>TRUE</b> if the user identity and user data blob aren't returned successfully, and the method seeks to collect the information from the user through the user interface dialog.
 * @param {Pointer<Integer>} pdwSizeOfUserDataOut Size of the buffer indicated by the <i>ppUserDataOut</i> parameter, in bytes.
 * @param {Pointer<Pointer<Integer>>} ppUserDataOut User data information returned by the method. After use, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeruntimememory">EapHostPeerFreeRuntimeMemory</a>.
 * @param {Pointer<PWSTR>} ppwszIdentity A pointer to a NULL-terminated user identity string. After use, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeruntimememory">EapHostPeerFreeRuntimeMemory</a>.
 * @param {Pointer<Pointer<EAP_ERROR>>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised during the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
 * @param {Pointer<Pointer<Integer>>} ppvReserved Reserved for future use
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeergetidentity
 * @since windows6.0.6000
 */
export EapHostPeerGetIdentity(dwVersion, dwFlags, eapMethodType, dwSizeofConnectionData, pConnectionData, dwSizeofUserData, pUserData, hTokenImpersonateUser, pfInvokeUI, pdwSizeOfUserDataOut, ppUserDataOut, ppwszIdentity, ppEapError, ppvReserved) {
    pConnectionDataMarshal := pConnectionData is VarRef ? "char*" : "ptr"
    pUserDataMarshal := pUserData is VarRef ? "char*" : "ptr"
    pfInvokeUIMarshal := pfInvokeUI is VarRef ? "int*" : "ptr"
    pdwSizeOfUserDataOutMarshal := pdwSizeOfUserDataOut is VarRef ? "uint*" : "ptr"
    ppUserDataOutMarshal := ppUserDataOut is VarRef ? "ptr*" : "ptr"
    ppwszIdentityMarshal := ppwszIdentity is VarRef ? "ptr*" : "ptr"
    ppEapErrorMarshal := ppEapError is VarRef ? "ptr*" : "ptr"
    ppvReservedMarshal := ppvReserved is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerGetIdentity", "uint", dwVersion, "uint", dwFlags, EAP_METHOD_TYPE, eapMethodType, "uint", dwSizeofConnectionData, pConnectionDataMarshal, pConnectionData, "uint", dwSizeofUserData, pUserDataMarshal, pUserData, HANDLE, hTokenImpersonateUser, pfInvokeUIMarshal, pfInvokeUI, pdwSizeOfUserDataOutMarshal, pdwSizeOfUserDataOut, ppUserDataOutMarshal, ppUserDataOut, ppwszIdentityMarshal, ppwszIdentity, ppEapErrorMarshal, ppEapError, ppvReservedMarshal, ppvReserved, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwSizeofPassword 
 * @param {Integer} szPassword 
 * @param {Pointer<PWSTR>} ppszEncPassword 
 * @returns {Integer} 
 */
export EapHostPeerGetEncryptedPassword(dwSizeofPassword, szPassword, ppszEncPassword) {
    ppszEncPasswordMarshal := ppszEncPassword is VarRef ? "ptr*" : "ptr"

    result := DllCall("eappprxy.dll\EapHostPeerGetEncryptedPassword", "uint", dwSizeofPassword, "ptr", szPassword, ppszEncPasswordMarshal, ppszEncPassword, UInt32)
    return result
}

/**
 * Releases the memory space used during run-time.
 * @remarks
 * This method is called to release a specified memory buffer returned by any  EAPHost peer run-time APIs.
 * 
 * This call is performed by a peer-based EAPHost using a function pointer to this API. This API must be implemented on the EAP method loaded by EAPHost, and must strictly conform to the syntax and parameter types specified in the documentation.
 * @param {Pointer<Integer>} pData A pointer to a buffer returned by any EapHost peer run-time API.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nf-eappapis-eaphostpeerfreeruntimememory
 * @since windows6.0.6000
 */
export EapHostPeerFreeRuntimeMemory(pData) {
    pDataMarshal := pData is VarRef ? "char*" : "ptr"

    DllCall("eappprxy.dll\EapHostPeerFreeRuntimeMemory", pDataMarshal, pData)
}

;@endregion Functions
