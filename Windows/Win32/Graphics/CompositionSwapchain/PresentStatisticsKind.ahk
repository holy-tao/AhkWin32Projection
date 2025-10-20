#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentationtypes/ne-presentationtypes-presentstatisticskind
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class PresentStatisticsKind{

    /**
     * @type {Integer (Int32)}
     */
    static PresentStatisticsKind_PresentStatus => 1

    /**
     * @type {Integer (Int32)}
     */
    static PresentStatisticsKind_CompositionFrame => 2

    /**
     * @type {Integer (Int32)}
     */
    static PresentStatisticsKind_IndependentFlipFrame => 3
}
