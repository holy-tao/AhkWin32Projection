#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WSC_SECURITY_PROVIDER_HEALTH.ahk" { WSC_SECURITY_PROVIDER_HEALTH }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */

;@region Functions
/**
 * Registers a callback function to be run when Windows Security Center (WSC) detects a change that could affect the health of one of the security providers.
 * @remarks
 * When you want to cease receiving notification to your callback method, you can unregister it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wscapi/nf-wscapi-wscunregisterchanges">WscUnRegisterChanges</a> function.
 * @param {Pointer<Void>} Reserved Reserved.  Must be <b>NULL</b>.
 * @param {Pointer<HANDLE>} phCallbackRegistration A pointer to a handle to the callback registration. When you are finished using the callback function, unregister it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wscapi/nf-wscapi-wscunregisterchanges">WscUnRegisterChanges</a> function.
 * @param {Pointer<LPTHREAD_START_ROUTINE>} lpCallbackAddress A pointer to the application-defined function to be called when a change to the WSC service occurs. This function is also called when the WSC service is started or stopped.
 * @param {Pointer<Void>} pContext A pointer to a variable to be passed as  the <i>lpParameter</i> parameter to the function pointed to by the <i>lpCallbackAddress</i> parameter.
 * @returns {HRESULT} Returns S_OK if the function succeeds, otherwise returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wscapi/nf-wscapi-wscregisterforchanges
 * @since windows6.0.6000
 */
export WscRegisterForChanges(Reserved, phCallbackRegistration, lpCallbackAddress, pContext) {
    ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("WSCAPI.dll\WscRegisterForChanges", ReservedMarshal, Reserved, HANDLE.Ptr, phCallbackRegistration, "ptr", lpCallbackAddress, pContextMarshal, pContext, "HRESULT")
    return result
}

/**
 * Cancels a callback registration that was made by a call to the WscRegisterForChanges function.
 * @param {HANDLE} hRegistrationHandle The handle to the registration context returned as the <i>phCallbackRegistration</i> of the <a href="https://docs.microsoft.com/windows/desktop/api/wscapi/nf-wscapi-wscregisterforchanges">WscRegisterForChanges</a> function.
 * @returns {HRESULT} Returns <b>S_OK</b> if the function succeeds, otherwise returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wscapi/nf-wscapi-wscunregisterchanges
 * @since windows6.0.6000
 */
export WscUnRegisterChanges(hRegistrationHandle) {
    result := DllCall("WSCAPI.dll\WscUnRegisterChanges", HANDLE, hRegistrationHandle, "HRESULT")
    return result
}

/**
 * 
 * @returns {HRESULT} 
 */
export WscRegisterForUserNotifications() {
    result := DllCall("WSCAPI.dll\WscRegisterForUserNotifications", "HRESULT")
    return result
}

/**
 * Gets the aggregate health state of the security provider categories represented by the specified WSC_SECURITY_PROVIDER enumeration values.
 * @remarks
 * > [!NOTE]
 * > [WSC_SECURITY_PROVIDER::WSC_SECURITY_PROVIDER_ANTISPYWARE](/windows/desktop/api/wscapi/ne-wscapi-wsc_security_provider) should be used only in operating systems prior to Windows 10, version 1607. As of Windows 10, version 1607, WSC continues to track the status for antivirus, but not for anti-spyware.
 * @param {Integer} Providers One or more of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wscapi/ne-wscapi-wsc_security_provider">WSC_SECURITY_PROVIDER</a> enumeration. To specify more than one value, combine the individual values by performing a bitwise OR operation.
 * @param {Pointer<WSC_SECURITY_PROVIDER_HEALTH>} pHealth A pointer to a variable that takes the value of one of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/wscapi/ne-wscapi-wsc_security_provider_health">WSC_SECURITY_PROVIDER_HEALTH</a> enumeration. If more than one provider is specified in the <i>Providers</i> parameter, the value of this parameter is the health of the least healthy of the specified provider categories.
 * @returns {HRESULT} Returns <b>S_OK</b> if the function succeeds, otherwise returns an error code. If the WSC service is not running, the return value is always <b>S_FALSE</b> and the <i>pHealth</i> out parameter is always set to <b>WSC_SECURITY_PROVIDER_HEALTH_POOR</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wscapi/nf-wscapi-wscgetsecurityproviderhealth
 * @since windows6.0.6000
 */
export WscGetSecurityProviderHealth(Providers, pHealth) {
    pHealthMarshal := pHealth is VarRef ? "int*" : "ptr"

    result := DllCall("WSCAPI.dll\WscGetSecurityProviderHealth", "uint", Providers, pHealthMarshal, pHealth, "HRESULT")
    return result
}

/**
 * 
 * @returns {HRESULT} 
 */
export WscQueryAntiMalwareUri() {
    result := DllCall("WSCAPI.dll\WscQueryAntiMalwareUri", "HRESULT")
    return result
}

/**
 * 
 * @returns {PWSTR} 
 */
export WscGetAntiMalwareUri() {
    result := DllCall("WSCAPI.dll\WscGetAntiMalwareUri", PWSTR.Ptr, &ppszUri := 0, "HRESULT")
    return ppszUri
}

;@endregion Functions
