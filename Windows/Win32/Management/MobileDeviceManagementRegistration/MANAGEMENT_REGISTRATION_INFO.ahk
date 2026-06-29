#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Management.MobileDeviceManagementRegistration
 */
export default struct MANAGEMENT_REGISTRATION_INFO {
    #StructPack 8

    fDeviceRegisteredWithManagement : BOOL

    dwDeviceRegistionKind : UInt32

    pszUPN : PWSTR

    pszMDMServiceUri : PWSTR

}
