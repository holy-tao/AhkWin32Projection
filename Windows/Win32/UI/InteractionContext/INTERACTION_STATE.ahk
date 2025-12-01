#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of the Interaction Context object.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-interaction_state
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INTERACTION_STATE extends Win32Enum{

    /**
     * There are no ongoing interactions and all transitional states (inertia, double tap) are complete. It is safe to reuse the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @type {Integer (Int32)}
     */
    static INTERACTION_STATE_IDLE => 0

    /**
     * There is an ongoing interaction. One or more contacts are detected, or inertia is in progress.
     * @type {Integer (Int32)}
     */
    static INTERACTION_STATE_IN_INTERACTION => 1

    /**
     * All contacts are lifted, but the time threshold for double tap has not been crossed.
     * @type {Integer (Int32)}
     */
    static INTERACTION_STATE_POSSIBLE_DOUBLE_TAP => 2

    /**
     * Maximum number of interactions exceeded.
     * @type {Integer (Int32)}
     */
    static INTERACTION_STATE_MAX => -1
}
