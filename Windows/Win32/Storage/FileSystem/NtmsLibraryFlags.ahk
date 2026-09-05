#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsLibraryFlags extends Win32Enum {

    /**
     * Native name: NTMS_LIBRARYFLAG_FIXEDOFFLINE
     * @type {Integer (Int32)}
     */
    static LIBRARYFLAG_FIXEDOFFLINE => 1

    /**
     * Native name: NTMS_LIBRARYFLAG_CLEANERPRESENT
     * @type {Integer (Int32)}
     */
    static LIBRARYFLAG_CLEANERPRESENT => 2

    /**
     * Native name: NTMS_LIBRARYFLAG_AUTODETECTCHANGE
     * @type {Integer (Int32)}
     */
    static LIBRARYFLAG_AUTODETECTCHANGE => 4

    /**
     * Native name: NTMS_LIBRARYFLAG_IGNORECLEANERUSESREMAINING
     * @type {Integer (Int32)}
     */
    static LIBRARYFLAG_IGNORECLEANERUSESREMAINING => 8

    /**
     * Native name: NTMS_LIBRARYFLAG_RECOGNIZECLEANERBARCODE
     * @type {Integer (Int32)}
     */
    static LIBRARYFLAG_RECOGNIZECLEANERBARCODE => 16
}
