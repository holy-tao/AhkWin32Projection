#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DVDFilterState{

    /**
     * @type {Integer (Int32)}
     */
    static dvdState_Undefined => -2

    /**
     * @type {Integer (Int32)}
     */
    static dvdState_Unitialized => -1

    /**
     * @type {Integer (Int32)}
     */
    static dvdState_Stopped => 0

    /**
     * @type {Integer (Int32)}
     */
    static dvdState_Paused => 1

    /**
     * @type {Integer (Int32)}
     */
    static dvdState_Running => 2
}
