#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate the kind of presentation surface the statistics are for.
 * @see https://learn.microsoft.com/windows/win32/api/presentationtypes/ne-presentationtypes-presentstatisticskind
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
class PresentStatisticsKind extends Win32Enum {

    /**
     * Statistics are for a present status.
     * Native name: PresentStatisticsKind_PresentStatus
     * @type {Integer (Int32)}
     */
    static PresentStatus => 1

    /**
     * Statistics are for a composition frame.
     * Native name: PresentStatisticsKind_CompositionFrame
     * @type {Integer (Int32)}
     */
    static CompositionFrame => 2

    /**
     * Statistics are for an independent flip frame.
     * Native name: PresentStatisticsKind_IndependentFlipFrame
     * @type {Integer (Int32)}
     */
    static IndependentFlipFrame => 3
}
