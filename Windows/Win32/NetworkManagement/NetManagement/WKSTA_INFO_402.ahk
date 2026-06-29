#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_INFO_402 {
    #StructPack 8

    wki402_char_wait : UInt32

    wki402_collection_time : UInt32

    wki402_maximum_collection_count : UInt32

    wki402_keep_conn : UInt32

    wki402_keep_search : UInt32

    wki402_max_cmds : UInt32

    wki402_num_work_buf : UInt32

    wki402_siz_work_buf : UInt32

    wki402_max_wrk_cache : UInt32

    wki402_sess_timeout : UInt32

    wki402_siz_error : UInt32

    wki402_num_alerts : UInt32

    wki402_num_services : UInt32

    wki402_errlog_sz : UInt32

    wki402_print_buf_time : UInt32

    wki402_num_char_buf : UInt32

    wki402_siz_char_buf : UInt32

    wki402_wrk_heuristics : PWSTR

    wki402_mailslots : UInt32

    wki402_num_dgram_buf : UInt32

    wki402_max_threads : UInt32

}
