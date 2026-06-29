#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct XACTHEURISTIC {
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
    static XACTHEURISTIC_ABORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static XACTHEURISTIC_COMMIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static XACTHEURISTIC_DAMAGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static XACTHEURISTIC_DANGER => 4
}
