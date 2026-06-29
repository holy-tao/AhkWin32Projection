#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ISOLATIONLEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
