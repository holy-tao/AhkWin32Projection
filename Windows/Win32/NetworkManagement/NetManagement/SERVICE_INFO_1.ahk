#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVICE_INFO_1 {
    #StructPack 8

    svci1_name : PWSTR

    svci1_status : UInt32

    svci1_code : UInt32

    svci1_pid : UInt32

}
