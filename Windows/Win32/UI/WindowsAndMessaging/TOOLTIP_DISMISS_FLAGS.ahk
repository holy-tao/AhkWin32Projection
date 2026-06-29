#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-tooltip_dismiss_flags
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct TOOLTIP_DISMISS_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The window is registered to receive tooltip dismiss notifications.
     * @type {Integer (Int32)}
     */
    static TDF_REGISTER => 1

    /**
     * The window is unregistered from receiving tooltip dismiss notifications.
     * @type {Integer (Int32)}
     */
    static TDF_UNREGISTER => 2
}
