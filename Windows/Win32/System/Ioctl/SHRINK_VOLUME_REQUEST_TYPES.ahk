#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SHRINK_VOLUME_REQUEST_TYPES {
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
    static ShrinkPrepare => 1

    /**
     * @type {Integer (Int32)}
     */
    static ShrinkCommit => 2

    /**
     * @type {Integer (Int32)}
     */
    static ShrinkAbort => 3
}
