#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FS_BPIO_INFLAGS {
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
    static FSBPIO_INFL_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_INFL_SKIP_STORAGE_STACK_QUERY => 1
}
