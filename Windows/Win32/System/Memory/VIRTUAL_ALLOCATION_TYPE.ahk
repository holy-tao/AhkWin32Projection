#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct VIRTUAL_ALLOCATION_TYPE {
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
    static MEM_COMMIT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESERVE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESET => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESET_UNDO => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_REPLACE_PLACEHOLDER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_LARGE_PAGES => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESERVE_PLACEHOLDER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_FREE => 65536
}
