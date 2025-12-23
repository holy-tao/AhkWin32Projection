#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsPoolType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLTYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLTYPE_SCRATCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLTYPE_FOREIGN => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLTYPE_IMPORT => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLTYPE_APPLICATION => 1000
}
