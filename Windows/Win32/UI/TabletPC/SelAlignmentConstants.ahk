#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the alignment of the paragraph relative to the margins of the InkEdit control.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-selalignmentconstants
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct SelAlignmentConstants {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default. The paragraph is aligned along the left margin.
     * @type {Integer (Int32)}
     */
    static rtfLeft => 0

    /**
     * The paragraph is aligned along the right margin.
     * @type {Integer (Int32)}
     */
    static rtfRight => 1

    /**
     * The paragraph is centered between the left and right margins.
     * @type {Integer (Int32)}
     */
    static rtfCenter => 2
}
