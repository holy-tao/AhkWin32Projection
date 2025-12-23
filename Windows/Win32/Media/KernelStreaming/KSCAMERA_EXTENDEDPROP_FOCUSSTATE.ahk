#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_EXTENDEDPROP_FOCUSSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_LOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_SEARCHING => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_FOCUSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_FOCUSSTATE_FAILED => 4
}
