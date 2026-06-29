#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SYMBOLIC_LINK_FLAGS {
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
    static SYMBOLIC_LINK_FLAG_DIRECTORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMBOLIC_LINK_FLAG_ALLOW_UNPRIVILEGED_CREATE => 2
}
