#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class RPC_C_IMP_LEVEL extends Win32Enum {

    /**
     * Native name: RPC_C_IMP_LEVEL_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DEFAULT => 0

    /**
     * Native name: RPC_C_IMP_LEVEL_ANONYMOUS
     * @type {Integer (UInt32)}
     */
    static ANONYMOUS => 1

    /**
     * Native name: RPC_C_IMP_LEVEL_IDENTIFY
     * @type {Integer (UInt32)}
     */
    static IDENTIFY => 2

    /**
     * Native name: RPC_C_IMP_LEVEL_IMPERSONATE
     * @type {Integer (UInt32)}
     */
    static IMPERSONATE => 3

    /**
     * Native name: RPC_C_IMP_LEVEL_DELEGATE
     * @type {Integer (UInt32)}
     */
    static DELEGATE => 4
}
