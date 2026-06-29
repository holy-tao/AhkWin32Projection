#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains possible values for the LiveSetting property. This property is implemented by provider elements that are part of a live region.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-livesetting
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct LiveSetting {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * @type {Integer (Int32)}
     */
    static Polite => 1

    /**
     * @type {Integer (Int32)}
     */
    static Assertive => 2
}
