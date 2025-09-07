#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_DISPOSITION_INFO_EX_FLAGS{

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
