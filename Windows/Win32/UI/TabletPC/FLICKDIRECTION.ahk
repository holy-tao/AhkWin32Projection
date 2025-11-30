#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the directions in which a pen flick has occurred.
 * @remarks
 * 
 * A pen flick is a unidirectional pen gesture that requires the user to contact the digitizer in a quick, straight flicking motion. A flick is characterized by high speed and a high degree of straightness. A flick is identified by its direction. Flicks can be made in eight directions corresponding to the cardinal and secondary compass directions.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tabflicks/ne-tabflicks-flickdirection
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class FLICKDIRECTION extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_MIN => 0

    /**
     * A pen flick to the right.
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_RIGHT => 0

    /**
     * A pen flick to the upper right.
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_UPRIGHT => 1

    /**
     * An upward pen flick.
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_UP => 2

    /**
     * A pen flick to the upper left.
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_UPLEFT => 3

    /**
     * A pen flick to the left.
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_LEFT => 4

    /**
     * A pen flick to the lower left.
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_DOWNLEFT => 5

    /**
     * A downward pen flick.
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_DOWN => 6

    /**
     * A pen flick to the down right.
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_DOWNRIGHT => 7

    /**
     * An invalid pen flick.
     * @type {Integer (Int32)}
     */
    static FLICKDIRECTION_INVALID => 8
}
