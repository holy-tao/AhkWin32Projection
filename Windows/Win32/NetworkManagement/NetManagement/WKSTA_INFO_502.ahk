#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WKSTA_INFO_502 structure is obsolete. The structure contains information about a workstation environment.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_info_502
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_INFO_502 extends Win32Struct
{
    static sizeof => 140

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds the computer waits for a remote resource to become available.
     * @type {Integer}
     */
    wki502_char_wait {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of milliseconds the computer collects data before sending the data to a character device resource. The workstation waits the specified time or collects the number of characters specified by the <b>wki502_maximum_collection_count</b>  member, whichever comes first.
     * @type {Integer}
     */
    wki502_collection_time {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of bytes of information the computer collects before sending the data to a character device resource. The workstation collects the specified number of bytes or waits the period of time specified by the <b>wki502_collection_time</b>  member, whichever comes first.
     * @type {Integer}
     */
    wki502_maximum_collection_count {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds the server maintains an inactive connection to a server's resource.
     * @type {Integer}
     */
    wki502_keep_conn {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of simultaneous network device driver commands that can be sent to the network.
     * @type {Integer}
     */
    wki502_max_cmds {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds the server waits before disconnecting an inactive session.
     * @type {Integer}
     */
    wki502_sess_timeout {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum size, in bytes, of a character pipe buffer and device buffer.
     * @type {Integer}
     */
    wki502_siz_char_buf {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of threads the computer can dedicate to the network.
     * @type {Integer}
     */
    wki502_max_threads {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_lock_quota {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_lock_increment {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_lock_maximum {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_pipe_increment {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_pipe_maximum {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_cache_file_timeout {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_dormant_file_limit {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_read_ahead_throughput {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_num_mailslot_buffers {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_num_srv_announce_buffers {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_max_illegal_datagram_events {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_illegal_datagram_event_reset_frequency {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_log_election_packets {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_use_opportunistic_locking {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_use_unlock_behind {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_use_close_behind {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_buf_named_pipes {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_use_lock_read_unlock {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_utilize_nt_caching {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_use_raw_read {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_use_raw_write {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_use_write_raw_data {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_use_encryption {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_buf_files_deny_write {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_buf_read_only_files {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_force_core_create_mode {
        get => NumGet(this, 132, "int")
        set => NumPut("int", value, this, 132)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    wki502_use_512_byte_max_transfer {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }
}
