#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies values that identify the type of Command associated with a Ribbon control.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ne-uiribbon-ui_commandtype
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_COMMANDTYPE{

    /**
     * The type of command is not known.
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_UNKNOWN => 0

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-group">Group</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_GROUP => 1

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-button">Button</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-helpbutton">Help Button</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_ACTION => 2

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-applicationmenu">Application Menu</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-dropdownbutton">Drop-Down Button</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-splitbutton">Split Button</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-tab">Tab</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_ANCHOR => 3

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-tabgroup">Tab Group</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_CONTEXT => 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-combobox">Combo Box</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-dropdowngallery">Drop-Down Gallery</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-inribbongallery">In-Ribbon Gallery</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-splitbuttongallery">Split Button Gallery</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_COLLECTION => 5

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-dropdowngallery">Drop-Down Gallery</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-inribbongallery">In-Ribbon Gallery</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-quickaccesstoolbar">Quick Access Toolbar</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-splitbuttongallery">Split Button Gallery</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_COMMANDCOLLECTION => 6

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-spinner">Spinner</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_DECIMAL => 7

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-togglebutton">Toggle Button</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-checkbox">Check Box</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_BOOLEAN => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-fontcontrol">Font Control</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_FONT => 9

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-recentitems">Recent Items</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_RECENTITEMS => 10

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-dropdowncolorpicker">Drop-Down Color Picker</a>
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_COLORANCHOR => 11

    /**
     * This Command type is not supported by any framework controls.
     * @type {Integer (Int32)}
     */
    static UI_COMMANDTYPE_COLORCOLLECTION => 12
}
