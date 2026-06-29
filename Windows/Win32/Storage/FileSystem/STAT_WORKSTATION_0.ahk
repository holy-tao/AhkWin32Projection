#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The STAT_WORKSTATION_0 structure (lmstats.h) contains statistical information about the specified workstation.
 * @see https://learn.microsoft.com/windows/win32/api/lmstats/ns-lmstats-stat_workstation_0~r1
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct STAT_WORKSTATION_0 {
    #StructPack 8

    /**
     * Specifies the time statistics collection started.
     * 
     * This member also indicates when statistics for the workstations were last cleared. The value is stored as the number of seconds elapsed since 00:00:00, January 1, 1970.
     */
    StatisticsStartTime : Int64

    /**
     * Specifies the total number of bytes received by the workstation.
     */
    BytesReceived : Int64

    /**
     * Specifies the total number of server message blocks (SMBs) received by the workstation.
     */
    SmbsReceived : Int64

    /**
     * Specifies the total number of bytes that have been read by paging I/O requests.
     */
    PagingReadBytesRequested : Int64

    /**
     * Specifies the total number of bytes that have been read by non-paging I/O requests.
     */
    NonPagingReadBytesRequested : Int64

    /**
     * Specifies the total number of bytes that have been read by cache I/O requests.
     */
    CacheReadBytesRequested : Int64

    /**
     * Specifies the total amount of bytes that have been read by disk I/O requests.
     */
    NetworkReadBytesRequested : Int64

    /**
     * Specifies the total number of bytes transmitted by the workstation.
     */
    BytesTransmitted : Int64

    /**
     * Specifies the total number of SMBs transmitted by the workstation.
     */
    SmbsTransmitted : Int64

    /**
     * Specifies the total number of bytes that have been written by paging I/O requests.
     */
    PagingWriteBytesRequested : Int64

    /**
     * Specifies the total number of bytes that have been written by non-paging I/O requests.
     */
    NonPagingWriteBytesRequested : Int64

    /**
     * Specifies the total number of bytes that have been written by cache I/O requests.
     */
    CacheWriteBytesRequested : Int64

    /**
     * Specifies the total number of bytes that have been written by disk I/O requests.
     */
    NetworkWriteBytesRequested : Int64

    /**
     * Specifies the total number of network operations that failed to begin.
     */
    InitiallyFailedOperations : UInt32

    /**
     * Specifies the total number of network operations that failed to complete.
     */
    FailedCompletionOperations : UInt32

    /**
     * Specifies the total number of read operations initiated by the workstation.
     */
    ReadOperations : UInt32

    /**
     * Specifies the total number of random access reads initiated by the workstation.
     */
    RandomReadOperations : UInt32

    /**
     * Specifies the total number of read requests the workstation has sent to servers.
     */
    ReadSmbs : UInt32

    /**
     * Specifies the total number of read requests the workstation has sent to servers that are greater than twice the size of the server's negotiated buffer size.
     */
    LargeReadSmbs : UInt32

    /**
     * Specifies the total number of read requests the workstation has sent to servers that are less than 1/4 of the size of the server's negotiated buffer size.
     */
    SmallReadSmbs : UInt32

    /**
     * Specifies the total number of write operations initiated by the workstation.
     */
    WriteOperations : UInt32

    /**
     * Specifies the total number of random access writes initiated by the workstation.
     */
    RandomWriteOperations : UInt32

    /**
     * Specifies the total number of write requests the workstation has sent to servers.
     */
    WriteSmbs : UInt32

    /**
     * Specifies the total number of write requests the workstation has sent to servers that are greater than twice the size of the server's negotiated buffer size.
     */
    LargeWriteSmbs : UInt32

    /**
     * Specifies the total number of write requests the workstation has sent to servers that are less than 1/4 of the size of the server's negotiated buffer size.
     */
    SmallWriteSmbs : UInt32

    /**
     * Specifies the total number of raw read requests made by the workstation that have been denied.
     */
    RawReadsDenied : UInt32

    /**
     * Specifies the total number of raw write requests made by the workstation that have been denied.
     */
    RawWritesDenied : UInt32

    /**
     * Specifies the total number of network errors received by the workstation.
     */
    NetworkErrors : UInt32

    /**
     * Specifies the total number of sessions established by the workstation.
     */
    Sessions : UInt32

    /**
     * Specifies the number of times the workstation attempted to create a session but failed.
     */
    FailedSessions : UInt32

    /**
     * Specifies the total number of connections that have failed.
     */
    Reconnects : UInt32

    /**
     * Specifies the total number of connections to servers supporting the PCNET dialect that have succeeded.
     */
    CoreConnects : UInt32

    /**
     * Specifies the total number of connections to servers supporting the LanManager 2.0 dialect that have succeeded.
     */
    Lanman20Connects : UInt32

    /**
     * Specifies the total number of connections to servers supporting the LanManager 2.1 dialect that have succeeded.
     */
    Lanman21Connects : UInt32

    /**
     * Specifies the total number of connections to servers supporting the NTLM dialect that have succeeded.
     */
    LanmanNtConnects : UInt32

    /**
     * Specifies the number of times the workstation was disconnected by a network server.
     */
    ServerDisconnects : UInt32

    /**
     * Specifies the total number of sessions that have expired on the workstation.
     */
    HungSessions : UInt32

    /**
     * Specifies the total number of network connections established by the workstation.
     */
    UseCount : UInt32

    /**
     * Specifies the total number of failed network connections for the workstation.
     */
    FailedUseCount : UInt32

    /**
     * Specifies the number of current requests that have not been completed.
     */
    CurrentCommands : UInt32

}
