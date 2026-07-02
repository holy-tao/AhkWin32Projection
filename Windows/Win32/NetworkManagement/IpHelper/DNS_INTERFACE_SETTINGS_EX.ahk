#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_INTERFACE_SETTINGS.ahk" { DNS_INTERFACE_SETTINGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct DNS_INTERFACE_SETTINGS_EX {
    #StructPack 8

    SettingsV1 : DNS_INTERFACE_SETTINGS

    DisableUnconstrainedQueries : UInt32

    SupplementalSearchList : PWSTR

}
