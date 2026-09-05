#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_EXTENDEDPROP_ROITYPE extends Win32Enum {

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_ROITYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_ROITYPE_FACE
     * @type {Integer (Int32)}
     */
    static FACE => 1
}
