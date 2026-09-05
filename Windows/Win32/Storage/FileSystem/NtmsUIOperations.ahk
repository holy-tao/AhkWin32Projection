#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsUIOperations extends Win32Enum {

    /**
     * Native name: NTMS_UIDEST_ADD
     * @type {Integer (Int32)}
     */
    static UIDEST_ADD => 1

    /**
     * Native name: NTMS_UIDEST_DELETE
     * @type {Integer (Int32)}
     */
    static UIDEST_DELETE => 2

    /**
     * Native name: NTMS_UIDEST_DELETEALL
     * @type {Integer (Int32)}
     */
    static UIDEST_DELETEALL => 3

    /**
     * Native name: NTMS_UIOPERATION_MAX
     * @type {Integer (Int32)}
     */
    static UIOPERATION_MAX => 4
}
