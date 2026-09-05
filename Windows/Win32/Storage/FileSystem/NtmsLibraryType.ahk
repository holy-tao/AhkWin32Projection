#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsLibraryType extends Win32Enum {

    /**
     * Native name: NTMS_LIBRARYTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static LIBRARYTYPE_UNKNOWN => 0

    /**
     * Native name: NTMS_LIBRARYTYPE_OFFLINE
     * @type {Integer (Int32)}
     */
    static LIBRARYTYPE_OFFLINE => 1

    /**
     * Native name: NTMS_LIBRARYTYPE_ONLINE
     * @type {Integer (Int32)}
     */
    static LIBRARYTYPE_ONLINE => 2

    /**
     * Native name: NTMS_LIBRARYTYPE_STANDALONE
     * @type {Integer (Int32)}
     */
    static LIBRARYTYPE_STANDALONE => 3
}
