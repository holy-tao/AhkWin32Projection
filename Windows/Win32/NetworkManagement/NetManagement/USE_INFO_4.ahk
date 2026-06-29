#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USE_INFO_3.ahk" { USE_INFO_3 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\USE_INFO_ASG_TYPE.ahk" { USE_INFO_ASG_TYPE }
#Import ".\USE_INFO_2.ahk" { USE_INFO_2 }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USE_INFO_4 {
    #StructPack 8

    ui4_ui3 : USE_INFO_3

    ui4_auth_identity_length : UInt32

    ui4_auth_identity : IntPtr

}
