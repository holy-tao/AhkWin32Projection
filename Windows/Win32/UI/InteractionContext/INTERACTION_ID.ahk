#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the interaction states used for configuring an Interaction Context object.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-interaction_id
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct INTERACTION_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static INTERACTION_ID_NONE => 0

    /**
     * A compound gesture that supports translation, rotation, and scaling (dynamic).
     * @type {Integer (Int32)}
     */
    static INTERACTION_ID_MANIPULATION => 1

    /**
     * A tap gesture (static).
     * @type {Integer (Int32)}
     */
    static INTERACTION_ID_TAP => 2

    /**
     * A right click gesture (static), regardless of input device. Typically used for displaying a context menu.
     * 
     * <ul>
     * <li>Right mouse button click</li>
     * <li>Pen barrel button click</li>
     * <li>Touch or pen press and hold</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static INTERACTION_ID_SECONDARY_TAP => 3

    /**
     * Press and hold gesture (static).
     * @type {Integer (Int32)}
     */
    static INTERACTION_ID_HOLD => 4

    /**
     * Move with mouse or pen (dynamic).
     * @type {Integer (Int32)}
     */
    static INTERACTION_ID_DRAG => 5

    /**
     * Select or move through slide or swipe gestures (dynamic).
     * @type {Integer (Int32)}
     */
    static INTERACTION_ID_CROSS_SLIDE => 6

    /**
     * Maximum number of interactions exceeded.
     * @type {Integer (Int32)}
     */
    static INTERACTION_ID_MAX => -1
}
