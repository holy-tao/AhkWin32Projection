#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that indicate the kind of presentation surface the statistics are for.
 * @see https://learn.microsoft.com/windows/win32/api/presentationtypes/ne-presentationtypes-presentstatisticskind
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct PresentStatisticsKind {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Statistics are for a present status.
     * @type {Integer (Int32)}
     */
    static PresentStatisticsKind_PresentStatus => 1

    /**
     * Statistics are for a composition frame.
     * @type {Integer (Int32)}
     */
    static PresentStatisticsKind_CompositionFrame => 2

    /**
     * Statistics are for an independent flip frame.
     * @type {Integer (Int32)}
     */
    static PresentStatisticsKind_IndependentFlipFrame => 3
}
