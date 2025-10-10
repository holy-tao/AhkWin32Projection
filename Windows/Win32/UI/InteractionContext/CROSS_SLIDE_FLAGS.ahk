#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the state of the cross-slide interaction.
 * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/ne-interactioncontext-cross_slide_flags
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class CROSS_SLIDE_FLAGS{

    /**
     * No cross-slide interaction.
     * @type {Integer (UInt32)}
     */
    static CROSS_SLIDE_FLAGS_NONE => 0

    /**
     * Cross-slide interaction has crossed a distance threshold and is in select mode.
     * @type {Integer (UInt32)}
     */
    static CROSS_SLIDE_FLAGS_SELECT => 1

    /**
     * Cross-slide interaction is in speed bump mode.
     * @type {Integer (UInt32)}
     */
    static CROSS_SLIDE_FLAGS_SPEED_BUMP => 2

    /**
     * Cross-slide interaction has crossed the speed bump threshold and is in rearrange (drag and drop) mode.
     * @type {Integer (UInt32)}
     */
    static CROSS_SLIDE_FLAGS_REARRANGE => 4

    /**
     * Maximum number of interactions exceeded.
     * @type {Integer (UInt32)}
     */
    static CROSS_SLIDE_FLAGS_MAX => 4294967295
}
