#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_WRITE_FLAGS {
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
    static FILE_WRITE_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FILE_WRITE_FLAGS_WRITE_THROUGH => 1
}
