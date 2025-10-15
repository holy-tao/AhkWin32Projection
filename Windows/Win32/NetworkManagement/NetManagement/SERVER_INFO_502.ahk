#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The SERVER_INFO_502 structure is obsolete. The structure contains information about a specified server.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_502
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_502 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that can be open in one session.
     * @type {Integer}
     */
    sv502_sessopens {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * T he maximum number of virtual circuits permitted per client.
     * @type {Integer}
     */
    sv502_sessvcs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of search operations that can be carried out simultaneously.
     * @type {Integer}
     */
    sv502_opensearch {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of each server buffer.
     * @type {Integer}
     */
    sv502_sizreqbuf {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The initial number of receive buffers, or work items, used by the server.
     * @type {Integer}
     */
    sv502_initworkitems {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of receive buffers, or work items, the server can allocate. If this limit is reached, the transport must initiate flow control at a significant performance cost.
     * @type {Integer}
     */
    sv502_maxworkitems {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of special work items the server uses for raw mode I/O. A large value for this member can increase performance, but it requires more memory.
     * @type {Integer}
     */
    sv502_rawworkitems {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of stack locations that the server allocated in I/O request packets (IRPs).
     * @type {Integer}
     */
    sv502_irpstacksize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum raw mode buffer size, in bytes.
     * @type {Integer}
     */
    sv502_maxrawbuflen {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of users that can be logged on to the server using a single virtual circuit.
     * @type {Integer}
     */
    sv502_sessusers {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of tree connections that can be made on the server using a single virtual circuit.
     * @type {Integer}
     */
    sv502_sessconns {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum size, in bytes, of pageable memory that the server can allocate at any one time.
     * @type {Integer}
     */
    sv502_maxpagedmemoryusage {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum size, in bytes, of nonpaged memory that the server can allocate at any one time.
     * @type {Integer}
     */
    sv502_maxnonpagedmemoryusage {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server maps a request to a normal open request with shared-read access when the server receives a compatibility open request with read access. Mapping such requests allows several MS-DOS computers to open a single file for read access.
     * @type {BOOL}
     */
    sv502_enablesoftcompat{
        get {
            if(!this.HasProp("__sv502_enablesoftcompat"))
                this.__sv502_enablesoftcompat := BOOL(this.ptr + 52)
            return this.__sv502_enablesoftcompat
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server should force a client to disconnect, even if the client has open files, once the client's logon time has expired.
     * @type {BOOL}
     */
    sv502_enableforcedlogoff{
        get {
            if(!this.HasProp("__sv502_enableforcedlogoff"))
                this.__sv502_enableforcedlogoff := BOOL(this.ptr + 56)
            return this.__sv502_enableforcedlogoff
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server is a reliable time source.
     * @type {BOOL}
     */
    sv502_timesource{
        get {
            if(!this.HasProp("__sv502_timesource"))
                this.__sv502_timesource := BOOL(this.ptr + 60)
            return this.__sv502_timesource
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server accepts function calls from previous-generation LAN Manager clients.
     * @type {BOOL}
     */
    sv502_acceptdownlevelapis{
        get {
            if(!this.HasProp("__sv502_acceptdownlevelapis"))
                this.__sv502_acceptdownlevelapis := BOOL(this.ptr + 64)
            return this.__sv502_acceptdownlevelapis
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server is visible to LAN Manager 2.x clients.
     * @type {BOOL}
     */
    sv502_lmannounce{
        get {
            if(!this.HasProp("__sv502_lmannounce"))
                this.__sv502_lmannounce := BOOL(this.ptr + 68)
            return this.__sv502_lmannounce
        }
    }
}
