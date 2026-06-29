#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that indicate the entry point of a web search.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ne-commctrl-ec_searchweb_entrypoint
 * @namespace Windows.Win32.UI.Controls
 */
export default struct EC_SEARCHWEB_ENTRYPOINT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Entry point is external.
     * @type {Integer (Int32)}
     */
    static EC_SEARCHWEB_ENTRYPOINT_EXTERNAL => 0

    /**
     * Entry point is a context menu.
     * @type {Integer (Int32)}
     */
    static EC_SEARCHWEB_ENTRYPOINT_CONTEXTMENU => 1
}
