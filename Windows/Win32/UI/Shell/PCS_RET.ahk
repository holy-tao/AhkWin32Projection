#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PCS_RET {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PCS_FATAL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PCS_REPLACEDCHAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCS_REMOVEDCHAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCS_TRUNCATED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCS_PATHTOOLONG => 8
}
