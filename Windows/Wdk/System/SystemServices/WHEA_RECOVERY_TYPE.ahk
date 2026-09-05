#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_RECOVERY_TYPE extends Win32Enum {

    /**
     * Native name: WheaRecoveryTypeActionRequired
     * @type {Integer (Int32)}
     */
    static ActionRequired => 1

    /**
     * Native name: WheaRecoveryTypeActionOptional
     * @type {Integer (Int32)}
     */
    static ActionOptional => 2

    /**
     * Native name: WheaRecoveryTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
