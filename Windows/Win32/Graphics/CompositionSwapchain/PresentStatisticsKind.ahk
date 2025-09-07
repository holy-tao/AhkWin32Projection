#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that indicate the kind of presentation surface the statistics are for.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentationtypes/ne-presentationtypes-presentstatisticskind
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class PresentStatisticsKind{

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
