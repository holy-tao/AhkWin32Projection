#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the structural types within the IInkDivisionResult object.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/ne-msinkaut15-inkdivisiontype
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkDivisionType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A recognition segment.
     * @type {Integer (Int32)}
     */
    static IDT_Segment => 0

    /**
     * A line of handwriting that contains one or more recognition segments.
     * @type {Integer (Int32)}
     */
    static IDT_Line => 1

    /**
     * A block of strokes that contains one or more lines of handwriting.
     * @type {Integer (Int32)}
     */
    static IDT_Paragraph => 2

    /**
     * Ink that is not text.
     * @type {Integer (Int32)}
     */
    static IDT_Drawing => 3
}
