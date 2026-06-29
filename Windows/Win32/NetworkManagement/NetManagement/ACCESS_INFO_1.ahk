#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct ACCESS_INFO_1 {
    #StructPack 8

    acc1_resource_name : PWSTR

    acc1_attr : UInt32

    acc1_count : UInt32

}
