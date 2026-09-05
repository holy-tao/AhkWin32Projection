#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of the cross-slide interaction.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-cross_slide_flags
 * @namespace Windows.Win32.UI.InteractionContext
 */
class CROSS_SLIDE_FLAGS extends Win32BitflagEnum {

    /**
     * No cross-slide interaction.
     * Native name: CROSS_SLIDE_FLAGS_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Cross-slide interaction has crossed a distance threshold and is in select mode.
     * Native name: CROSS_SLIDE_FLAGS_SELECT
     * @type {Integer (UInt32)}
     */
    static SELECT => 1

    /**
     * Cross-slide interaction is in speed bump mode.
     * Native name: CROSS_SLIDE_FLAGS_SPEED_BUMP
     * @type {Integer (UInt32)}
     */
    static SPEED_BUMP => 2

    /**
     * Cross-slide interaction has crossed the speed bump threshold and is in rearrange (drag and drop) mode.
     * Native name: CROSS_SLIDE_FLAGS_REARRANGE
     * @type {Integer (UInt32)}
     */
    static REARRANGE => 4

    /**
     * Maximum number of interactions exceeded.
     * Native name: CROSS_SLIDE_FLAGS_MAX
     * @type {Integer (UInt32)}
     */
    static MAX => 4294967295
}
