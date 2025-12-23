#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the rail states for an interaction.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-manipulation_rails_state
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class MANIPULATION_RAILS_STATE extends Win32Enum{

    /**
     * Rail state not defined yet.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_RAILS_STATE_UNDECIDED => 0

    /**
     * Interaction is not constrained to rail.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_RAILS_STATE_FREE => 1

    /**
     * Interaction is constrained to rail.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_RAILS_STATE_RAILED => 2

    /**
     * Maximum number of interactions exceeded.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_RAILS_STATE_MAX => -1
}
