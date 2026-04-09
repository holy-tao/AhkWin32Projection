#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class BlackScreenDiagnosticsCalloutParam extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static BlackScreenDiagnosticsData => 1

    /**
     * @type {Integer (Int32)}
     */
    static BlackScreenDisplayRecovery => 2
}
