#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_EXTENDEDPROP_WHITEBALANCE_MODE extends Win32Enum {

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_WHITEBALANCE_TEMPERATURE
     * @type {Integer (Int32)}
     */
    static TEMPERATURE => 1

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_WHITEBALANCE_PRESET
     * @type {Integer (Int32)}
     */
    static PRESET => 2
}
