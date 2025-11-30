#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ISOLATIONLEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ISOLATIONLEVEL_UNSPECIFIED => -1

    /**
     * @type {Integer (Int32)}
     */
    static ISOLATIONLEVEL_CHAOS => 16

    /**
     * @type {Integer (Int32)}
     */
    static ISOLATIONLEVEL_READUNCOMMITTED => 256

    /**
     * @type {Integer (Int32)}
     */
    static ISOLATIONLEVEL_BROWSE => 256

    /**
     * @type {Integer (Int32)}
     */
    static ISOLATIONLEVEL_CURSORSTABILITY => 4096

    /**
     * @type {Integer (Int32)}
     */
    static ISOLATIONLEVEL_READCOMMITTED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static ISOLATIONLEVEL_REPEATABLEREAD => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ISOLATIONLEVEL_SERIALIZABLE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static ISOLATIONLEVEL_ISOLATED => 1048576
}
