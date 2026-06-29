#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies values that identify the Ribbon framework View.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_viewtype
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_VIEWTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A Ribbon View.
     * @type {Integer (Int32)}
     */
    static UI_VIEWTYPE_RIBBON => 1
}
