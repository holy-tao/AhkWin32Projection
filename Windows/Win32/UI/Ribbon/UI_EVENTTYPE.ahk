#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the types of events associated with a Ribbon.
 * @remarks
 * <b>UI_EVENTTYPE_TabActivated</b> is fired for both core tabs and contextual tabs; the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> event system does not distinguish between the two.
  * 
  * <b>UI_EVENTTYPE_MenuOpened</b> and <b>UI_EVENTTYPE_MenuClosed</b> are fired when either a regular menu or a gallery menu is opened or closed.
  * 
  * No event is fired when the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-quickaccesstoolbar">QuickAccessToolbar</a> menu is opened or closed.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_eventtype
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_EVENTTYPE{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-applicationmenu">ApplicationMenu</a> opened.
     * @type {Integer (Int32)}
     */
    static UI_EVENTTYPE_ApplicationMenuOpened => 0

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> minimized.
     * @type {Integer (Int32)}
     */
    static UI_EVENTTYPE_RibbonMinimized => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> expanded.
     * @type {Integer (Int32)}
     */
    static UI_EVENTTYPE_RibbonExpanded => 2

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/ribbon-applicationmodes">application mode</a> changed.
     * @type {Integer (Int32)}
     */
    static UI_EVENTTYPE_ApplicationModeSwitched => 3

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-tab">Tab</a> activated.
     * @type {Integer (Int32)}
     */
    static UI_EVENTTYPE_TabActivated => 4

    /**
     * A menu opened.
     * @type {Integer (Int32)}
     */
    static UI_EVENTTYPE_MenuOpened => 5

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> executed.
     * @type {Integer (Int32)}
     */
    static UI_EVENTTYPE_CommandExecuted => 6

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> tooltip displayed.
     * @type {Integer (Int32)}
     */
    static UI_EVENTTYPE_TooltipShown => 7
}
