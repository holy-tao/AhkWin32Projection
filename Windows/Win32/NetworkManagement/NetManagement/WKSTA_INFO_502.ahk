#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The WKSTA_INFO_502 structure is obsolete. The structure contains information about a workstation environment.
 * @see https://docs.microsoft.com/windows/win32/api//lmwksta/ns-lmwksta-wksta_info_502
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
     * @type {BOOL}
     */
    wki502_log_election_packets{
        get {
            if(!this.HasProp("__wki502_log_election_packets"))
                this.__wki502_log_election_packets := BOOL(this.ptr + 80)
            return this.__wki502_log_election_packets
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_use_opportunistic_locking{
        get {
            if(!this.HasProp("__wki502_use_opportunistic_locking"))
                this.__wki502_use_opportunistic_locking := BOOL(this.ptr + 84)
            return this.__wki502_use_opportunistic_locking
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_use_unlock_behind{
        get {
            if(!this.HasProp("__wki502_use_unlock_behind"))
                this.__wki502_use_unlock_behind := BOOL(this.ptr + 88)
            return this.__wki502_use_unlock_behind
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_use_close_behind{
        get {
            if(!this.HasProp("__wki502_use_close_behind"))
                this.__wki502_use_close_behind := BOOL(this.ptr + 92)
            return this.__wki502_use_close_behind
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_buf_named_pipes{
        get {
            if(!this.HasProp("__wki502_buf_named_pipes"))
                this.__wki502_buf_named_pipes := BOOL(this.ptr + 96)
            return this.__wki502_buf_named_pipes
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_use_lock_read_unlock{
        get {
            if(!this.HasProp("__wki502_use_lock_read_unlock"))
                this.__wki502_use_lock_read_unlock := BOOL(this.ptr + 100)
            return this.__wki502_use_lock_read_unlock
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_utilize_nt_caching{
        get {
            if(!this.HasProp("__wki502_utilize_nt_caching"))
                this.__wki502_utilize_nt_caching := BOOL(this.ptr + 104)
            return this.__wki502_utilize_nt_caching
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_use_raw_read{
        get {
            if(!this.HasProp("__wki502_use_raw_read"))
                this.__wki502_use_raw_read := BOOL(this.ptr + 108)
            return this.__wki502_use_raw_read
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_use_raw_write{
        get {
            if(!this.HasProp("__wki502_use_raw_write"))
                this.__wki502_use_raw_write := BOOL(this.ptr + 112)
            return this.__wki502_use_raw_write
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_use_write_raw_data{
        get {
            if(!this.HasProp("__wki502_use_write_raw_data"))
                this.__wki502_use_write_raw_data := BOOL(this.ptr + 116)
            return this.__wki502_use_write_raw_data
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_use_encryption{
        get {
            if(!this.HasProp("__wki502_use_encryption"))
                this.__wki502_use_encryption := BOOL(this.ptr + 120)
            return this.__wki502_use_encryption
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_buf_files_deny_write{
        get {
            if(!this.HasProp("__wki502_buf_files_deny_write"))
                this.__wki502_buf_files_deny_write := BOOL(this.ptr + 124)
            return this.__wki502_buf_files_deny_write
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_buf_read_only_files{
        get {
            if(!this.HasProp("__wki502_buf_read_only_files"))
                this.__wki502_buf_read_only_files := BOOL(this.ptr + 128)
            return this.__wki502_buf_read_only_files
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_force_core_create_mode{
        get {
            if(!this.HasProp("__wki502_force_core_create_mode"))
                this.__wki502_force_core_create_mode := BOOL(this.ptr + 132)
            return this.__wki502_force_core_create_mode
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {BOOL}
     */
    wki502_use_512_byte_max_transfer{
        get {
            if(!this.HasProp("__wki502_use_512_byte_max_transfer"))
                this.__wki502_use_512_byte_max_transfer := BOOL(this.ptr + 136)
            return this.__wki502_use_512_byte_max_transfer
        }
    }
}
