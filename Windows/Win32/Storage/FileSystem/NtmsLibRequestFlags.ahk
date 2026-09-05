#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsLibRequestFlags extends Win32Enum {

    /**
     * Native name: NTMS_LIBREQFLAGS_NOAUTOPURGE
     * @type {Integer (Int32)}
     */
    static LIBREQFLAGS_NOAUTOPURGE => 1

    /**
     * Native name: NTMS_LIBREQFLAGS_NOFAILEDPURGE
     * @type {Integer (Int32)}
     */
    static LIBREQFLAGS_NOFAILEDPURGE => 2
}
