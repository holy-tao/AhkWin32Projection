#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct NTCREATEFILE_CREATE_DISPOSITION {
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
    static FILE_SUPERSEDE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CREATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_IF => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OVERWRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OVERWRITE_IF => 5
}
