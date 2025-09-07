#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the direction, relative to Input Panel, that the post insertion correction comb displays.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionposition
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class CorrectionPosition{

    /**
     * The system decides on the position of the correction comb.
     * @type {Integer (Int32)}
     */
    static CorrectionPosition_Auto => 0

    /**
     * The correction comb is shown below the input area.
     * @type {Integer (Int32)}
     */
    static CorrectionPosition_Bottom => 1

    /**
     * The correction comb is shown above the input area.
     * @type {Integer (Int32)}
     */
    static CorrectionPosition_Top => 2
}
