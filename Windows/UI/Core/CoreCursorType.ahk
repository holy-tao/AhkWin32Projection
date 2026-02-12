#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the set of cursor types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecursortype
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreCursorType extends Win32Enum{

    /**
     * ![arrow cursor](./images/cursors/arrow-cursor.png)
     * 
     * The left-upward (northwest) arrow Windows cursor.
     * @type {Integer (Int32)}
     */
    static Arrow => 0

    /**
     * ![cross cursor](./images/cursors/cross-cursor.png)
     * 
     * The "cross" Windows cursor.
     * @type {Integer (Int32)}
     */
    static Cross => 1

    /**
     * A custom cursor.
     * @type {Integer (Int32)}
     */
    static Custom => 2

    /**
     * ![hand cursor](./images/cursors/hand-cursor.png)
     * 
     * The "hand" Windows cursor.
     * @type {Integer (Int32)}
     */
    static Hand => 3

    /**
     * ![help cursor](./images/cursors/help-cursor.png)
     * 
     * The left-upward (northwest) arrow Windows cursor with a question mark.
     * @type {Integer (Int32)}
     */
    static Help => 4

    /**
     * ![I-beam cursor](./images/cursors/ibeam-cursor.png)
     * 
     * The "I"-shaped Windows cursor used for text selection.
     * @type {Integer (Int32)}
     */
    static IBeam => 5

    /**
     * ![size all cursor](./images/cursors/sizeall-cursor.png)
     * 
     * The "cross arrow" Windows cursor used for user interface (UI) element sizing.
     * @type {Integer (Int32)}
     */
    static SizeAll => 6

    /**
     * ![resize north-east to south-west cursor](./images/cursors/size-nesw-cursor.png)
     * 
     * The "right-upward, left-downward" dual arrow Windows cursor often used for element sizing.
     * @type {Integer (Int32)}
     */
    static SizeNortheastSouthwest => 7

    /**
     * ![resize north to south cursor](./images/cursors/size-ns-cursor.png)
     * 
     * The up-down dual arrow Windows cursor often used for vertical (height) sizing.
     * @type {Integer (Int32)}
     */
    static SizeNorthSouth => 8

    /**
     * ![resize north-west to south-east cursor](./images/cursors/size-nwse-cursor.png)
     * 
     * The "left-upward, right-downward" dual arrow Windows cursor often used for element sizing.
     * @type {Integer (Int32)}
     */
    static SizeNorthwestSoutheast => 9

    /**
     * ![resize west to east cursor](./images/cursors/size-we-cursor.png)
     * 
     * The left-right dual arrow Windows cursor often used for horizontal (width) sizing.
     * @type {Integer (Int32)}
     */
    static SizeWestEast => 10

    /**
     * ![universal no cursor](./images/cursors/uni-no-cursor.png)
     * 
     * The red "circle slash" Windows cursor often used to indicate that a UI behavor cannot be performed.
     * @type {Integer (Int32)}
     */
    static UniversalNo => 11

    /**
     * ![up arrow cursor](./images/cursors/up-arrow-cursor.png)
     * 
     * The up arrow Windows cursor.
     * @type {Integer (Int32)}
     */
    static UpArrow => 12

    /**
     * ![cycling wait cursor depcited as stationary](./images/cursors/wait-cursor.png)
     * 
     * The cycling Windows "wait" cursor often used to indicate that an element or behavior is in a wait state and cannot respond at the time.
     * @type {Integer (Int32)}
     */
    static Wait => 13

    /**
     * ![hand with pin cursor](./images/cursors/pin-cursor.png)
     * 
     * The "hand" Windows cursor with a pin symbol.
     * @type {Integer (Int32)}
     */
    static Pin => 14

    /**
     * ![hand with person cursor](./images/cursors/person-cursor.png)
     * 
     * The "hand" Windows cursor with a person symbol.
     * @type {Integer (Int32)}
     */
    static Person => 15
}
