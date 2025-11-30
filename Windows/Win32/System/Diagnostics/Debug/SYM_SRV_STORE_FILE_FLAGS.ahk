#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class SYM_SRV_STORE_FILE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_COMPRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_OVERWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_PASS_IF_EXISTS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_POINTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_RETURNINDEX => 4
}
