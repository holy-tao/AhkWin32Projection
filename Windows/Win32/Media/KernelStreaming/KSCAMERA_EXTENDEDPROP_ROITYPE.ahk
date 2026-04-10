#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_EXTENDEDPROP_ROITYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_ROITYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_ROITYPE_FACE => 1
}
