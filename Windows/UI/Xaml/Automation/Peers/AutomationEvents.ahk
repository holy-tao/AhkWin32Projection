#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the event that is raised by the element through the associated [AutomationPeer](automationpeer.md). Used by [RaiseAutomationEvent](automationpeer_raiseautomationevent_2027563412.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationevents
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationEvents extends Win32Enum{

    /**
     * The event that is raised when a tooltip is opened.
     * @type {Integer (Int32)}
     */
    static ToolTipOpened => 0

    /**
     * The event that is raised when a tooltip is closed.
     * @type {Integer (Int32)}
     */
    static ToolTipClosed => 1

    /**
     * The event that is raised when a menu is opened.
     * @type {Integer (Int32)}
     */
    static MenuOpened => 2

    /**
     * The event that is raised when a menu is closed.
     * @type {Integer (Int32)}
     */
    static MenuClosed => 3

    /**
     * The event that is raised when the focus has changed. See [SetFocus](automationpeer_setfocus_192955311.md).
     * @type {Integer (Int32)}
     */
    static AutomationFocusChanged => 4

    /**
     * The event that is raised when a control is activated. See [Invoke](buttonautomationpeer_invoke_1893356988.md).
     * @type {Integer (Int32)}
     */
    static InvokePatternOnInvoked => 5

    /**
     * The event that is raised when an item is added to a collection of selected items. See [AddToSelection](radiobuttonautomationpeer_addtoselection_1271464825.md).
     * @type {Integer (Int32)}
     */
    static SelectionItemPatternOnElementAddedToSelection => 6

    /**
     * The event that is raised when an item is removed from a collection of selected items. See [RemoveFromSelection](radiobuttonautomationpeer_removefromselection_1451724986.md).
     * @type {Integer (Int32)}
     */
    static SelectionItemPatternOnElementRemovedFromSelection => 7

    /**
     * The event that is raised when a single item is selected (which clears any previous selection). See [Select](radiobuttonautomationpeer_select_431777312.md).
     * @type {Integer (Int32)}
     */
    static SelectionItemPatternOnElementSelected => 8

    /**
     * The event that is raised when a selection in a container has changed significantly.
     * @type {Integer (Int32)}
     */
    static SelectionPatternOnInvalidated => 9

    /**
     * The event that is raised when the text selection is modified.
     * @type {Integer (Int32)}
     */
    static TextPatternOnTextSelectionChanged => 10

    /**
     * The event that is raised when textual content is modified.
     * @type {Integer (Int32)}
     */
    static TextPatternOnTextChanged => 11

    /**
     * The event that is raised when content is loaded asynchronously.
     * @type {Integer (Int32)}
     */
    static AsyncContentLoaded => 12

    /**
     * The event that is raised when a property has changed.
     * @type {Integer (Int32)}
     */
    static PropertyChanged => 13

    /**
     * The event that is raised when the UI Automation tree structure is changed.
     * @type {Integer (Int32)}
     */
    static StructureChanged => 14

    /**
     * The event that is raised when a drag operation originates from a peer.
     * @type {Integer (Int32)}
     */
    static DragStart => 15

    /**
     * The event that is raised when a drag operation is canceled from a peer.
     * @type {Integer (Int32)}
     */
    static DragCancel => 16

    /**
     * The event that is raised when a drag operation finishes from a peer.
     * @type {Integer (Int32)}
     */
    static DragComplete => 17

    /**
     * The event that is raised when a drag operation targets a peer.
     * @type {Integer (Int32)}
     */
    static DragEnter => 18

    /**
     * The event that is raised when a drag operation switches targets away from a peer.
     * @type {Integer (Int32)}
     */
    static DragLeave => 19

    /**
     * The event that is raised when a drag operation drops on a peer.
     * @type {Integer (Int32)}
     */
    static Dropped => 20

    /**
     * The event that is raised as notification when a live region refreshes its content without having focus.
     * @type {Integer (Int32)}
     */
    static LiveRegionChanged => 21

    /**
     * The event that is raised when user input has reached its target.
     * @type {Integer (Int32)}
     */
    static InputReachedTarget => 22

    /**
     * The event that is raised when user input has reached the other element.
     * @type {Integer (Int32)}
     */
    static InputReachedOtherElement => 23

    /**
     * The event that is raised when user input has been discarded.
     * @type {Integer (Int32)}
     */
    static InputDiscarded => 24

    /**
     * The event that is raised when a window is closed.
     * @type {Integer (Int32)}
     */
    static WindowClosed => 25

    /**
     * The event that is raised when a window is opened.
     * @type {Integer (Int32)}
     */
    static WindowOpened => 26

    /**
     * The event that is raised when the conversion target has changed.
     * @type {Integer (Int32)}
     */
    static ConversionTargetChanged => 27

    /**
     * The event that is raised when the text was changed in an edit control.
     * @type {Integer (Int32)}
     */
    static TextEditTextChanged => 28

    /**
     * The event that is raised when the window layout has become invalidated. This event is also used for [Auto-suggest accessibility](/windows/uwp/accessibility/accessible-text-requirements#auto-suggest_accessibility).
     * @type {Integer (Int32)}
     */
    static LayoutInvalidated => 29
}
