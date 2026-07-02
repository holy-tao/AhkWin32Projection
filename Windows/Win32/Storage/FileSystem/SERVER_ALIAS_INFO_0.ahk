#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SERVER_ALIAS_INFO_0 {
    #StructPack 8

    srvai0_alias : PWSTR

    srvai0_target : PWSTR

    srvai0_default : BOOLEAN

    srvai0_reserved : UInt32

}
