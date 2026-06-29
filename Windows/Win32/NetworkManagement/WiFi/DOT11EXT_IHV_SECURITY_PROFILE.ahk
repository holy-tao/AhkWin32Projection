#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_IHV_SECURITY_PROFILE {
    #StructPack 8

    pszXmlFragmentIhvSecurity : PWSTR

    bUseMSOnex : BOOL

}
