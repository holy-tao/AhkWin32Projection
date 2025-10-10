#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that specify the state of a cursor button.
 * @remarks
 * 
  * The CursorButton state for the mouse is always <b>CursorUnavailable</b> when the mouse buttons are up.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkcursorbuttonstate
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkCursorButtonState{

    /**
     * The cursor button is unavailable. A cursor button may become unavailable, for example, when a cursor leaves the range of Tablet PC.
     * @type {Integer (Int32)}
     */
    static ICBS_Unavailable => 0

    /**
     * The cursor button is up. A button on a pen tip is up when the pen is not pressed against the digitizer. A button on a pen barrel is up when the button is not depressed.
     * @type {Integer (Int32)}
     */
    static ICBS_Up => 1

    /**
     * The cursor button is down. A button on a pen tip is down when the user lowers the pen to the digitizer and draws a stroke. For a button on a barrel, the button is down when the button is depressed.
     * @type {Integer (Int32)}
     */
    static ICBS_Down => 2
}
