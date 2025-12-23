#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsMediaPoolPolicy extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLPOLICY_PURGEOFFLINESCRATCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLPOLICY_KEEPOFFLINEIMPORT => 2
}
