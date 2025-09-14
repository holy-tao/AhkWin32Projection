#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 * @version v4.0.30319
 */
class MobileDeviceManagementRegistration {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_MESSAGE_FORMAT_ERROR => -2145910783

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_AUTHENTICATION_ERROR => -2145910782

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_AUTHORIZATION_ERROR => -2145910781

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_CERTIFICATEREQUEST_ERROR => -2145910780

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_CONFIGMGRSERVER_ERROR => -2145910779

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_INTERNALSERVICE_ERROR => -2145910778

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_INVALIDSECURITY_ERROR => -2145910777

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_UNKNOWN_ERROR => -2145910776

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_ENROLLMENT_IN_PROGRESS => -2145910775

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_ALREADY_ENROLLED => -2145910774

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DISCOVERY_SEC_CERT_DATE_INVALID => -2145910771

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PASSWORD_NEEDED => -2145910770

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_WAB_ERROR => -2145910769

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_CONNECTIVITY => -2145910768

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_INVALIDSSLCERT => -2145910766

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICECAPREACHED => -2145910765

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICENOTSUPPORTED => -2145910764

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_NOT_SUPPORTED => -2145910763

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_NOTELIGIBLETORENEW => -2145910762

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_INMAINTENANCE => -2145910761

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_USER_LICENSE => -2145910760

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_ENROLLMENTDATAINVALID => -2145910759

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_INSECUREREDIRECT => -2145910758

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PLATFORM_WRONG_STATE => -2145910757

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PLATFORM_LICENSE_ERROR => -2145910756

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PLATFORM_UNKNOWN_ERROR => -2145910755

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PROV_CSP_CERTSTORE => -2145910754

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PROV_CSP_W7 => -2145910753

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PROV_CSP_DMCLIENT => -2145910752

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PROV_CSP_PFW => -2145910751

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PROV_CSP_MISC => -2145910750

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PROV_UNKNOWN => -2145910749

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PROV_SSLCERTNOTFOUND => -2145910748

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_PROV_CSP_APPMGMT => -2145910747

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_MANAGEMENT_BLOCKED => -2145910746

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_CERTPOLICY_PRIVATEKEYCREATION_FAILED => -2145910745

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_CERTAUTH_FAILED_TO_FIND_CERT => -2145910744

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_EMPTY_MESSAGE => -2145910743

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_USER_CANCELLED => -2145910736

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_MDM_NOT_CONFIGURED => -2145910735

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_CUSTOMSERVERERROR => -2145910734

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_REGISTRATION_FACILITY_CODE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_ENROLLER_FACILITY_CODE => 24

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_MESSAGE_FORMAT_ERROR => -2145845247

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_AUTHENTICATION_ERROR => -2145845246

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_AUTHORIZATION_ERROR => -2145845245

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_CERTIFCATEREQUEST_ERROR => -2145845244

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_CERTIFCATEREQUEST_ERROR => -2145910780

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_CONFIGMGRSERVER_ERROR => -2145845243

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_INTERNALSERVICE_ERROR => -2145845242

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_INVALIDSECURITY_ERROR => -2145845241

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_UNKNOWN_ERROR => -2145845240

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_REGISTRATION_IN_PROGRESS => -2145845239

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_ALREADY_REGISTERED => -2145845238

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_NOT_REGISTERED => -2145845237

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_DEVICE_NOT_ENROLLED => -2145910773

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DISCOVERY_REDIRECTED => -2145845236

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DEVICE_NOT_AD_REGISTERED_ERROR => -2145845235

    /**
     * @type {Integer (Int32)}
     */
    static MREGISTER_E_DISCOVERY_FAILED => -2145845234

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_NOTSUPPORTED => -2145910763

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_USERLICENSE => -2145910760

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_E_USER_CANCELED => -2145910742

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEREGISTRATIONTYPE_MDM_ONLY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEREGISTRATIONTYPE_MAM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEREGISTRATIONTYPE_MDM_DEVICEWIDE_WITH_AAD => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEREGISTRATIONTYPE_MDM_USERSPECIFIC_WITH_AAD => 13
;@endregion Constants

;@region Methods
    /**
     * Retrieves the device registration information.
     * @remarks
     * The caller of this function must be running as an elevated process.
     * @param {Integer} DeviceInformationClass Contains the maximum length that can be returned through the <i>pszHyperlink</i> 
     *       parameter.
     * @param {Pointer<Void>} ppDeviceRegistrationInfo Details of the device registration.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. .
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-getdeviceregistrationinfo
     * @since windows8.1
     */
    static GetDeviceRegistrationInfo(DeviceInformationClass, ppDeviceRegistrationInfo) {
        result := DllCall("MDMRegistration.dll\GetDeviceRegistrationInfo", "int", DeviceInformationClass, "ptr", ppDeviceRegistrationInfo, "int")
        return result
    }

