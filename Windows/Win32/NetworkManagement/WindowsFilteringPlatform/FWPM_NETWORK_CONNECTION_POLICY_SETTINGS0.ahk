#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_NETWORK_CONNECTION_POLICY_SETTING0.ahk" { FWPM_NETWORK_CONNECTION_POLICY_SETTING0 }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NETWORK_CONNECTION_POLICY_SETTINGS0 {
    #StructPack 8

    numSettings : UInt32

    settings : FWPM_NETWORK_CONNECTION_POLICY_SETTING0.Ptr

}
