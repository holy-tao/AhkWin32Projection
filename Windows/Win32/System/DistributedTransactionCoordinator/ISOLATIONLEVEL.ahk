#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class ISOLATIONLEVEL extends Win32Enum {

    /**
     * Native name: ISOLATIONLEVEL_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => -1

    /**
     * Native name: ISOLATIONLEVEL_CHAOS
     * @type {Integer (Int32)}
     */
    static CHAOS => 16

    /**
     * Native name: ISOLATIONLEVEL_READUNCOMMITTED
     * @type {Integer (Int32)}
     */
    static READUNCOMMITTED => 256

    /**
     * Native name: ISOLATIONLEVEL_BROWSE
     * @type {Integer (Int32)}
     */
    static BROWSE => 256

    /**
     * Native name: ISOLATIONLEVEL_CURSORSTABILITY
     * @type {Integer (Int32)}
     */
    static CURSORSTABILITY => 4096

    /**
     * Native name: ISOLATIONLEVEL_READCOMMITTED
     * @type {Integer (Int32)}
     */
    static READCOMMITTED => 4096

    /**
     * Native name: ISOLATIONLEVEL_REPEATABLEREAD
     * @type {Integer (Int32)}
     */
    static REPEATABLEREAD => 65536

    /**
     * Native name: ISOLATIONLEVEL_SERIALIZABLE
     * @type {Integer (Int32)}
     */
    static SERIALIZABLE => 1048576

    /**
     * Native name: ISOLATIONLEVEL_ISOLATED
     * @type {Integer (Int32)}
     */
    static ISOLATED => 1048576
}
