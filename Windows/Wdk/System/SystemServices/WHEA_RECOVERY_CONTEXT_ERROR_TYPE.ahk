#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_RECOVERY_CONTEXT_ERROR_TYPE extends Win32Enum {

    /**
     * Native name: WheaRecoveryContextErrorTypeMemory
     * @type {Integer (Int32)}
     */
    static Memory => 1

    /**
     * Native name: WheaRecoveryContextErrorTypePmem
     * @type {Integer (Int32)}
     */
    static Pmem => 2

    /**
     * Native name: WheaRecoveryContextErrorTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
