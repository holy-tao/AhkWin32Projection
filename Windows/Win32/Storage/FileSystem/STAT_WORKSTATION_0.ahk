#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The STAT_WORKSTATION_0 structure (lmstats.h) contains statistical information about the specified workstation.
 * @see https://learn.microsoft.com/windows/win32/api/lmstats/ns-lmstats-stat_workstation_0~r1
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class STAT_WORKSTATION_0 extends Win32Struct
{
    static sizeof => 216

    static packingSize => 8

    /**
     * Specifies the time statistics collection started.
     * 
     * This member also indicates when statistics for the workstations were last cleared. The value is stored as the number of seconds elapsed since 00:00:00, January 1, 1970.
     * @type {Integer}
     */
    StatisticsStartTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Specifies the total number of bytes received by the workstation.
     * @type {Integer}
     */
    BytesReceived {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Specifies the total number of server message blocks (SMBs) received by the workstation.
     * @type {Integer}
     */
    SmbsReceived {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Specifies the total number of bytes that have been read by paging I/O requests.
     * @type {Integer}
     */
    PagingReadBytesRequested {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Specifies the total number of bytes that have been read by non-paging I/O requests.
     * @type {Integer}
     */
    NonPagingReadBytesRequested {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * Specifies the total number of bytes that have been read by cache I/O requests.
     * @type {Integer}
     */
    CacheReadBytesRequested {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * Specifies the total amount of bytes that have been read by disk I/O requests.
     * @type {Integer}
     */
    NetworkReadBytesRequested {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * Specifies the total number of bytes transmitted by the workstation.
     * @type {Integer}
     */
    BytesTransmitted {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * Specifies the total number of SMBs transmitted by the workstation.
     * @type {Integer}
     */
    SmbsTransmitted {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * Specifies the total number of bytes that have been written by paging I/O requests.
     * @type {Integer}
     */
    PagingWriteBytesRequested {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * Specifies the total number of bytes that have been written by non-paging I/O requests.
     * @type {Integer}
     */
    NonPagingWriteBytesRequested {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * Specifies the total number of bytes that have been written by cache I/O requests.
     * @type {Integer}
     */
    CacheWriteBytesRequested {
        get => NumGet(this, 88, "int64")
        set => NumPut("int64", value, this, 88)
    }

    /**
     * Specifies the total number of bytes that have been written by disk I/O requests.
     * @type {Integer}
     */
    NetworkWriteBytesRequested {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * Specifies the total number of network operations that failed to begin.
     * @type {Integer}
     */
    InitiallyFailedOperations {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Specifies the total number of network operations that failed to complete.
     * @type {Integer}
     */
    FailedCompletionOperations {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Specifies the total number of read operations initiated by the workstation.
     * @type {Integer}
     */
    ReadOperations {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Specifies the total number of random access reads initiated by the workstation.
     * @type {Integer}
     */
    RandomReadOperations {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Specifies the total number of read requests the workstation has sent to servers.
     * @type {Integer}
     */
    ReadSmbs {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Specifies the total number of read requests the workstation has sent to servers that are greater than twice the size of the server's negotiated buffer size.
     * @type {Integer}
     */
    LargeReadSmbs {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Specifies the total number of read requests the workstation has sent to servers that are less than 1/4 of the size of the server's negotiated buffer size.
     * @type {Integer}
     */
    SmallReadSmbs {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Specifies the total number of write operations initiated by the workstation.
     * @type {Integer}
     */
    WriteOperations {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Specifies the total number of random access writes initiated by the workstation.
     * @type {Integer}
     */
    RandomWriteOperations {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Specifies the total number of write requests the workstation has sent to servers.
     * @type {Integer}
     */
    WriteSmbs {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Specifies the total number of write requests the workstation has sent to servers that are greater than twice the size of the server's negotiated buffer size.
     * @type {Integer}
     */
    LargeWriteSmbs {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Specifies the total number of write requests the workstation has sent to servers that are less than 1/4 of the size of the server's negotiated buffer size.
     * @type {Integer}
     */
    SmallWriteSmbs {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Specifies the total number of raw read requests made by the workstation that have been denied.
     * @type {Integer}
     */
    RawReadsDenied {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Specifies the total number of raw write requests made by the workstation that have been denied.
     * @type {Integer}
     */
    RawWritesDenied {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * Specifies the total number of network errors received by the workstation.
     * @type {Integer}
     */
    NetworkErrors {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Specifies the total number of sessions established by the workstation.
     * @type {Integer}
     */
    Sessions {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Specifies the number of times the workstation attempted to create a session but failed.
     * @type {Integer}
     */
    FailedSessions {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Specifies the total number of connections that have failed.
     * @type {Integer}
     */
    Reconnects {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * Specifies the total number of connections to servers supporting the PCNET dialect that have succeeded.
     * @type {Integer}
     */
    CoreConnects {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * Specifies the total number of connections to servers supporting the LanManager 2.0 dialect that have succeeded.
     * @type {Integer}
     */
    Lanman20Connects {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * Specifies the total number of connections to servers supporting the LanManager 2.1 dialect that have succeeded.
     * @type {Integer}
     */
    Lanman21Connects {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * Specifies the total number of connections to servers supporting the NTLM dialect that have succeeded.
     * @type {Integer}
     */
    LanmanNtConnects {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * Specifies the number of times the workstation was disconnected by a network server.
     * @type {Integer}
     */
    ServerDisconnects {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * Specifies the total number of sessions that have expired on the workstation.
     * @type {Integer}
     */
    HungSessions {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * Specifies the total number of network connections established by the workstation.
     * @type {Integer}
     */
    UseCount {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * Specifies the total number of failed network connections for the workstation.
     * @type {Integer}
     */
    FailedUseCount {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * Specifies the number of current requests that have not been completed.
     * @type {Integer}
     */
    CurrentCommands {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }
}
