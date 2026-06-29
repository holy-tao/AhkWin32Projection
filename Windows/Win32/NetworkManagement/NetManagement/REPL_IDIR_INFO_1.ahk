#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct REPL_IDIR_INFO_1 {
    #StructPack 8

    rpid1_dirname : PWSTR

    rpid1_state : UInt32

    rpid1_mastername : PWSTR

    rpid1_last_update_time : UInt32

    rpid1_lockcount : UInt32

    rpid1_locktime : UInt32

}
