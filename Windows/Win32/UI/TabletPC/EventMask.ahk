#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The events on the ITextInputPanel Interface that you can set attention for.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-eventmask
 * @namespace Windows.Win32.UI.TabletPC
 */
class EventMask extends Win32Enum {

    /**
     * Occurs when the correction mode is about to change.
     * Native name: EventMask_InPlaceStateChanging
     * @type {Integer (Int32)}
     */
    static InPlaceStateChanging => 1

    /**
     * Occurs when the correction mode has changed.
     * Native name: EventMask_InPlaceStateChanged
     * @type {Integer (Int32)}
     */
    static InPlaceStateChanged => 2

    /**
     * Occurs when the in-place Input Panel size is about to change due to user resizing, auto growth or an input area change.
     * Native name: EventMask_InPlaceSizeChanging
     * @type {Integer (Int32)}
     */
    static InPlaceSizeChanging => 4

    /**
     * Occurs when the in-place Input Panel size has changed due to a user resize, auto growth, or an input area change.
     * Native name: EventMask_InPlaceSizeChanged
     * @type {Integer (Int32)}
     */
    static InPlaceSizeChanged => 8

    /**
     * Occurs when the input area is about to change.
     * Native name: EventMask_InputAreaChanging
     * @type {Integer (Int32)}
     */
    static InputAreaChanging => 16

    /**
     * Occurs when the input area has changed.
     * Native name: EventMask_InputAreaChanged
     * @type {Integer (Int32)}
     */
    static InputAreaChanged => 32

    /**
     * Occurs when the correction mode is about to change.
     * Native name: EventMask_CorrectionModeChanging
     * @type {Integer (Int32)}
     */
    static CorrectionModeChanging => 64

    /**
     * Occurs when the correction mode has changed.
     * Native name: EventMask_CorrectionModeChanged
     * @type {Integer (Int32)}
     */
    static CorrectionModeChanged => 128

    /**
     * Occurs when the in-place Input Panel visibility is about to change.
     * Native name: EventMask_InPlaceVisibilityChanging
     * @type {Integer (Int32)}
     */
    static InPlaceVisibilityChanging => 256

    /**
     * Occurs when the input area has changed.
     * Native name: EventMask_InPlaceVisibilityChanged
     * @type {Integer (Int32)}
     */
    static InPlaceVisibilityChanged => 512

    /**
     * Occurs when Tablet PC Input Panel is about to insert text into the control with input focus.
     * Native name: EventMask_TextInserting
     * @type {Integer (Int32)}
     */
    static TextInserting => 1024

    /**
     * Occurs when the Tablet PC Input Panel has inserted text into the control with input focus.
     * Native name: EventMask_TextInserted
     * @type {Integer (Int32)}
     */
    static TextInserted => 2048

    /**
     * Represents a bitwise combination of all member events.
     * Native name: EventMask_All
     * @type {Integer (Int32)}
     */
    static All => 4095
}
