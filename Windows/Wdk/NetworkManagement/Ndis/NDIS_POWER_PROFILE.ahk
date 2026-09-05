#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_POWER_PROFILE extends Win32Enum {

    /**
     * Native name: NdisPowerProfileBattery
     * @type {Integer (Int32)}
     */
    static Battery => 0

    /**
     * Native name: NdisPowerProfileAcOnLine
     * @type {Integer (Int32)}
     */
    static AcOnLine => 1
}
