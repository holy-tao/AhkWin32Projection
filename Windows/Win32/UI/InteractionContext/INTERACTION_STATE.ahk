#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of the Interaction Context object.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-interaction_state
 * @namespace Windows.Win32.UI.InteractionContext
 */
class INTERACTION_STATE extends Win32Enum {

    /**
     * There are no ongoing interactions and all transitional states (inertia, double tap) are complete. It is safe to reuse the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * Native name: INTERACTION_STATE_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 0

    /**
     * There is an ongoing interaction. One or more contacts are detected, or inertia is in progress.
     * Native name: INTERACTION_STATE_IN_INTERACTION
     * @type {Integer (Int32)}
     */
    static IN_INTERACTION => 1

    /**
     * All contacts are lifted, but the time threshold for double tap has not been crossed.
     * Native name: INTERACTION_STATE_POSSIBLE_DOUBLE_TAP
     * @type {Integer (Int32)}
     */
    static POSSIBLE_DOUBLE_TAP => 2

    /**
     * Maximum number of interactions exceeded.
     * Native name: INTERACTION_STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}
