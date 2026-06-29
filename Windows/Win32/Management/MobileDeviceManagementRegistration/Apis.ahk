#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MANAGEMENT_SERVICE_INFO.ahk" { MANAGEMENT_SERVICE_INFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\REGISTRATION_INFORMATION_CLASS.ahk" { REGISTRATION_INFORMATION_CLASS }

/**
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 */

;@region Functions
/**
 * Retrieves the device registration information.
 * @remarks
 * The caller of this function must be running as an elevated process.
 * @param {REGISTRATION_INFORMATION_CLASS} DeviceInformationClass Contains the maximum length that can be returned through the <i>pszHyperlink</i> 
 *       parameter.
 * @returns {Pointer<Void>} Details of the device registration.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-getdeviceregistrationinfo
 * @since windows8.1
 */
export GetDeviceRegistrationInfo(DeviceInformationClass) {
    result := DllCall("MDMRegistration.dll\GetDeviceRegistrationInfo", REGISTRATION_INFORMATION_CLASS, DeviceInformationClass, "ptr*", &ppDeviceRegistrationInfo := 0, "HRESULT")
    return ppDeviceRegistrationInfo
}

/**
 * Checks whether the device is registered with an MDM service.
 * @param {Integer} cchUPN Contains the maximum length that can be returned through the <i>pszUPN</i> 
 *       parameter.
 * @param {PWSTR} pszUPN Optional address of a buffer that receives the  <b>NULL</b>-terminated Unicode string 
 *       containing the UPN of the user registered with the management service. If <i>pszUPN</i> is 
 *       <b>NULL</b> then the <b>BOOL</b> pointed to by the 
 *       <i>pfIsDeviceRegisteredWithManagement</i> parameter is updated to indicate whether the device 
 *       is registered and the function returns <b>ERROR_SUCCESS</b>.
 * @returns {BOOL} Address of a <b>BOOL</b> indicates whether the device is registered.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-isdeviceregisteredwithmanagement
 * @since windows8.1
 */
export IsDeviceRegisteredWithManagement(cchUPN, pszUPN) {
    pszUPN := pszUPN is String ? StrPtr(pszUPN) : pszUPN

    result := DllCall("MDMRegistration.dll\IsDeviceRegisteredWithManagement", BOOL.Ptr, &pfIsDeviceRegisteredWithManagement := 0, "uint", cchUPN, "ptr", pszUPN, "HRESULT")
    return pfIsDeviceRegisteredWithManagement
}

/**
 * Checks whether MDM registration is allowed by local policy.
 * @remarks
 * The caller of this function must be running as an elevated process.
 * @returns {BOOL} Address of a <b>BOOL</b> that receives a value indication whether registration is allowed.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-ismanagementregistrationallowed
 * @since windows8.1
 */
export IsManagementRegistrationAllowed() {
    result := DllCall("MDMRegistration.dll\IsManagementRegistrationAllowed", BOOL.Ptr, &pfIsManagementRegistrationAllowed := 0, "HRESULT")
    return pfIsManagementRegistrationAllowed
}

/**
 * 
 * @returns {BOOL} 
 */
export IsMdmUxWithoutAadAllowed() {
    result := DllCall("MDMRegistration.dll\IsMdmUxWithoutAadAllowed", BOOL.Ptr, &isEnrollmentAllowed := 0, "HRESULT")
    return isEnrollmentAllowed
}

/**
 * Indicates to the MDM agent that the device is managed externally and is not to be registered with an MDM service.
 * @remarks
 * The caller of this function must be running as an elevated process.
 * @param {BOOL} IsManagedExternally If <b>TRUE</b> this device is not to be registered with an MDM service. If 
 *       <b>FALSE</b> this device can be registered with an MDM service.
 * @returns {HRESULT} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the returned value describes the error. Possible 
 *       values include those listed at 
 *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-setmanagedexternally
 * @since windows8.1
 */
export SetManagedExternally(IsManagedExternally) {
    result := DllCall("MDMRegistration.dll\SetManagedExternally", BOOL, IsManagedExternally, "HRESULT")
    return result
}

/**
 * Discovers the MDM service.
 * @remarks
 * The caller of this function must be running as an elevated process.
 * @param {PWSTR} pszUPN Address of a <b>NULL</b>-terminated Unicode string containing the user principal name 
 *       (UPN) of the user requesting registration.
 * @returns {Pointer<MANAGEMENT_SERVICE_INFO>} Address of a <a href="https://docs.microsoft.com/windows/win32/api/mdmregistration/ns-mdmregistration-management_service_info">MANAGEMENT_SERVICE_INFO</a> 
 *       structure that contains pointers to the URIs of the management and authentication services.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-discovermanagementservice
 * @since windows8.1
 */
export DiscoverManagementService(pszUPN) {
    pszUPN := pszUPN is String ? StrPtr(pszUPN) : pszUPN

    result := DllCall("MDMRegistration.dll\DiscoverManagementService", "ptr", pszUPN, "ptr*", &ppMgmtInfo := 0, "HRESULT")
    return ppMgmtInfo
}

