#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the cross-slide behavior thresholds.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-cross_slide_threshold
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct CROSS_SLIDE_THRESHOLD {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Selection start.
     * @type {Integer (Int32)}
     */
    static CROSS_SLIDE_THRESHOLD_SELECT_START => 0

    /**
     * Speed bump start.
     * @type {Integer (Int32)}
     */
    static CROSS_SLIDE_THRESHOLD_SPEED_BUMP_START => 1

    /**
     * Speed bump end.
     * @type {Integer (Int32)}
     */
    static CROSS_SLIDE_THRESHOLD_SPEED_BUMP_END => 2

    /**
     * Rearrange (drag and drop) start.
     * @type {Integer (Int32)}
     */
    static CROSS_SLIDE_THRESHOLD_REARRANGE_START => 3

    /**
     * The number of thresholds specified.
     * @type {Integer (Int32)}
     */
    static CROSS_SLIDE_THRESHOLD_COUNT => 4

    /**
     * Maximum number of interactions exceeded.
     * @type {Integer (Int32)}
     */
    static CROSS_SLIDE_THRESHOLD_MAX => -1
}
