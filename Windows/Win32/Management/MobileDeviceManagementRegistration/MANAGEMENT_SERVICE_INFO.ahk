#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the endpoints and information about the management service.
 * @see https://learn.microsoft.com/windows/win32/api/mdmregistration/ns-mdmregistration-management_service_info
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 */
export default struct MANAGEMENT_SERVICE_INFO {
    #StructPack 8

    /**
     * The URI of the Mobile Device Management service.
     */
    pszMDMServiceUri : PWSTR

    /**
     * The URI of the Authentication service.
     */
    pszAuthenticationUri : PWSTR

}
