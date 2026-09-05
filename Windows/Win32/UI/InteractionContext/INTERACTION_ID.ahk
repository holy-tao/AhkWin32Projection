#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the interaction states used for configuring an Interaction Context object.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-interaction_id
 * @namespace Windows.Win32.UI.InteractionContext
 */
class INTERACTION_ID extends Win32Enum {

    /**
     * Not used.
     * Native name: INTERACTION_ID_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * A compound gesture that supports translation, rotation, and scaling (dynamic).
     * Native name: INTERACTION_ID_MANIPULATION
     * @type {Integer (Int32)}
     */
    static MANIPULATION => 1

    /**
     * A tap gesture (static).
     * Native name: INTERACTION_ID_TAP
     * @type {Integer (Int32)}
     */
    static TAP => 2

    /**
     * A right click gesture (static), regardless of input device. Typically used for displaying a context menu.
     * 
     * <ul>
     * <li>Right mouse button click</li>
     * <li>Pen barrel button click</li>
     * <li>Touch or pen press and hold</li>
     * </ul>
     * Native name: INTERACTION_ID_SECONDARY_TAP
     * @type {Integer (Int32)}
     */
    static SECONDARY_TAP => 3

    /**
     * Press and hold gesture (static).
     * Native name: INTERACTION_ID_HOLD
     * @type {Integer (Int32)}
     */
    static HOLD => 4

    /**
     * Move with mouse or pen (dynamic).
     * Native name: INTERACTION_ID_DRAG
     * @type {Integer (Int32)}
     */
    static DRAG => 5

    /**
     * Select or move through slide or swipe gestures (dynamic).
     * Native name: INTERACTION_ID_CROSS_SLIDE
     * @type {Integer (Int32)}
     */
    static CROSS_SLIDE => 6

    /**
     * Maximum number of interactions exceeded.
     * Native name: INTERACTION_ID_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}
