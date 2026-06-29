#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TAPE_INFORMATION_TYPE {
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
    static SET_TAPE_DRIVE_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SET_TAPE_MEDIA_INFORMATION => 0
}
