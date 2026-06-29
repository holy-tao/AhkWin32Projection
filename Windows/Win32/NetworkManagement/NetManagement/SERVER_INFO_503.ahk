#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SERVER_INFO_503 structure is obsolete. The structure contains information about the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_503
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_503 {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that can be open in one session.
     */
    sv503_sessopens : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of sessions or virtual circuits permitted per client.
     */
    sv503_sessvcs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of search operations that can be carried out simultaneously.
     */
    sv503_opensearch : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of each server buffer.
     */
    sv503_sizreqbuf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The initial number of receive buffers, or work items, used by the server.
     */
    sv503_initworkitems : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of receive buffers, or work items, the server can allocate. If this limit is reached, the transport must initiate flow control at a significant performance cost.
     */
    sv503_maxworkitems : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of special work items the server uses for raw mode I/O. A larger value for this member can increase performance but it requires more memory.
     */
    sv503_rawworkitems : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of stack locations that the server allocated in I/O request packets (IRPs).
     */
    sv503_irpstacksize : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum raw mode buffer size, in bytes.
     */
    sv503_maxrawbuflen : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of users that can be logged on to the server using a single session or virtual circuit.
     */
    sv503_sessusers : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of tree connections that can be made on the server using a single session or virtual circuit.
     */
    sv503_sessconns : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum size, in bytes, of pageable memory that the server can allocate at any one time.
     */
    sv503_maxpagedmemoryusage : UInt32

    sv503_maxnonpagedmemoryusage : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server maps a request to a normal open request with shared-read access when the server receives a compatibility open request with read access. Mapping such requests allows several MS-DOS computers to open a single file for read access. This member is unused.
     */
    sv503_enablesoftcompat : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server should force a client to disconnect, even if the client has open files, once the client's logon time has expired.
     */
    sv503_enableforcedlogoff : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server is a reliable time source.
     */
    sv503_timesource : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server accepts function calls from previous-generation LAN Manager clients.
     */
    sv503_acceptdownlevelapis : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server is visible to LAN Manager 2.x clients.
     */
    sv503_lmannounce : BOOL

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode character string that specifies the name of the server's domain.
     */
    sv503_domain : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum length, in bytes, of copy reads on the server.
     * 
     * This member is unused.
     */
    sv503_maxcopyreadlen : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum length, in bytes, of copy writes on the server.
     * 
     * This member is unused.
     */
    sv503_maxcopywritelen : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum length of time the server retains information about incomplete search operations. This member is unused.
     */
    sv503_minkeepsearch : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum length of time, in seconds,  the server retains information about incomplete search operations.
     */
    sv503_maxkeepsearch : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum length of time, in seconds, the server retains information about complete search operations. This member is unused.
     */
    sv503_minkeepcomplsearch : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum length of time, in seconds, the server retains information about complete search operations. This member is unused.
     */
    sv503_maxkeepcomplsearch : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of additional threads the server should use in addition to one worker thread per processor it already uses. This member is unused.
     */
    sv503_threadcountadd : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of threads set aside by the server to service requests that can block the thread for a significant amount of time.  This member is unused.
     */
    sv503_numblockthreads : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The period of time, in seconds, that the scavenger remains idle before waking up to service requests.
     */
    sv503_scavtimeout : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum number of free receive work items the server requires before it begins to allocate more.
     */
    sv503_minrcvqueue : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum number of available receive work items that the server requires to begin processing a server message block.
     */
    sv503_minfreeworkitems : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the shared memory region used to process server functions.
     */
    sv503_xactmemsize : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The priority of all server threads in relation to the base priority of the process.
     */
    sv503_threadpriority : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of outstanding requests that any one client can send to the server. For example, 10 means you can have 10 unanswered requests at the server. When any single client has 10 requests queued within the server, the client must wait for a server response before sending another request.
     */
    sv503_maxmpxct : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The period of time, in seconds, to wait before timing out an opportunistic lock break request.
     */
    sv503_oplockbreakwait : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The period of time, in seconds, the server waits for a client to respond to an oplock break request from the server.
     */
    sv503_oplockbreakresponsewait : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server allows clients to use opportunistic locks on files. Opportunistic locks are a significant performance enhancement, but have the potential to cause lost cached data on some networks, particularly wide-area networks.
     */
    sv503_enableoplocks : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates how the server should behave if a client has an opportunistic lock (oplock) and does not respond to an oplock break. This member indicates whether the server will fail the second open (value of 0), or force close the open instance of a client that has an oplock (value equal to 1). This member is unused.
     */
    sv503_enableoplockforceclose : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether several MS-DOS File Control Blocks (FCBs) are placed in a single location accessible to the server. If enabled, this can save resources on the server.
     */
    sv503_enablefcbopens : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server processes raw Server Message Blocks (SMBs). If enabled, this allows more data to transfer per transaction and also improves performance. However, it is possible that processing raw SMBs can impede performance on certain networks. The server maintains the value of this member.
     */
    sv503_enableraw : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server allows redirected server drives to be shared.
     */
    sv503_enablesharednetdrives : BOOL

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum number of free connection blocks maintained per endpoint. The server sets these aside to handle bursts of requests by clients to connect to the server.
     */
    sv503_minfreeconnections : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of free connection blocks maintained per endpoint. The server sets these aside to    handle bursts of requests by clients to connect to the server.
     */
    sv503_maxfreeconnections : UInt32

}
