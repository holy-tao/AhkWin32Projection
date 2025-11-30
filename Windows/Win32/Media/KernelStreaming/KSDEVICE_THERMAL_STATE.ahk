#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDEVICE_THERMAL_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSDEVICE_THERMAL_STATE_LOW => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSDEVICE_THERMAL_STATE_HIGH => 1
}
