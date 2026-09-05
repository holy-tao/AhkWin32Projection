#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

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
 */
class UI_EVENTTYPE extends Win32Enum {

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-applicationmenu">ApplicationMenu</a> opened.
     * Native name: UI_EVENTTYPE_ApplicationMenuOpened
     * @type {Integer (Int32)}
     */
    static ApplicationMenuOpened => 0

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> minimized.
     * Native name: UI_EVENTTYPE_RibbonMinimized
     * @type {Integer (Int32)}
     */
    static RibbonMinimized => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> expanded.
     * Native name: UI_EVENTTYPE_RibbonExpanded
     * @type {Integer (Int32)}
     */
    static RibbonExpanded => 2

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/ribbon-applicationmodes">application mode</a> changed.
     * Native name: UI_EVENTTYPE_ApplicationModeSwitched
     * @type {Integer (Int32)}
     */
    static ApplicationModeSwitched => 3

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-tab">Tab</a> activated.
     * Native name: UI_EVENTTYPE_TabActivated
     * @type {Integer (Int32)}
     */
    static TabActivated => 4

    /**
     * A menu opened.
     * Native name: UI_EVENTTYPE_MenuOpened
     * @type {Integer (Int32)}
     */
    static MenuOpened => 5

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> executed.
     * Native name: UI_EVENTTYPE_CommandExecuted
     * @type {Integer (Int32)}
     */
    static CommandExecuted => 6

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> tooltip displayed.
     * Native name: UI_EVENTTYPE_TooltipShown
     * @type {Integer (Int32)}
     */
    static TooltipShown => 7
}
