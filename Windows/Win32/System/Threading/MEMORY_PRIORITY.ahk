#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct MEMORY_PRIORITY {
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
    static MEMORY_PRIORITY_VERY_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_LOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_MEDIUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_BELOW_NORMAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_NORMAL => 5
}
