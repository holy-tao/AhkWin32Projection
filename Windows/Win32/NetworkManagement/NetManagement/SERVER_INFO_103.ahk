#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_103 {
    #StructPack 8

    sv103_platform_id : UInt32

    sv103_name : PWSTR

    sv103_version_major : UInt32

    sv103_version_minor : UInt32

    sv103_type : UInt32

    sv103_comment : PWSTR

    sv103_users : UInt32

    sv103_disc : Int32

    sv103_hidden : BOOL

    sv103_announce : UInt32

    sv103_anndelta : UInt32

    sv103_licenses : UInt32

    sv103_userpath : PWSTR

    sv103_capabilities : UInt32

}
