#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of an interaction.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-interaction_flags
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INTERACTION_FLAGS extends Win32BitflagEnum{

    /**
     * No flags set.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_FLAG_NONE => 0

    /**
     * The beginning of an interaction.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_FLAG_BEGIN => 1

    /**
     * The end of an interaction (including inertia).
     * @type {Integer (UInt32)}
     */
    static INTERACTION_FLAG_END => 2

    /**
     * Interaction canceled. INTERACTION_FLAG_END also set on cancel.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_FLAG_CANCEL => 4

    /**
     * Inertia being processed.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_FLAG_INERTIA => 8

    /**
     * Maximum number of interactions exceeded.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_FLAG_MAX => 4294967295
}
