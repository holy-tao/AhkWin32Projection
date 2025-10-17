#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_503 structure is obsolete. The structure contains information about the specified server.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_503
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_503 extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that can be open in one session.
     * @type {Integer}
     */
    sv503_sessopens {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of sessions or virtual circuits permitted per client.
     * @type {Integer}
     */
    sv503_sessvcs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of search operations that can be carried out simultaneously.
     * @type {Integer}
     */
    sv503_opensearch {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of each server buffer.
     * @type {Integer}
     */
    sv503_sizreqbuf {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The initial number of receive buffers, or work items, used by the server.
     * @type {Integer}
     */
    sv503_initworkitems {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of receive buffers, or work items, the server can allocate. If this limit is reached, the transport must initiate flow control at a significant performance cost.
     * @type {Integer}
     */
    sv503_maxworkitems {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of special work items the server uses for raw mode I/O. A larger value for this member can increase performance but it requires more memory.
     * @type {Integer}
     */
    sv503_rawworkitems {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of stack locations that the server allocated in I/O request packets (IRPs).
     * @type {Integer}
     */
    sv503_irpstacksize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum raw mode buffer size, in bytes.
     * @type {Integer}
     */
    sv503_maxrawbuflen {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of users that can be logged on to the server using a single session or virtual circuit.
     * @type {Integer}
     */
    sv503_sessusers {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of tree connections that can be made on the server using a single session or virtual circuit.
     * @type {Integer}
     */
    sv503_sessconns {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum size, in bytes, of pageable memory that the server can allocate at any one time.
     * @type {Integer}
     */
    sv503_maxpagedmemoryusage {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * 
     * @type {Integer}
     */
    sv503_maxnonpagedmemoryusage {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server maps a request to a normal open request with shared-read access when the server receives a compatibility open request with read access. Mapping such requests allows several MS-DOS computers to open a single file for read access. This member is unused.
     * @type {BOOL}
     */
    sv503_enablesoftcompat {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server should force a client to disconnect, even if the client has open files, once the client's logon time has expired.
     * @type {BOOL}
     */
    sv503_enableforcedlogoff {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server is a reliable time source.
     * @type {BOOL}
     */
    sv503_timesource {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server accepts function calls from previous-generation LAN Manager clients.
     * @type {BOOL}
     */
    sv503_acceptdownlevelapis {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server is visible to LAN Manager 2.x clients.
     * @type {BOOL}
     */
    sv503_lmannounce {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode character string that specifies the name of the server's domain.
     * @type {PWSTR}
     */
    sv503_domain {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum length, in bytes, of copy reads on the server.
     * 
     * This member is unused.
     * @type {Integer}
     */
    sv503_maxcopyreadlen {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum length, in bytes, of copy writes on the server.
     * 
     * This member is unused.
     * @type {Integer}
     */
    sv503_maxcopywritelen {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum length of time the server retains information about incomplete search operations. This member is unused.
     * @type {Integer}
     */
    sv503_minkeepsearch {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum length of time, in seconds,  the server retains information about incomplete search operations.
     * @type {Integer}
     */
    sv503_maxkeepsearch {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum length of time, in seconds, the server retains information about complete search operations. This member is unused.
     * @type {Integer}
     */
    sv503_minkeepcomplsearch {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum length of time, in seconds, the server retains information about complete search operations. This member is unused.
     * @type {Integer}
     */
    sv503_maxkeepcomplsearch {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of additional threads the server should use in addition to one worker thread per processor it already uses. This member is unused.
     * @type {Integer}
     */
    sv503_threadcountadd {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of threads set aside by the server to service requests that can block the thread for a significant amount of time.  This member is unused.
     * @type {Integer}
     */
    sv503_numblockthreads {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The period of time, in seconds, that the scavenger remains idle before waking up to service requests.
     * @type {Integer}
     */
    sv503_scavtimeout {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum number of free receive work items the server requires before it begins to allocate more.
     * @type {Integer}
     */
    sv503_minrcvqueue {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum number of available receive work items that the server requires to begin processing a server message block.
     * @type {Integer}
     */
    sv503_minfreeworkitems {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the shared memory region used to process server functions.
     * @type {Integer}
     */
    sv503_xactmemsize {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The priority of all server threads in relation to the base priority of the process.
     * @type {Integer}
     */
    sv503_threadpriority {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of outstanding requests that any one client can send to the server. For example, 10 means you can have 10 unanswered requests at the server. When any single client has 10 requests queued within the server, the client must wait for a server response before sending another request.
     * @type {Integer}
     */
    sv503_maxmpxct {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The period of time, in seconds, to wait before timing out an opportunistic lock break request.
     * @type {Integer}
     */
    sv503_oplockbreakwait {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The period of time, in seconds, the server waits for a client to respond to an oplock break request from the server.
     * @type {Integer}
     */
    sv503_oplockbreakresponsewait {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server allows clients to use opportunistic locks on files. Opportunistic locks are a significant performance enhancement, but have the potential to cause lost cached data on some networks, particularly wide-area networks.
     * @type {BOOL}
     */
    sv503_enableoplocks {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates how the server should behave if a client has an opportunistic lock (oplock) and does not respond to an oplock break. This member indicates whether the server will fail the second open (value of 0), or force close the open instance of a client that has an oplock (value equal to 1). This member is unused.
     * @type {BOOL}
     */
    sv503_enableoplockforceclose {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether several MS-DOS File Control Blocks (FCBs) are placed in a single location accessible to the server. If enabled, this can save resources on the server.
     * @type {BOOL}
     */
    sv503_enablefcbopens {
        get => NumGet(this, 152, "int")
        set => NumPut("int", value, this, 152)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server processes raw Server Message Blocks (SMBs). If enabled, this allows more data to transfer per transaction and also improves performance. However, it is possible that processing raw SMBs can impede performance on certain networks. The server maintains the value of this member.
     * @type {BOOL}
     */
    sv503_enableraw {
        get => NumGet(this, 156, "int")
        set => NumPut("int", value, this, 156)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server allows redirected server drives to be shared.
     * @type {BOOL}
     */
    sv503_enablesharednetdrives {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum number of free connection blocks maintained per endpoint. The server sets these aside to handle bursts of requests by clients to connect to the server.
     * @type {Integer}
     */
    sv503_minfreeconnections {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of free connection blocks maintained per endpoint. The server sets these aside to    handle bursts of requests by clients to connect to the server.
     * @type {Integer}
     */
    sv503_maxfreeconnections {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }
}
