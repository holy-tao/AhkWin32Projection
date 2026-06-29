#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the values that identify how a color swatch in a DropDownColorPicker or a FontControl color picker (Text color or Text highlight) is filled.Note  These are recommendations only.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_swatchcolortype
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_SWATCHCOLORTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The swatch is transparent.
     * @type {Integer (Int32)}
     */
    static UI_SWATCHCOLORTYPE_NOCOLOR => 0

    /**
     * The swatch is filled with a solid RGB color bound to <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-getsyscolor">GetSysColor(COLOR_WINDOWTEXT)</a>.
     * @type {Integer (Int32)}
     */
    static UI_SWATCHCOLORTYPE_AUTOMATIC => 1

    /**
     * The swatch is filled with a solid RGB color.
     * @type {Integer (Int32)}
     */
    static UI_SWATCHCOLORTYPE_RGB => 2
}
