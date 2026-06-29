#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVICE_INFO_2 {
    #StructPack 8

    svci2_name : PWSTR

    svci2_status : UInt32

    svci2_code : UInt32

    svci2_pid : UInt32

    svci2_text : PWSTR

    svci2_specific_error : UInt32

    svci2_display_name : PWSTR

}