    /**
     * Checks whether the device is registered with an MDM service.
     * @param {Pointer<Int32>} pfIsDeviceRegisteredWithManagement Address of a <b>BOOL</b> indicates whether the device is registered.
     * @param {Integer} cchUPN Contains the maximum length that can be returned through the <i>pszUPN</i> 
     *       parameter.
     * @param {Pointer<PWSTR>} pszUPN Optional address of a buffer that receives the  <b>NULL</b>-terminated Unicode string 
     *       containing the UPN of the user registered with the management service. If <i>pszUPN</i> is 
     *       <b>NULL</b> then the <b>BOOL</b> pointed to by the 
     *       <i>pfIsDeviceRegisteredWithManagement</i> parameter is updated to indicate whether the device 
     *       is registered and the function returns <b>ERROR_SUCCESS</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the 
     *        <b>BOOL</b> pointed to by the 
     *        <i>pfIsDeviceRegisteredWithManagement</i> parameter contains <b>TRUE</b> 
     *        or <b>FALSE</b>. If <b>TRUE</b>, the Unicode string pointed to by the 
     *        <i>pszUPN</i> parameter contains the UPN of the registered user. If the function fails, the 
     *        returned value describes the error. Possible values include those listed at 
     *        <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * 
     * If the buffer size indicated by the <i>cchUPN</i> parameter is too small then the call will fail with 
     *        <b>STRSAFE_E_INSUFFICIENT_BUFFER</b> but the <b>BOOL</b> pointed to by 
     *        the <i>pfIsDeviceRegisteredWithManagement</i> parameter will be updated to indicate whether 
     *        the device is registered.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-isdeviceregisteredwithmanagement
     * @since windows8.1
     */
    static IsDeviceRegisteredWithManagement(pfIsDeviceRegisteredWithManagement, cchUPN, pszUPN) {
        result := DllCall("MDMRegistration.dll\IsDeviceRegisteredWithManagement", "ptr", pfIsDeviceRegisteredWithManagement, "uint", cchUPN, "ptr", pszUPN, "int")
        return result
    }

