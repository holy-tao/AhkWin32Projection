#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the level of confidence the recognizer has in the recognition result.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ne-rectypes-confidence_level
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct CONFIDENCE_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The recognizer is confident that the best alternate is correct.
     * @type {Integer (Int32)}
     */
    static CFL_STRONG => 0

    /**
     * The recognizer is confident that the correct result is in the list of alternates.
     * @type {Integer (Int32)}
     */
    static CFL_INTERMEDIATE => 1

    /**
     * The recognizer is not confident that the result is in the list of alternates.
     * @type {Integer (Int32)}
     */
    static CFL_POOR => 2
}
