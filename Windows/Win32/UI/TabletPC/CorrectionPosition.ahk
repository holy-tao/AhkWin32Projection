#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the direction, relative to Input Panel, that the post insertion correction comb displays.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionposition
 * @namespace Windows.Win32.UI.TabletPC
 */
class CorrectionPosition extends Win32Enum {

    /**
     * The system decides on the position of the correction comb.
     * Native name: CorrectionPosition_Auto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The correction comb is shown below the input area.
     * Native name: CorrectionPosition_Bottom
     * @type {Integer (Int32)}
     */
    static Bottom => 1

    /**
     * The correction comb is shown above the input area.
     * Native name: CorrectionPosition_Top
     * @type {Integer (Int32)}
     */
    static Top => 2
}
