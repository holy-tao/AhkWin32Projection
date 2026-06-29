#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The WKSTA_INFO_502 structure is obsolete. The structure contains information about a workstation environment.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_info_502
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_INFO_502 {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds the computer waits for a remote resource to become available.
     */
    wki502_char_wait : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of milliseconds the computer collects data before sending the data to a character device resource. The workstation waits the specified time or collects the number of characters specified by the <b>wki502_maximum_collection_count</b>  member, whichever comes first.
     */
    wki502_collection_time : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of bytes of information the computer collects before sending the data to a character device resource. The workstation collects the specified number of bytes or waits the period of time specified by the <b>wki502_collection_time</b>  member, whichever comes first.
     */
    wki502_maximum_collection_count : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds the server maintains an inactive connection to a server's resource.
     */
    wki502_keep_conn : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of simultaneous network device driver commands that can be sent to the network.
     */
    wki502_max_cmds : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds the server waits before disconnecting an inactive session.
     */
    wki502_sess_timeout : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum size, in bytes, of a character pipe buffer and device buffer.
     */
    wki502_siz_char_buf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of threads the computer can dedicate to the network.
     */
    wki502_max_threads : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_lock_quota : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_lock_increment : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_lock_maximum : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_pipe_increment : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_pipe_maximum : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_cache_file_timeout : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_dormant_file_limit : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_read_ahead_throughput : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_num_mailslot_buffers : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_num_srv_announce_buffers : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_max_illegal_datagram_events : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    wki502_illegal_datagram_event_reset_frequency : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_log_election_packets : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_use_opportunistic_locking : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_use_unlock_behind : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_use_close_behind : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_buf_named_pipes : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_use_lock_read_unlock : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_utilize_nt_caching : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_use_raw_read : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_use_raw_write : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_use_write_raw_data : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_use_encryption : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_buf_files_deny_write : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_buf_read_only_files : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_force_core_create_mode : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     */
    wki502_use_512_byte_max_transfer : BOOL

}
