#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CREATE_BIND_LINK_FLAGS {
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
    static CREATE_BIND_LINK_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CREATE_BIND_LINK_FLAG_READ_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static CREATE_BIND_LINK_FLAG_MERGED => 2
}
