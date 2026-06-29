#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct REPL_EDIR_INFO_1 {
    #StructPack 8

    rped1_dirname : PWSTR

    rped1_integrity : UInt32

    rped1_extent : UInt32

}
