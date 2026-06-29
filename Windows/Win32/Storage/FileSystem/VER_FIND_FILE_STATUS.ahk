#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VER_FIND_FILE_STATUS {
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
    static VFF_CURNEDEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VFF_FILEINUSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VFF_BUFFTOOSMALL => 4
}
