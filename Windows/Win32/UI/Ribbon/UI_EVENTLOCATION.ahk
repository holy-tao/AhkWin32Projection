#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the locations where events associated with a Ribbon control can originate.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_eventlocation
 * @namespace Windows.Win32.UI.Ribbon
 */
class UI_EVENTLOCATION extends Win32Enum {

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a>.
     * Native name: UI_EVENTLOCATION_Ribbon
     * @type {Integer (Int32)}
     */
    static Ribbon => 0

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-quickaccesstoolbar">QuickAccessToolbar</a>.
     * Native name: UI_EVENTLOCATION_QAT
     * @type {Integer (Int32)}
     */
    static QAT => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-applicationmenu">ApplicationMenu</a>.
     * Native name: UI_EVENTLOCATION_ApplicationMenu
     * @type {Integer (Int32)}
     */
    static ApplicationMenu => 2

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextpopup">ContextPopup</a>.
     * Native name: UI_EVENTLOCATION_ContextPopup
     * @type {Integer (Int32)}
     */
    static ContextPopup => 3
}
