#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the directions in which a pen flick has occurred.
 * @remarks
 * A pen flick is a unidirectional pen gesture that requires the user to contact the digitizer in a quick, straight flicking motion. A flick is characterized by high speed and a high degree of straightness. A flick is identified by its direction. Flicks can be made in eight directions corresponding to the cardinal and secondary compass directions.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ne-tabflicks-flickdirection
 * @namespace Windows.Win32.UI.TabletPC
 */
class FLICKDIRECTION extends Win32Enum {

    /**
     * Native name: FLICKDIRECTION_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 0

    /**
     * A pen flick to the right.
     * Native name: FLICKDIRECTION_RIGHT
     * @type {Integer (Int32)}
     */
    static RIGHT => 0

    /**
     * A pen flick to the upper right.
     * Native name: FLICKDIRECTION_UPRIGHT
     * @type {Integer (Int32)}
     */
    static UPRIGHT => 1

    /**
     * An upward pen flick.
     * Native name: FLICKDIRECTION_UP
     * @type {Integer (Int32)}
     */
    static UP => 2

    /**
     * A pen flick to the upper left.
     * Native name: FLICKDIRECTION_UPLEFT
     * @type {Integer (Int32)}
     */
    static UPLEFT => 3

    /**
     * A pen flick to the left.
     * Native name: FLICKDIRECTION_LEFT
     * @type {Integer (Int32)}
     */
    static LEFT => 4

    /**
     * A pen flick to the lower left.
     * Native name: FLICKDIRECTION_DOWNLEFT
     * @type {Integer (Int32)}
     */
    static DOWNLEFT => 5

    /**
     * A downward pen flick.
     * Native name: FLICKDIRECTION_DOWN
     * @type {Integer (Int32)}
     */
    static DOWN => 6

    /**
     * A pen flick to the down right.
     * Native name: FLICKDIRECTION_DOWNRIGHT
     * @type {Integer (Int32)}
     */
    static DOWNRIGHT => 7

    /**
     * An invalid pen flick.
     * Native name: FLICKDIRECTION_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 8
}
