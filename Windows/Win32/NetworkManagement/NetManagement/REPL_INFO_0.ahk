#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct REPL_INFO_0 {
    #StructPack 8

    rp0_role : UInt32

    rp0_exportpath : PWSTR

    rp0_exportlist : PWSTR

    rp0_importpath : PWSTR

    rp0_importlist : PWSTR

    rp0_logonusername : PWSTR

    rp0_interval : UInt32

    rp0_pulse : UInt32

    rp0_guardtime : UInt32

    rp0_random : UInt32

}
