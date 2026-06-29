#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the locations where events associated with a Ribbon control can originate.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_eventlocation
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_EVENTLOCATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a>.
     * @type {Integer (Int32)}
     */
    static UI_EVENTLOCATION_Ribbon => 0

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-quickaccesstoolbar">QuickAccessToolbar</a>.
     * @type {Integer (Int32)}
     */
    static UI_EVENTLOCATION_QAT => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-applicationmenu">ApplicationMenu</a>.
     * @type {Integer (Int32)}
     */
    static UI_EVENTLOCATION_ApplicationMenu => 2

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextpopup">ContextPopup</a>.
     * @type {Integer (Int32)}
     */
    static UI_EVENTLOCATION_ContextPopup => 3
}
