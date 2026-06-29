#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct SECTION_FLAGS {
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
    static SECTION_ALL_ACCESS => 983071

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_MAP_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_MAP_READ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_MAP_EXECUTE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_EXTEND_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_MAP_EXECUTE_EXPLICIT => 32
}
