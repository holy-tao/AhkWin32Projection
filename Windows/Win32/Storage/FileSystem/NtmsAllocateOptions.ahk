#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsAllocateOptions {
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
    static NTMS_ALLOCATE_NEW => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ALLOCATE_NEXT => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ALLOCATE_ERROR_IF_UNAVAILABLE => 4
}
