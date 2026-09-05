#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class BlackScreenDiagnosticsCalloutParam extends Win32Enum {

    /**
     * Native name: BlackScreenDiagnosticsData
     * @type {Integer (Int32)}
     */
    static Data => 1

    /**
     * Native name: BlackScreenDisplayRecovery
     * @type {Integer (Int32)}
     */
    static DisplayRecovery => 2
}
