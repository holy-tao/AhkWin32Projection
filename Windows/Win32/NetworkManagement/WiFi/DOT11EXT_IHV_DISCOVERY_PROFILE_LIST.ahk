#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11EXT_IHV_DISCOVERY_PROFILE.ahk" { DOT11EXT_IHV_DISCOVERY_PROFILE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_IHV_DISCOVERY_PROFILE_LIST {
    #StructPack 8

    dwCount : UInt32

    pIhvDiscoveryProfiles : DOT11EXT_IHV_DISCOVERY_PROFILE.Ptr

}
