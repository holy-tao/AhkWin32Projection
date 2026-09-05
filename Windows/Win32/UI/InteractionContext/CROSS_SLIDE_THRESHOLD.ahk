#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the cross-slide behavior thresholds.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-cross_slide_threshold
 * @namespace Windows.Win32.UI.InteractionContext
 */
class CROSS_SLIDE_THRESHOLD extends Win32Enum {

    /**
     * Selection start.
     * Native name: CROSS_SLIDE_THRESHOLD_SELECT_START
     * @type {Integer (Int32)}
     */
    static SELECT_START => 0

    /**
     * Speed bump start.
     * Native name: CROSS_SLIDE_THRESHOLD_SPEED_BUMP_START
     * @type {Integer (Int32)}
     */
    static SPEED_BUMP_START => 1

    /**
     * Speed bump end.
     * Native name: CROSS_SLIDE_THRESHOLD_SPEED_BUMP_END
     * @type {Integer (Int32)}
     */
    static SPEED_BUMP_END => 2

    /**
     * Rearrange (drag and drop) start.
     * Native name: CROSS_SLIDE_THRESHOLD_REARRANGE_START
     * @type {Integer (Int32)}
     */
    static REARRANGE_START => 3

    /**
     * The number of thresholds specified.
     * Native name: CROSS_SLIDE_THRESHOLD_COUNT
     * @type {Integer (Int32)}
     */
    static COUNT => 4

    /**
     * Maximum number of interactions exceeded.
     * Native name: CROSS_SLIDE_THRESHOLD_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}
