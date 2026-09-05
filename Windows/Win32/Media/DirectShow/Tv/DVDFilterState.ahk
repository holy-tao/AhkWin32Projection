#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class DVDFilterState extends Win32Enum {

    /**
     * Native name: dvdState_Undefined
     * @type {Integer (Int32)}
     */
    static Undefined => -2

    /**
     * Native name: dvdState_Unitialized
     * @type {Integer (Int32)}
     */
    static Unitialized => -1

    /**
     * Native name: dvdState_Stopped
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * Native name: dvdState_Paused
     * @type {Integer (Int32)}
     */
    static Paused => 1

    /**
     * Native name: dvdState_Running
     * @type {Integer (Int32)}
     */
    static Running => 2
}