/**
 * Registers a device with a MDM service, using Azure Active Directory (AAD) credentials.
 * @remarks
 * The caller of this function must be running as an elevated process.
 * @param {HANDLE} UserToken The User to impersonate when attempting to get AAD token
 * @returns {HRESULT} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the returned value describes the error. Possible 
 *       values include those listed at 
 *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-registerdevicewithmanagementusingaadcredentials
 * @since windows8.1
 */
export RegisterDeviceWithManagementUsingAADCredentials(UserToken) {
    result := DllCall("MDMRegistration.dll\RegisterDeviceWithManagementUsingAADCredentials", HANDLE, UserToken, "HRESULT")
    return result
}

/**
 * Registers a device with a MDM service, using Azure Active Directory (AAD) device credentials.
 * @returns {HRESULT} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the returned value describes the error. Possible 
 *       values include those listed at 
 *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-registerdevicewithmanagementusingaaddevicecredentials
 * @since windows8.1
 */
export RegisterDeviceWithManagementUsingAADDeviceCredentials() {
    result := DllCall("MDMRegistration.dll\RegisterDeviceWithManagementUsingAADDeviceCredentials", "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} MDMApplicationID 
 * @returns {HRESULT} 
 */
export RegisterDeviceWithManagementUsingAADDeviceCredentials2(MDMApplicationID) {
    MDMApplicationID := MDMApplicationID is String ? StrPtr(MDMApplicationID) : MDMApplicationID

    result := DllCall("MDMRegistration.dll\RegisterDeviceWithManagementUsingAADDeviceCredentials2", "ptr", MDMApplicationID, "HRESULT")
    return result
}

/**
 * Registers a device with a MDM service, using the [MS-MDE]:\_Mobile Device Enrollment Protocol.
 * @remarks
 * The caller of this function must be running as an elevated process.
 * @param {PWSTR} pszUPN Address of a <b>NULL</b>-terminated Unicode string containing the user principal name 
 *       (UPN) of the user requesting the registration.
 * 
 * <b>Windows 8.1:  </b>This parameter was located after the <i>ppszMDMServiceUri</i> parameter in Windows 8.1.
 * @param {PWSTR} ppszMDMServiceUri Address of a <b>NULL</b>-terminated Unicode string containing the URI of the MDM 
 *       service.
 * @param {PWSTR} ppzsAccessToken Address of a <b>NULL</b>-terminated Unicode string containing a token acquired from 
 *       a Secure Token Service which the management service will use to validate the user.
 * @returns {HRESULT} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the returned value describes the error. Possible 
 *       values include those listed at 
 *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-registerdevicewithmanagement
 * @since windows8.1
 */
export RegisterDeviceWithManagement(pszUPN, ppszMDMServiceUri, ppzsAccessToken) {
    pszUPN := pszUPN is String ? StrPtr(pszUPN) : pszUPN
    ppszMDMServiceUri := ppszMDMServiceUri is String ? StrPtr(ppszMDMServiceUri) : ppszMDMServiceUri
    ppzsAccessToken := ppzsAccessToken is String ? StrPtr(ppzsAccessToken) : ppzsAccessToken

    result := DllCall("MDMRegistration.dll\RegisterDeviceWithManagement", "ptr", pszUPN, "ptr", ppszMDMServiceUri, "ptr", ppzsAccessToken, "HRESULT")
    return result
}

/**
 * Unregisters a device with the MDM service.
 * @remarks
 * The caller of this function must be running as an elevated process.
 * @param {PWSTR} enrollmentID 
 * @returns {HRESULT} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function 
 *       fails, the returned value describes the error. Possible 
 *       values include those listed at 
 *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-unregisterdevicewithmanagement
 * @since windows8.1
 */
export UnregisterDeviceWithManagement(enrollmentID) {
    enrollmentID := enrollmentID is String ? StrPtr(enrollmentID) : enrollmentID

    result := DllCall("MDMRegistration.dll\UnregisterDeviceWithManagement", "ptr", enrollmentID, "HRESULT")
    return result
}

/**
 * Gets the config info associated with the provider ID.
 * @param {PWSTR} providerID Type: \_In\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)**
 * 
 * A string containing the provider ID.
 * @param {Pointer<Integer>} configStringBufferLength Type: \_Inout\_ **[DWORD](/windows/win32/winprog/windows-data-types)\***
 * 
 * A pointer to the buffer length (the size of *configString* in chars).
 * @param {PWSTR} configString Type: \_Out\_writes\_to\_opt\_(*configStringBufferLength, *configStringBufferLength) **[PWSTR](/windows/win32/winprog/windows-data-types)**
 * 
 * A buffer which, if the function completes successfully, will contain the config info.
 * 
 * If the buffer isn't large enough to hold the data, then the function returns **ERROR_MORE_DATA**, and stores the required buffer size in the variable pointed to by *configStringBufferLength*. In that case, the contents of the *configString* buffer are undefined.
 * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
 * 
 * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-getdevicemanagementconfiginfo
 */
export GetDeviceManagementConfigInfo(providerID, configStringBufferLength, configString) {
    providerID := providerID is String ? StrPtr(providerID) : providerID
    configString := configString is String ? StrPtr(configString) : configString

    configStringBufferLengthMarshal := configStringBufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("MDMRegistration.dll\GetDeviceManagementConfigInfo", "ptr", providerID, configStringBufferLengthMarshal, configStringBufferLength, "ptr", configString, "HRESULT")
    return result
}

/**
 * Sets the config info associated with the provider ID.
 * @param {PWSTR} providerID Type: \_In\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)**
 * 
 * A string containing the provider ID.
 * @param {PWSTR} configString Type: \_In\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)**
 * 
 * A string containing containing the config info (the data to write).
 * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
 * 
 * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-setdevicemanagementconfiginfo
 */
export SetDeviceManagementConfigInfo(providerID, configString) {
    providerID := providerID is String ? StrPtr(providerID) : providerID
    configString := configString is String ? StrPtr(configString) : configString

    result := DllCall("MDMRegistration.dll\SetDeviceManagementConfigInfo", "ptr", providerID, "ptr", configString, "HRESULT")
    return result
}

/**
 * Retrieves the management app hyperlink associated with the MDM service.
 * @remarks
 * The caller of this function must be running as an elevated process.
 * @param {Integer} cchHyperlink Contains the maximum length that can be returned through the <i>pszHyperlink</i> 
 *       parameter.
 * @param {PWSTR} pszHyperlink Address of a buffer that receives the <b>NULL</b>-terminated Unicode string with the 
 *       hyperlink of the management app associated with the management service.
 * @returns {HRESULT} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function 
 *       fails, the returned value describes the error. Possible values include those listed at 
 *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-getmanagementapphyperlink
 * @since windows8.1
 */
export GetManagementAppHyperlink(cchHyperlink, pszHyperlink) {
    pszHyperlink := pszHyperlink is String ? StrPtr(pszHyperlink) : pszHyperlink

    result := DllCall("MDMRegistration.dll\GetManagementAppHyperlink", "uint", cchHyperlink, "ptr", pszHyperlink, "HRESULT")
    return result
}

/**
 * Discovers the MDM service using a candidate server.
 * @remarks
 * The caller of this function must be running as an elevated process.
 * 
 * This function is not available before Windows Server 2012 R2 Update and Windows 8.1 Update.
 * @param {PWSTR} pszUPN Address of a <b>NULL</b>-terminated Unicode string containing the user principal name 
 *       (UPN) of the user requesting registration.
 * @param {PWSTR} pszDiscoveryServiceCandidate Address of a <b>NULL</b>-terminated Unicode string containing the discovery service 
 *       candidate to use in lieu of automatic discovery.
 * @returns {Pointer<MANAGEMENT_SERVICE_INFO>} Address of a <a href="https://docs.microsoft.com/windows/win32/api/mdmregistration/ns-mdmregistration-management_service_info">MANAGEMENT_SERVICE_INFO</a> 
 *       structure that contains pointers to the URIs of the management and authentication services.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-discovermanagementserviceex
 * @since windows8.1
 */
export DiscoverManagementServiceEx(pszUPN, pszDiscoveryServiceCandidate) {
    pszUPN := pszUPN is String ? StrPtr(pszUPN) : pszUPN
    pszDiscoveryServiceCandidate := pszDiscoveryServiceCandidate is String ? StrPtr(pszDiscoveryServiceCandidate) : pszDiscoveryServiceCandidate

    result := DllCall("MDMRegistration.dll\DiscoverManagementServiceEx", "ptr", pszUPN, "ptr", pszDiscoveryServiceCandidate, "ptr*", &ppMgmtInfo := 0, "HRESULT")
    return ppMgmtInfo
}

/**
 * 
 * @returns {BOOL} 
 */
export RegisterDeviceWithLocalManagement() {
    result := DllCall("MDMLocalManagement.dll\RegisterDeviceWithLocalManagement", BOOL.Ptr, &alreadyRegistered := 0, "HRESULT")
    return alreadyRegistered
}

/**
 * 
 * @param {PWSTR} syncMLRequest 
 * @returns {PWSTR} 
 */
export ApplyLocalManagementSyncML(syncMLRequest) {
    syncMLRequest := syncMLRequest is String ? StrPtr(syncMLRequest) : syncMLRequest

    result := DllCall("MDMLocalManagement.dll\ApplyLocalManagementSyncML", "ptr", syncMLRequest, PWSTR.Ptr, &syncMLResult := 0, "HRESULT")
    return syncMLResult
}

/**
 * 
 * @returns {HRESULT} 
 */
export UnregisterDeviceWithLocalManagement() {
    result := DllCall("MDMLocalManagement.dll\UnregisterDeviceWithLocalManagement", "HRESULT")
    return result
}

;@endregion Functions
