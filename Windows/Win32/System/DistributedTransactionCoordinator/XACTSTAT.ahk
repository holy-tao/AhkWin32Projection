#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class XACTSTAT extends Win32Enum {

    /**
     * Native name: XACTSTAT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: XACTSTAT_OPENNORMAL
     * @type {Integer (Int32)}
     */
    static OPENNORMAL => 1

    /**
     * Native name: XACTSTAT_OPENREFUSED
     * @type {Integer (Int32)}
     */
    static OPENREFUSED => 2

    /**
     * Native name: XACTSTAT_PREPARING
     * @type {Integer (Int32)}
     */
    static PREPARING => 4

    /**
     * Native name: XACTSTAT_PREPARED
     * @type {Integer (Int32)}
     */
    static PREPARED => 8

    /**
     * Native name: XACTSTAT_PREPARERETAINING
     * @type {Integer (Int32)}
     */
    static PREPARERETAINING => 16

    /**
     * Native name: XACTSTAT_PREPARERETAINED
     * @type {Integer (Int32)}
     */
    static PREPARERETAINED => 32

    /**
     * Native name: XACTSTAT_COMMITTING
     * @type {Integer (Int32)}
     */
    static COMMITTING => 64

    /**
     * Native name: XACTSTAT_COMMITRETAINING
     * @type {Integer (Int32)}
     */
    static COMMITRETAINING => 128

    /**
     * Native name: XACTSTAT_ABORTING
     * @type {Integer (Int32)}
     */
    static ABORTING => 256

    /**
     * Native name: XACTSTAT_ABORTED
     * @type {Integer (Int32)}
     */
    static ABORTED => 512

    /**
     * Native name: XACTSTAT_COMMITTED
     * @type {Integer (Int32)}
     */
    static COMMITTED => 1024

    /**
     * Native name: XACTSTAT_HEURISTIC_ABORT
     * @type {Integer (Int32)}
     */
    static HEURISTIC_ABORT => 2048

    /**
     * Native name: XACTSTAT_HEURISTIC_COMMIT
     * @type {Integer (Int32)}
     */
    static HEURISTIC_COMMIT => 4096

    /**
     * Native name: XACTSTAT_HEURISTIC_DAMAGE
     * @type {Integer (Int32)}
     */
    static HEURISTIC_DAMAGE => 8192

    /**
     * Native name: XACTSTAT_HEURISTIC_DANGER
     * @type {Integer (Int32)}
     */
    static HEURISTIC_DANGER => 16384

    /**
     * Native name: XACTSTAT_FORCED_ABORT
     * @type {Integer (Int32)}
     */
    static FORCED_ABORT => 32768

    /**
     * Native name: XACTSTAT_FORCED_COMMIT
     * @type {Integer (Int32)}
     */
    static FORCED_COMMIT => 65536

    /**
     * Native name: XACTSTAT_INDOUBT
     * @type {Integer (Int32)}
     */
    static INDOUBT => 131072

    /**
     * Native name: XACTSTAT_CLOSED
     * @type {Integer (Int32)}
     */
    static CLOSED => 262144

    /**
     * Native name: XACTSTAT_OPEN
     * @type {Integer (Int32)}
     */
    static OPEN => 3

    /**
     * Native name: XACTSTAT_NOTPREPARED
     * @type {Integer (Int32)}
     */
    static NOTPREPARED => 524227

    /**
     * Native name: XACTSTAT_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 524287
}
