#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the target.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwmtransition_ownedwindow_target
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWMTRANSITION_OWNEDWINDOW_TARGET {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates no animation.
     * @type {Integer (Int32)}
     */
    static DWMTRANSITION_OWNEDWINDOW_NULL => -1

    /**
     * Indicates that the window is repositioned.
     * @type {Integer (Int32)}
     */
    static DWMTRANSITION_OWNEDWINDOW_REPOSITION => 0
}
