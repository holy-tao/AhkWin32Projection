#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMPlayListEventFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLISTEVENT_RESUME => 0

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLISTEVENT_BREAK => 1

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLISTEVENT_NEXT => 2

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLISTEVENT_MASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLISTEVENT_REFRESH => 16
}
