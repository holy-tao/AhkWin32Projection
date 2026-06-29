#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_INFO_302 {
    #StructPack 8

    wki302_char_wait : UInt32

    wki302_collection_time : UInt32

    wki302_maximum_collection_count : UInt32

    wki302_keep_conn : UInt32

    wki302_keep_search : UInt32

    wki302_max_cmds : UInt32

    wki302_num_work_buf : UInt32

    wki302_siz_work_buf : UInt32

    wki302_max_wrk_cache : UInt32

    wki302_sess_timeout : UInt32

    wki302_siz_error : UInt32

    wki302_num_alerts : UInt32

    wki302_num_services : UInt32

    wki302_errlog_sz : UInt32

    wki302_print_buf_time : UInt32

    wki302_num_char_buf : UInt32

    wki302_siz_char_buf : UInt32

    wki302_wrk_heuristics : PWSTR

    wki302_mailslots : UInt32

    wki302_num_dgram_buf : UInt32

}
