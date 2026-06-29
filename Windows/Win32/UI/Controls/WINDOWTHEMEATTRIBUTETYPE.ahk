#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of visual style attribute to set on a window.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ne-uxtheme-windowthemeattributetype
 * @namespace Windows.Win32.UI.Controls
 */
export default struct WINDOWTHEMEATTRIBUTETYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Non-client area window attributes will be set.
     * @type {Integer (Int32)}
     */
    static WTA_NONCLIENT => 1
}
