#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsLibraryType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYTYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYTYPE_OFFLINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYTYPE_ONLINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYTYPE_STANDALONE => 3
}
