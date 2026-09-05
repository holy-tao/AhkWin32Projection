#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PO_THERMAL_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: PoThermalRequestPassive
     * @type {Integer (Int32)}
     */
    static Passive => 0

    /**
     * Native name: PoThermalRequestActive
     * @type {Integer (Int32)}
     */
    static Active => 1
}
