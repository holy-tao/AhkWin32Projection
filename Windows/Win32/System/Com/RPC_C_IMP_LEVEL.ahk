#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class RPC_C_IMP_LEVEL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_IMP_LEVEL_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_IMP_LEVEL_ANONYMOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_IMP_LEVEL_IDENTIFY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_IMP_LEVEL_IMPERSONATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_IMP_LEVEL_DELEGATE => 4
}
