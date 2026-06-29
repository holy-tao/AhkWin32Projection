#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct REPL_EDIR_INFO_2 {
    #StructPack 8

    rped2_dirname : PWSTR

    rped2_integrity : UInt32

    rped2_extent : UInt32

    rped2_lockcount : UInt32

    rped2_locktime : UInt32

}
