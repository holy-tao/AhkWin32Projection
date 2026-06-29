#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify units of text for the purposes of navigation.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-textunit
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct TextUnit {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Character.
     * @type {Integer (Int32)}
     */
    static TextUnit_Character => 0

    /**
     * Format.
     * @type {Integer (Int32)}
     */
    static TextUnit_Format => 1

    /**
     * Word.
     * @type {Integer (Int32)}
     */
    static TextUnit_Word => 2

    /**
     * Line.
     * @type {Integer (Int32)}
     */
    static TextUnit_Line => 3

    /**
     * Paragraph.
     * @type {Integer (Int32)}
     */
    static TextUnit_Paragraph => 4

    /**
     * Page.
     * @type {Integer (Int32)}
     */
    static TextUnit_Page => 5

    /**
     * Document.
     * @type {Integer (Int32)}
     */
    static TextUnit_Document => 6
}
