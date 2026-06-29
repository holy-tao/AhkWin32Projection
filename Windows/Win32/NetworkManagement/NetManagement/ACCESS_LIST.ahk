#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct ACCESS_LIST {
    #StructPack 8

    acl_ugname : PWSTR

    acl_access : UInt32

}
