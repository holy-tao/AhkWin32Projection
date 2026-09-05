#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FILE_DISPOSITION_INFORMATION_EX_FLAGS extends Win32Enum {

    /**
     * Native name: FILE_DISPOSITION_DO_NOT_DELETE
     * @type {Integer (UInt32)}
     */
    static DO_NOT_DELETE => 0

    /**
     * Native name: FILE_DISPOSITION_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 1

    /**
     * Native name: FILE_DISPOSITION_POSIX_SEMANTICS
     * @type {Integer (UInt32)}
     */
    static POSIX_SEMANTICS => 2

    /**
     * Native name: FILE_DISPOSITION_FORCE_IMAGE_SECTION_CHECK
     * @type {Integer (UInt32)}
     */
    static FORCE_IMAGE_SECTION_CHECK => 4

    /**
     * Native name: FILE_DISPOSITION_ON_CLOSE
     * @type {Integer (UInt32)}
     */
    static ON_CLOSE => 8

    /**
     * Native name: FILE_DISPOSITION_IGNORE_READONLY_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static IGNORE_READONLY_ATTRIBUTE => 16
}
