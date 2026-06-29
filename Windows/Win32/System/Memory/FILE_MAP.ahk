#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct FILE_MAP {
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
    static FILE_MAP_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_READ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_ALL_ACCESS => 983071

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_EXECUTE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_COPY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_RESERVE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_TARGETS_INVALID => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_LARGE_PAGES => 536870912
}
