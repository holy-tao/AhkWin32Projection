#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SERVER_INFO_502 structure is obsolete. The structure contains information about a specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_502
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_502 {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that can be open in one session.
     */
    sv502_sessopens : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * T he maximum number of virtual circuits permitted per client.
     */
    sv502_sessvcs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of search operations that can be carried out simultaneously.
     */
    sv502_opensearch : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of each server buffer.
     */
    sv502_sizreqbuf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The initial number of receive buffers, or work items, used by the server.
     */
    sv502_initworkitems : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of receive buffers, or work items, the server can allocate. If this limit is reached, the transport must initiate flow control at a significant performance cost.
     */
    sv502_maxworkitems : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of special work items the server uses for raw mode I/O. A large value for this member can increase performance, but it requires more memory.
     */
    sv502_rawworkitems : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of stack locations that the server allocated in I/O request packets (IRPs).
     */
    sv502_irpstacksize : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum raw mode buffer size, in bytes.
     */
    sv502_maxrawbuflen : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of users that can be logged on to the server using a single virtual circuit.
     */
    sv502_sessusers : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of tree connections that can be made on the server using a single virtual circuit.
     */
    sv502_sessconns : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum size, in bytes, of pageable memory that the server can allocate at any one time.
     */
    sv502_maxpagedmemoryusage : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum size, in bytes, of nonpaged memory that the server can allocate at any one time.
     */
    sv502_maxnonpagedmemoryusage : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server maps a request to a normal open request with shared-read access when the server receives a compatibility open request with read access. Mapping such requests allows several MS-DOS computers to open a single file for read access.
     */
    sv502_enablesoftcompat : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server should force a client to disconnect, even if the client has open files, once the client's logon time has expired.
     */
    sv502_enableforcedlogoff : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server is a reliable time source.
     */
    sv502_timesource : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server accepts function calls from previous-generation LAN Manager clients.
     */
    sv502_acceptdownlevelapis : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the server is visible to LAN Manager 2.x clients.
     */
    sv502_lmannounce : BOOL

}
