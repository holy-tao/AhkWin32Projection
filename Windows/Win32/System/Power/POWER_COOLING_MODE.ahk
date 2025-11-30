#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_COOLING_MODE extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static PO_TZ_ACTIVE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static PO_TZ_PASSIVE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PO_TZ_INVALID_MODE => 2
}
