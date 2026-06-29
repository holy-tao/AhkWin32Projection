#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11EXT_IHV_PROFILE_PARAMS.ahk" { DOT11EXT_IHV_PROFILE_PARAMS }
#Import ".\DOT11_MSSECURITY_SETTINGS.ahk" { DOT11_MSSECURITY_SETTINGS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DOT11EXT_IHV_SSID_LIST.ahk" { DOT11EXT_IHV_SSID_LIST }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_IHV_PARAMS {
    #StructPack 8

    dot11ExtIhvProfileParams : DOT11EXT_IHV_PROFILE_PARAMS

    wstrProfileName : WCHAR[256]

    dwProfileTypeFlags : UInt32

    interfaceGuid : Guid

}
