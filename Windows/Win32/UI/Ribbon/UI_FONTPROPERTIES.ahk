#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies values that identify the font property state of a FontControl, such as Strikethrough.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_fontproperties
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_FONTPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The property is not available.
     * @type {Integer (Int32)}
     */
    static UI_FONTPROPERTIES_NOTAVAILABLE => 0

    /**
     * The property is not set.
     * @type {Integer (Int32)}
     */
    static UI_FONTPROPERTIES_NOTSET => 1

    /**
     * The property is set.
     * @type {Integer (Int32)}
     */
    static UI_FONTPROPERTIES_SET => 2
}
