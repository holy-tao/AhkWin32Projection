#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the rail states for an interaction.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-manipulation_rails_state
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct MANIPULATION_RAILS_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