    /**
     * Checks whether MDM registration is allowed by local policy.
     * @remarks
     * The caller of this function must be running as an elevated process.
     * @param {Pointer<Int32>} pfIsManagementRegistrationAllowed Address of a <b>BOOL</b> that receives a value indication whether registration is allowed.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and the <b>BOOL</b> pointed to by the <i>pfIsManagementRegistrationAllowed</i> parameter contains <b>TRUE</b> or <b>FALSE</b>. If the function fails, the returned value describes the error. Possible 
     *       values include those listed at 
     *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-ismanagementregistrationallowed
     * @since windows8.1
     */
    static IsManagementRegistrationAllowed(pfIsManagementRegistrationAllowed) {
        result := DllCall("MDMRegistration.dll\IsManagementRegistrationAllowed", "ptr", pfIsManagementRegistrationAllowed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} isEnrollmentAllowed 
     * @returns {Integer} 
     */
    static IsMdmUxWithoutAadAllowed(isEnrollmentAllowed) {
        result := DllCall("MDMRegistration.dll\IsMdmUxWithoutAadAllowed", "ptr", isEnrollmentAllowed, "int")
        return result
    }

    /**
     * Indicates to the MDM agent that the device is managed externally and is not to be registered with an MDM service.
     * @remarks
     * The caller of this function must be running as an elevated process.
     * @param {Integer} IsManagedExternally If <b>TRUE</b> this device is not to be registered with an MDM service. If 
     *       <b>FALSE</b> this device can be registered with an MDM service.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the returned value describes the error. Possible 
     *       values include those listed at 
     *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-setmanagedexternally
     * @since windows8.1
     */
    static SetManagedExternally(IsManagedExternally) {
        result := DllCall("MDMRegistration.dll\SetManagedExternally", "int", IsManagedExternally, "int")
        return result
    }

    /**
     * Discovers the MDM service.
     * @remarks
     * The caller of this function must be running as an elevated process.
     * @param {Pointer<PWSTR>} pszUPN Address of a <b>NULL</b>-terminated Unicode string containing the user principal name 
     *       (UPN) of the user requesting registration.
     * @param {Pointer<MANAGEMENT_SERVICE_INFO>} ppMgmtInfo Address of a <a href="https://docs.microsoft.com/windows/win32/api/mdmregistration/ns-mdmregistration-management_service_info">MANAGEMENT_SERVICE_INFO</a> 
     *       structure that contains pointers to the URIs of the management and authentication services.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function 
     *       fails, the returned value describes the error. Possible 
     *       values include those listed at 
     *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-discovermanagementservice
     * @since windows8.1
     */
    static DiscoverManagementService(pszUPN, ppMgmtInfo) {
        result := DllCall("MDMRegistration.dll\DiscoverManagementService", "ptr", pszUPN, "ptr", ppMgmtInfo, "int")
        return result
    }

    /**
     * Registers a device with a MDM service, using Azure Active Directory (AAD) credentials.
     * @remarks
     * The caller of this function must be running as an elevated process.
     * @param {Pointer<HANDLE>} UserToken The User to impersonate when attempting to get AAD token
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the returned value describes the error. Possible 
     *       values include those listed at 
     *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-registerdevicewithmanagementusingaadcredentials
     * @since windows8.1
     */
    static RegisterDeviceWithManagementUsingAADCredentials(UserToken) {
        result := DllCall("MDMRegistration.dll\RegisterDeviceWithManagementUsingAADCredentials", "ptr", UserToken, "int")
        return result
    }

    /**
     * Registers a device with a MDM service, using Azure Active Directory (AAD) device credentials.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the returned value describes the error. Possible 
     *       values include those listed at 
     *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-registerdevicewithmanagementusingaaddevicecredentials
     * @since windows8.1
     */
    static RegisterDeviceWithManagementUsingAADDeviceCredentials() {
        result := DllCall("MDMRegistration.dll\RegisterDeviceWithManagementUsingAADDeviceCredentials", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} MDMApplicationID 
     * @returns {Integer} 
     */
    static RegisterDeviceWithManagementUsingAADDeviceCredentials2(MDMApplicationID) {
        result := DllCall("MDMRegistration.dll\RegisterDeviceWithManagementUsingAADDeviceCredentials2", "ptr", MDMApplicationID, "int")
        return result
    }

    /**
     * Registers a device with a MDM service, using the [MS-MDE]:\_Mobile Device Enrollment Protocol.
     * @remarks
     * The caller of this function must be running as an elevated process.
     * @param {Pointer<PWSTR>} pszUPN Address of a <b>NULL</b>-terminated Unicode string containing the user principal name 
     *       (UPN) of the user requesting the registration.
     * 
     * <b>Windows 8.1:  </b>This parameter was located after the <i>ppszMDMServiceUri</i> parameter in Windows 8.1.
     * @param {Pointer<PWSTR>} ppszMDMServiceUri Address of a <b>NULL</b>-terminated Unicode string containing the URI of the MDM 
     *       service.
     * @param {Pointer<PWSTR>} ppzsAccessToken Address of a <b>NULL</b>-terminated Unicode string containing a token acquired from 
     *       a Secure Token Service which the management service will use to validate the user.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the returned value describes the error. Possible 
     *       values include those listed at 
     *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-registerdevicewithmanagement
     * @since windows8.1
     */
    static RegisterDeviceWithManagement(pszUPN, ppszMDMServiceUri, ppzsAccessToken) {
        result := DllCall("MDMRegistration.dll\RegisterDeviceWithManagement", "ptr", pszUPN, "ptr", ppszMDMServiceUri, "ptr", ppzsAccessToken, "int")
        return result
    }

    /**
     * Unregisters a device with the MDM service.
     * @remarks
     * The caller of this function must be running as an elevated process.
     * @param {Pointer<PWSTR>} enrollmentID 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function 
     *       fails, the returned value describes the error. Possible 
     *       values include those listed at 
     *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-unregisterdevicewithmanagement
     * @since windows8.1
     */
    static UnregisterDeviceWithManagement(enrollmentID) {
        result := DllCall("MDMRegistration.dll\UnregisterDeviceWithManagement", "ptr", enrollmentID, "int")
        return result
    }

    /**
     * Gets the config info associated with the provider ID.
     * @param {Pointer<PWSTR>} providerID Type: \_In\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A string containing the provider ID.
     * @param {Pointer<UInt32>} configStringBufferLength Type: \_Inout\_ **[DWORD](/windows/win32/winprog/windows-data-types)\***
     * 
     * A pointer to the buffer length (the size of *configString* in chars).
     * @param {Pointer<PWSTR>} configString Type: \_Out\_writes\_to\_opt\_(*configStringBufferLength, *configStringBufferLength) **[PWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A buffer which, if the function completes successfully, will contain the config info.
     * 
     * If the buffer isn't large enough to hold the data, then the function returns **ERROR_MORE_DATA**, and stores the required buffer size in the variable pointed to by *configStringBufferLength*. In that case, the contents of the *configString* buffer are undefined.
     * @returns {Integer} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-getdevicemanagementconfiginfo
     */
    static GetDeviceManagementConfigInfo(providerID, configStringBufferLength, configString) {
        result := DllCall("MDMRegistration.dll\GetDeviceManagementConfigInfo", "ptr", providerID, "ptr", configStringBufferLength, "ptr", configString, "int")
        return result
    }

    /**
     * Sets the config info associated with the provider ID.
     * @param {Pointer<PWSTR>} providerID Type: \_In\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A string containing the provider ID.
     * @param {Pointer<PWSTR>} configString Type: \_In\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A string containing containing the config info (the data to write).
     * @returns {Integer} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-setdevicemanagementconfiginfo
     */
    static SetDeviceManagementConfigInfo(providerID, configString) {
        result := DllCall("MDMRegistration.dll\SetDeviceManagementConfigInfo", "ptr", providerID, "ptr", configString, "int")
        return result
    }

    /**
     * Retrieves the management app hyperlink associated with the MDM service.
     * @remarks
     * The caller of this function must be running as an elevated process.
     * @param {Integer} cchHyperlink Contains the maximum length that can be returned through the <i>pszHyperlink</i> 
     *       parameter.
     * @param {Pointer<PWSTR>} pszHyperlink Address of a buffer that receives the <b>NULL</b>-terminated Unicode string with the 
     *       hyperlink of the management app associated with the management service.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function 
     *       fails, the returned value describes the error. Possible values include those listed at 
     *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-getmanagementapphyperlink
     * @since windows8.1
     */
    static GetManagementAppHyperlink(cchHyperlink, pszHyperlink) {
        result := DllCall("MDMRegistration.dll\GetManagementAppHyperlink", "uint", cchHyperlink, "ptr", pszHyperlink, "int")
        return result
    }

    /**
     * Discovers the MDM service using a candidate server.
     * @remarks
     * The caller of this function must be running as an elevated process.
     * 
     * This function is not available before Windows Server 2012 R2 Update and Windows 8.1 Update.
     * @param {Pointer<PWSTR>} pszUPN Address of a <b>NULL</b>-terminated Unicode string containing the user principal name 
     *       (UPN) of the user requesting registration.
     * @param {Pointer<PWSTR>} pszDiscoveryServiceCandidate Address of a <b>NULL</b>-terminated Unicode string containing the discovery service 
     *       candidate to use in lieu of automatic discovery.
     * @param {Pointer<MANAGEMENT_SERVICE_INFO>} ppMgmtInfo Address of a <a href="https://docs.microsoft.com/windows/win32/api/mdmregistration/ns-mdmregistration-management_service_info">MANAGEMENT_SERVICE_INFO</a> 
     *       structure that contains pointers to the URIs of the management and authentication services.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. If the function 
     *       fails, the returned value describes the error. Possible 
     *       values include those listed at 
     *       <a href="https://docs.microsoft.com/windows/desktop/MDMReg/mdm-registration-constants">MDM Registration Error Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/nf-mdmregistration-discovermanagementserviceex
     * @since windows8.1
     */
    static DiscoverManagementServiceEx(pszUPN, pszDiscoveryServiceCandidate, ppMgmtInfo) {
        result := DllCall("MDMRegistration.dll\DiscoverManagementServiceEx", "ptr", pszUPN, "ptr", pszDiscoveryServiceCandidate, "ptr", ppMgmtInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} alreadyRegistered 
     * @returns {Integer} 
     */
    static RegisterDeviceWithLocalManagement(alreadyRegistered) {
        result := DllCall("MDMLocalManagement.dll\RegisterDeviceWithLocalManagement", "ptr", alreadyRegistered, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} syncMLRequest 
     * @param {Pointer<PWSTR>} syncMLResult 
     * @returns {Integer} 
     */
    static ApplyLocalManagementSyncML(syncMLRequest, syncMLResult) {
        result := DllCall("MDMLocalManagement.dll\ApplyLocalManagementSyncML", "ptr", syncMLRequest, "ptr", syncMLResult, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static UnregisterDeviceWithLocalManagement() {
        result := DllCall("MDMLocalManagement.dll\UnregisterDeviceWithLocalManagement", "int")
        return result
    }

;@endregion Methods
}
