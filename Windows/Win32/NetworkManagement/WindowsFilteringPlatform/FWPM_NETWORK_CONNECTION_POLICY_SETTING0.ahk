#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_TOKEN_INFORMATION.ahk" { FWP_TOKEN_INFORMATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWP_VALUE0.ahk" { FWP_VALUE0 }
#Import ".\FWP_DATA_TYPE.ahk" { FWP_DATA_TYPE }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\FWP_NETWORK_CONNECTION_POLICY_SETTING_TYPE.ahk" { FWP_NETWORK_CONNECTION_POLICY_SETTING_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NETWORK_CONNECTION_POLICY_SETTING0 {
    #StructPack 8

    type : FWP_NETWORK_CONNECTION_POLICY_SETTING_TYPE

    value : FWP_VALUE0

}
