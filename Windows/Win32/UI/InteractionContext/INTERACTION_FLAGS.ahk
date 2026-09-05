#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of an interaction.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-interaction_flags
 * @namespace Windows.Win32.UI.InteractionContext
 */
class INTERACTION_FLAGS extends Win32BitflagEnum {

    /**
     * No flags set.
     * Native name: INTERACTION_FLAG_NONE
     * @type {Integer (UInt32)}
     */
    static FLAG_NONE => 0

    /**
     * The beginning of an interaction.
     * Native name: INTERACTION_FLAG_BEGIN
     * @type {Integer (UInt32)}
     */
    static FLAG_BEGIN => 1

    /**
     * The end of an interaction (including inertia).
     * Native name: INTERACTION_FLAG_END
     * @type {Integer (UInt32)}
     */
    static FLAG_END => 2

    /**
     * Interaction canceled. INTERACTION_FLAG_END also set on cancel.
     * Native name: INTERACTION_FLAG_CANCEL
     * @type {Integer (UInt32)}
     */
    static FLAG_CANCEL => 4

    /**
     * Inertia being processed.
     * Native name: INTERACTION_FLAG_INERTIA
     * @type {Integer (UInt32)}
     */
    static FLAG_INERTIA => 8

    /**
     * Maximum number of interactions exceeded.
     * Native name: INTERACTION_FLAG_MAX
     * @type {Integer (UInt32)}
     */
    static FLAG_MAX => 4294967295
}
