#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_MEMORY_TYPE {
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
    static MemoryTypePaged => 0

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeNonPaged => 1

    /**
     * @type {Integer (Int32)}
     */
    static MemoryType64KPage => 2

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeLargePage => 3

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeHugePage => 4

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeCustom => 5

    /**
     * @type {Integer (Int32)}
     */
    static MemoryTypeMax => 6
}
