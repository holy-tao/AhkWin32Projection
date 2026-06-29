#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_MSSECURITY_SETTINGS.ahk" { DOT11_MSSECURITY_SETTINGS }
#Import ".\DOT11EXT_IHV_SSID_LIST.ahk" { DOT11EXT_IHV_SSID_LIST }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_IHV_PROFILE_PARAMS {
    #StructPack 8

    pSsidList : DOT11EXT_IHV_SSID_LIST.Ptr

    BssType : DOT11_BSS_TYPE

    pMSSecuritySettings : DOT11_MSSECURITY_SETTINGS.Ptr

}
