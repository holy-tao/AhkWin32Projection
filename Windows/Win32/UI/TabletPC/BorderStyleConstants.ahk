#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how the borders of an InkEdit control appear on the screen.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-borderstyleconstants
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct BorderStyleConstants {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No border.
     * @type {Integer (Int32)}
     */
    static rtfNoBorder => 0

    /**
     * Single line border.
     * @type {Integer (Int32)}
     */
    static rtfFixedSingle => 1
}
