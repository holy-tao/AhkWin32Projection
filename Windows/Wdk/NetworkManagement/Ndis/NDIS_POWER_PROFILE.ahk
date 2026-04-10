#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_POWER_PROFILE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NdisPowerProfileBattery => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisPowerProfileAcOnLine => 1
}
