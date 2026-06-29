#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11EXT_IHV_SECURITY_PROFILE.ahk" { DOT11EXT_IHV_SECURITY_PROFILE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOT11EXT_IHV_CONNECTIVITY_PROFILE.ahk" { DOT11EXT_IHV_CONNECTIVITY_PROFILE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_IHV_DISCOVERY_PROFILE {
    #StructPack 8

    IhvConnectivityProfile : DOT11EXT_IHV_CONNECTIVITY_PROFILE

    IhvSecurityProfile : DOT11EXT_IHV_SECURITY_PROFILE

}
