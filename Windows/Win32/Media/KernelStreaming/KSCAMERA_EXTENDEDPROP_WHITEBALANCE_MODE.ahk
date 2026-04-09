#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_EXTENDEDPROP_WHITEBALANCE_MODE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_WHITEBALANCE_TEMPERATURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_WHITEBALANCE_PRESET => 2
}
