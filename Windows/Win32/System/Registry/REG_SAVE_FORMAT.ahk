#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 */
export default struct REG_SAVE_FORMAT {
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
    static REG_STANDARD_FORMAT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_LATEST_FORMAT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NO_COMPRESSION => 4
}
