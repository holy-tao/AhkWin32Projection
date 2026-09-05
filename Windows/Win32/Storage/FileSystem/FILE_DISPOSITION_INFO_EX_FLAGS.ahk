#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_DISPOSITION_INFO_EX_FLAGS extends Win32Enum {

    /**
     * Native name: FILE_DISPOSITION_FLAG_DO_NOT_DELETE
     * @type {Integer (UInt32)}
     */
    static FLAG_DO_NOT_DELETE => 0

    /**
     * Native name: FILE_DISPOSITION_FLAG_DELETE
     * @type {Integer (UInt32)}
     */
    static FLAG_DELETE => 1

    /**
     * Native name: FILE_DISPOSITION_FLAG_POSIX_SEMANTICS
     * @type {Integer (UInt32)}
     */
    static FLAG_POSIX_SEMANTICS => 2

    /**
     * Native name: FILE_DISPOSITION_FLAG_FORCE_IMAGE_SECTION_CHECK
     * @type {Integer (UInt32)}
     */
    static FLAG_FORCE_IMAGE_SECTION_CHECK => 4

    /**
     * Native name: FILE_DISPOSITION_FLAG_ON_CLOSE
     * @type {Integer (UInt32)}
     */
    static FLAG_ON_CLOSE => 8

    /**
     * Native name: FILE_DISPOSITION_FLAG_IGNORE_READONLY_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static FLAG_IGNORE_READONLY_ATTRIBUTE => 16
}
