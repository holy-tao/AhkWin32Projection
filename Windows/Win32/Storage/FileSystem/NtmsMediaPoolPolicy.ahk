#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsMediaPoolPolicy extends Win32Enum {

    /**
     * Native name: NTMS_POOLPOLICY_PURGEOFFLINESCRATCH
     * @type {Integer (Int32)}
     */
    static POOLPOLICY_PURGEOFFLINESCRATCH => 1

    /**
     * Native name: NTMS_POOLPOLICY_KEEPOFFLINEIMPORT
     * @type {Integer (Int32)}
     */
    static POOLPOLICY_KEEPOFFLINEIMPORT => 2
}
