#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_EXTENDEDPROP_FOCUSSTATE extends Win32Enum {

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_FOCUSSTATE_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static UNINITIALIZED => 0

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_FOCUSSTATE_LOST
     * @type {Integer (Int32)}
     */
    static LOST => 1

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_FOCUSSTATE_SEARCHING
     * @type {Integer (Int32)}
     */
    static SEARCHING => 2

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_FOCUSSTATE_FOCUSED
     * @type {Integer (Int32)}
     */
    static FOCUSED => 3

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_FOCUSSTATE_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 4
}
