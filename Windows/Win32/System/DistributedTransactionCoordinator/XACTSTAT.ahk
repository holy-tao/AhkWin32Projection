#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class XACTSTAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_OPENNORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_OPENREFUSED => 2

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_PREPARING => 4

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_PREPARED => 8

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_PREPARERETAINING => 16

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_PREPARERETAINED => 32

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_COMMITTING => 64

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_COMMITRETAINING => 128

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_ABORTING => 256

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_ABORTED => 512

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_COMMITTED => 1024

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_HEURISTIC_ABORT => 2048

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_HEURISTIC_COMMIT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_HEURISTIC_DAMAGE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_HEURISTIC_DANGER => 16384

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_FORCED_ABORT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_FORCED_COMMIT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_INDOUBT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_CLOSED => 262144

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_OPEN => 3

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_NOTPREPARED => 524227

    /**
     * @type {Integer (Int32)}
     */
    static XACTSTAT_ALL => 524287
}
