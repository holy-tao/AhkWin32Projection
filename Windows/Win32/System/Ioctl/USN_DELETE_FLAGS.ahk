#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct USN_DELETE_FLAGS {
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
    static USN_DELETE_FLAG_DELETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USN_DELETE_FLAG_NOTIFY => 2
}
