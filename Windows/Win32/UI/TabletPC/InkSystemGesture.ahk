#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the interest in a set of operating system-specific gestures.
 * @remarks
 * 
 * The flick gesture is recognized in Windows Vista and later versions of Windows.
 * 
 * The Windows Vista and Tablet PC operating systems support these gestures by default. When any of these gestures are recognized, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-systemgesture">SystemGesture</a> event fires automatically. Many of these gestures map to traditional mouse events. For instance, the Tap system gesture mimics a click of the left mouse button.
 * 
 * A system gesture is separate from an application gesture. Application gestures are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkapplicationgesture">InkApplicationGesture</a> enumeration type.
 * 
 * For more information about system gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-gestures">Using Gestures</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inksystemgesture
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkSystemGesture{

    /**
     * A click of the left mouse button. This can be used to choose a command from the menu or toolbar, take action if a command is chosen, set an insertion point (IP), or show selection feedback.
     * @type {Integer (Int32)}
     */
    static ISG_Tap => 16

    /**
     * A double-click of the left mouse button. This can be used to select a word or open a file or folder.
     * @type {Integer (Int32)}
     */
    static ISG_DoubleTap => 17

    /**
     * A click of the right mouse button. This can be used to show a shortcut menu.
     * @type {Integer (Int32)}
     */
    static ISG_RightTap => 18

    /**
     * A drag of the mouse while pressing the left mouse button. This can be used to drag-select (such as in Microsoft Word when starting with an IP), select multiple words, drag (such as when dragging an object in Microsoft Windows), or scroll.
     * @type {Integer (Int32)}
     */
    static ISG_Drag => 19

    /**
     * A press and hold followed by a stroke, which maps to a right drag of a mouse. This can be used to drag (such as when dragging an object or selection followed by a shortcut menu).
     * @type {Integer (Int32)}
     */
    static ISG_RightDrag => 20

    /**
     * A press and hold of the left mouse button that lasts for a long time, which has no mouse equivalent. This is a fallback for when a user continues a press-and-hold action for a long time and the event reverts to a Tap.
     * @type {Integer (Int32)}
     */
    static ISG_HoldEnter => 21

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ISG_HoldLeave => 22

    /**
     * A pause of the mouse on an object. This can be used to show a ToolTip, roll-over effects, or other mouse pausing behaviors.
     * @type {Integer (Int32)}
     */
    static ISG_HoverEnter => 23

    /**
     * A mouse leaving a pause. This can be used to end ToolTip roll-over effects or other mouse pausing behaviors.
     * @type {Integer (Int32)}
     */
    static ISG_HoverLeave => 24

    /**
     * A flick gesture.
     * @type {Integer (Int32)}
     */
    static ISG_Flick => 31
}
