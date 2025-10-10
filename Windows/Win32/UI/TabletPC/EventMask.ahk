#Requires AutoHotkey v2.0.0 64-bit

/**
 * The events on the ITextInputPanel Interface that you can set attention for.
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/ne-peninputpanel-eventmask
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class EventMask{

    /**
     * Occurs when the correction mode is about to change.
     * @type {Integer (Int32)}
     */
    static EventMask_InPlaceStateChanging => 1

    /**
     * Occurs when the correction mode has changed.
     * @type {Integer (Int32)}
     */
    static EventMask_InPlaceStateChanged => 2

    /**
     * Occurs when the in-place Input Panel size is about to change due to user resizing, auto growth or an input area change.
     * @type {Integer (Int32)}
     */
    static EventMask_InPlaceSizeChanging => 4

    /**
     * Occurs when the in-place Input Panel size has changed due to a user resize, auto growth, or an input area change.
     * @type {Integer (Int32)}
     */
    static EventMask_InPlaceSizeChanged => 8

    /**
     * Occurs when the input area is about to change.
     * @type {Integer (Int32)}
     */
    static EventMask_InputAreaChanging => 16

    /**
     * Occurs when the input area has changed.
     * @type {Integer (Int32)}
     */
    static EventMask_InputAreaChanged => 32

    /**
     * Occurs when the correction mode is about to change.
     * @type {Integer (Int32)}
     */
    static EventMask_CorrectionModeChanging => 64

    /**
     * Occurs when the correction mode has changed.
     * @type {Integer (Int32)}
     */
    static EventMask_CorrectionModeChanged => 128

    /**
     * Occurs when the in-place Input Panel visibility is about to change.
     * @type {Integer (Int32)}
     */
    static EventMask_InPlaceVisibilityChanging => 256

    /**
     * Occurs when the input area has changed.
     * @type {Integer (Int32)}
     */
    static EventMask_InPlaceVisibilityChanged => 512

    /**
     * Occurs when Tablet PC Input Panel is about to insert text into the control with input focus.
     * @type {Integer (Int32)}
     */
    static EventMask_TextInserting => 1024

    /**
     * Occurs when the Tablet PC Input Panel has inserted text into the control with input focus.
     * @type {Integer (Int32)}
     */
    static EventMask_TextInserted => 2048

    /**
     * Represents a bitwise combination of all member events.
     * @type {Integer (Int32)}
     */
    static EventMask_All => 4095
}
