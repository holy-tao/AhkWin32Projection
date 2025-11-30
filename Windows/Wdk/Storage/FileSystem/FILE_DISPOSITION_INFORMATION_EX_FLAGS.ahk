#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_DISPOSITION_INFORMATION_EX_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_DO_NOT_DELETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_DELETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_POSIX_SEMANTICS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_FORCE_IMAGE_SECTION_CHECK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_ON_CLOSE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DISPOSITION_IGNORE_READONLY_ATTRIBUTE => 16
}
