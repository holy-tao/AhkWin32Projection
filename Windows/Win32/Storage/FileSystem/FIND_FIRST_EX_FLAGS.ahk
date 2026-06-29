#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FIND_FIRST_EX_FLAGS {
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
    static FIND_FIRST_EX_CASE_SENSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_FIRST_EX_LARGE_FETCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_FIRST_EX_ON_DISK_ENTRIES_ONLY => 4
}
