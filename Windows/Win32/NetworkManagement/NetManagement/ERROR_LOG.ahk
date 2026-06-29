#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct ERROR_LOG {
    #StructPack 8

    el_len : UInt32

    el_reserved : UInt32

    el_time : UInt32

    el_error : UInt32

    el_name : PWSTR

    el_text : PWSTR

    el_data : IntPtr

    el_data_size : UInt32

    el_nstrings : UInt32

}
