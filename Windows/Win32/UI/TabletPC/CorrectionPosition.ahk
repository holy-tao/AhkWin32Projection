#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the direction, relative to Input Panel, that the post insertion correction comb displays.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionposition
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct CorrectionPosition {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
