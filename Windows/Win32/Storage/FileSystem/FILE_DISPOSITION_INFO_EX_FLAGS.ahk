#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_DISPOSITION_INFO_EX_FLAGS {
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
    static FILE_DISPOSITION_FLAG_DO_NOT_DELETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_FLAG_DELETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_FLAG_POSIX_SEMANTICS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_FLAG_FORCE_IMAGE_SECTION_CHECK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_FLAG_ON_CLOSE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_FLAG_IGNORE_READONLY_ATTRIBUTE => 16
}
