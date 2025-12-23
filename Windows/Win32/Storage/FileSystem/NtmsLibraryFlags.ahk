#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsLibraryFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYFLAG_FIXEDOFFLINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYFLAG_CLEANERPRESENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYFLAG_AUTODETECTCHANGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYFLAG_IGNORECLEANERUSESREMAINING => 8

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYFLAG_RECOGNIZECLEANERBARCODE => 16
}
