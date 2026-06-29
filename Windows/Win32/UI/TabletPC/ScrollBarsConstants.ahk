#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how the scroll bars of an InkEdit control appear on the screen.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-scrollbarsconstants
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct ScrollBarsConstants {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default. No scroll bars.
     * @type {Integer (Int32)}
     */
    static rtfNone => 0

    /**
     * Horizontal scroll bar only.
     * @type {Integer (Int32)}
     */
    static rtfHorizontal => 1

    /**
     * Vertical scroll bar only.
     * @type {Integer (Int32)}
     */
    static rtfVertical => 2

    /**
     * Both horizontal and vertical scroll bars.
     * @type {Integer (Int32)}
     */
    static rtfBoth => 3
}
