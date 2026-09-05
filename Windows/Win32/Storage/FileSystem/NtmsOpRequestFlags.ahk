#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsOpRequestFlags extends Win32Enum {

    /**
     * Native name: NTMS_OPREQFLAGS_NOAUTOPURGE
     * @type {Integer (Int32)}
     */
    static OPREQFLAGS_NOAUTOPURGE => 1

    /**
     * Native name: NTMS_OPREQFLAGS_NOFAILEDPURGE
     * @type {Integer (Int32)}
     */
    static OPREQFLAGS_NOFAILEDPURGE => 2

    /**
     * Native name: NTMS_OPREQFLAGS_NOALERTS
     * @type {Integer (Int32)}
     */
    static OPREQFLAGS_NOALERTS => 16

    /**
     * Native name: NTMS_OPREQFLAGS_NOTRAYICON
     * @type {Integer (Int32)}
     */
    static OPREQFLAGS_NOTRAYICON => 32
}
