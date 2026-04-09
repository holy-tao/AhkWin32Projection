#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_RECOVERY_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryTypeActionRequired => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryTypeActionOptional => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaRecoveryTypeMax => 3
}
