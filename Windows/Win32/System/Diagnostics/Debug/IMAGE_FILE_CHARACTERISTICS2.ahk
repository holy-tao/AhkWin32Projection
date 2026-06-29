#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_FILE_CHARACTERISTICS2 {
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
    static IMAGE_FILE_RELOCS_STRIPPED2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_EXECUTABLE_IMAGE2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_LINE_NUMS_STRIPPED2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_LOCAL_SYMS_STRIPPED2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_AGGRESIVE_WS_TRIM2 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_LARGE_ADDRESS_AWARE2 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_BYTES_REVERSED_LO2 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_32BIT_MACHINE2 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_DEBUG_STRIPPED2 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP2 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_NET_RUN_FROM_SWAP2 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_SYSTEM_2 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_DLL_2 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_UP_SYSTEM_ONLY_2 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FILE_BYTES_REVERSED_HI_2 => 32768
}
