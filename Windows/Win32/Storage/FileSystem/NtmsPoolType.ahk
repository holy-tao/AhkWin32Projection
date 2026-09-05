#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsPoolType extends Win32Enum {

    /**
     * Native name: NTMS_POOLTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static POOLTYPE_UNKNOWN => 0

    /**
     * Native name: NTMS_POOLTYPE_SCRATCH
     * @type {Integer (Int32)}
     */
    static POOLTYPE_SCRATCH => 1

    /**
     * Native name: NTMS_POOLTYPE_FOREIGN
     * @type {Integer (Int32)}
     */
    static POOLTYPE_FOREIGN => 2

    /**
     * Native name: NTMS_POOLTYPE_IMPORT
     * @type {Integer (Int32)}
     */
    static POOLTYPE_IMPORT => 3

    /**
     * Native name: NTMS_POOLTYPE_APPLICATION
     * @type {Integer (Int32)}
     */
    static POOLTYPE_APPLICATION => 1000
}
