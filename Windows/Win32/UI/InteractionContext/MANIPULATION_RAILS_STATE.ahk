#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the rail states for an interaction.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-manipulation_rails_state
 * @namespace Windows.Win32.UI.InteractionContext
 */
class MANIPULATION_RAILS_STATE extends Win32Enum {

    /**
     * Rail state not defined yet.
     * Native name: MANIPULATION_RAILS_STATE_UNDECIDED
     * @type {Integer (Int32)}
     */
    static UNDECIDED => 0

    /**
     * Interaction is not constrained to rail.
     * Native name: MANIPULATION_RAILS_STATE_FREE
     * @type {Integer (Int32)}
     */
    static FREE => 1

    /**
     * Interaction is constrained to rail.
     * Native name: MANIPULATION_RAILS_STATE_RAILED
     * @type {Integer (Int32)}
     */
    static RAILED => 2

    /**
     * Maximum number of interactions exceeded.
     * Native name: MANIPULATION_RAILS_STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}
