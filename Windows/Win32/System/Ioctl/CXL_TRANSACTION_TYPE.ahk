#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_TRANSACTION_TYPE extends Win32Enum {

    /**
     * Native name: CxlTransactionType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: CxlTransactionType_HostRead
     * @type {Integer (Int32)}
     */
    static HostRead => 1

    /**
     * Native name: CxlTransactionType_HostWrite
     * @type {Integer (Int32)}
     */
    static HostWrite => 2

    /**
     * Native name: CxlTransactionType_HostScanMedia
     * @type {Integer (Int32)}
     */
    static HostScanMedia => 3

    /**
     * Native name: CxlTransactionType_HostInjectPoison
     * @type {Integer (Int32)}
     */
    static HostInjectPoison => 4

    /**
     * Native name: CxlTransactionType_MediaPatrolScrub
     * @type {Integer (Int32)}
     */
    static MediaPatrolScrub => 5

    /**
     * Native name: CxlTransactionType_MediaManagement
     * @type {Integer (Int32)}
     */
    static MediaManagement => 6

    /**
     * Native name: CxlTransactionType_InternalMediaCheckScrub
     * @type {Integer (Int32)}
     */
    static InternalMediaCheckScrub => 7

    /**
     * Native name: CxlTransactionType_MediaInitialization
     * @type {Integer (Int32)}
     */
    static MediaInitialization => 8
}
