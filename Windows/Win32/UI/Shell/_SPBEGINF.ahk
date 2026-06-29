#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by IActionProgress::Begin, these constants specify certain UI operations that are to be enabled or disabled.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_spbeginf
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _SPBEGINF {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates default progress behavior.
     * @type {Integer (Int32)}
     */
    static SPBEGINF_NORMAL => 0

    /**
     * Indicates that the progress UI should automatically update a text field with the amount of time remaining until the action completes.
     * @type {Integer (Int32)}
     */
    static SPBEGINF_AUTOTIME => 2

    /**
     * Indicates that the UI should not display a progress bar.
     * @type {Integer (Int32)}
     */
    static SPBEGINF_NOPROGRESSBAR => 16

    /**
     * Indicates that the UI should use a marquee-style progress bar.
     * @type {Integer (Int32)}
     */
    static SPBEGINF_MARQUEEPROGRESS => 32

    /**
     * Indicates that the UI should not include a <b>Cancel</b> button.
     * @type {Integer (Int32)}
     */
    static SPBEGINF_NOCANCELBUTTON => 64
}
