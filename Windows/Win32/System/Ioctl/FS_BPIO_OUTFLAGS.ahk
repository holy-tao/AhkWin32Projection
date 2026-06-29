#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FS_BPIO_OUTFLAGS {
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
    static FSBPIO_OUTFL_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_OUTFL_VOLUME_STACK_BYPASS_PAUSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_OUTFL_STREAM_BYPASS_PAUSED => 2

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_OUTFL_FILTER_ATTACH_BLOCKED => 4

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_OUTFL_COMPATIBLE_STORAGE_DRIVER => 8
}
