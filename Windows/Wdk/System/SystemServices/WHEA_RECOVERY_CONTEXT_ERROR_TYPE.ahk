#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_RECOVERY_CONTEXT_ERROR_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryContextErrorTypeMemory => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryContextErrorTypePmem => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryContextErrorTypeMax => 3
}
