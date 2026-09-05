#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSDEVICE_THERMAL_STATE extends Win32Enum {

    /**
     * Native name: KSDEVICE_THERMAL_STATE_LOW
     * @type {Integer (Int32)}
     */
    static LOW => 0

    /**
     * Native name: KSDEVICE_THERMAL_STATE_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 1
}
