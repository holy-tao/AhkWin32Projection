#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values that identify the type of Command associated with a Ribbon control.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_commandtype
 * @namespace Windows.Win32.UI.Ribbon
 */
class UI_COMMANDTYPE extends Win32Enum {

    /**
     * The type of command is not known.
     * Native name: UI_COMMANDTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-group">Group</a>
     * Native name: UI_COMMANDTYPE_GROUP
     * @type {Integer (Int32)}
     */
    static GROUP => 1

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-button">Button</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-helpbutton">Help Button</a>
     * Native name: UI_COMMANDTYPE_ACTION
     * @type {Integer (Int32)}
     */
    static ACTION => 2

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
     * Native name: UI_COMMANDTYPE_ANCHOR
     * @type {Integer (Int32)}
     */
    static ANCHOR => 3

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-tabgroup">Tab Group</a>
     * Native name: UI_COMMANDTYPE_CONTEXT
     * @type {Integer (Int32)}
     */
    static CONTEXT => 4

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
     * Native name: UI_COMMANDTYPE_COLLECTION
     * @type {Integer (Int32)}
     */
    static COLLECTION => 5

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
     * Native name: UI_COMMANDTYPE_COMMANDCOLLECTION
     * @type {Integer (Int32)}
     */
    static COMMANDCOLLECTION => 6

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-spinner">Spinner</a>
     * Native name: UI_COMMANDTYPE_DECIMAL
     * @type {Integer (Int32)}
     */
    static DECIMAL => 7

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-togglebutton">Toggle Button</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-checkbox">Check Box</a>
     * Native name: UI_COMMANDTYPE_BOOLEAN
     * @type {Integer (Int32)}
     */
    static BOOLEAN => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-fontcontrol">Font Control</a>
     * Native name: UI_COMMANDTYPE_FONT
     * @type {Integer (Int32)}
     */
    static FONT => 9

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-recentitems">Recent Items</a>
     * Native name: UI_COMMANDTYPE_RECENTITEMS
     * @type {Integer (Int32)}
     */
    static RECENTITEMS => 10

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-dropdowncolorpicker">Drop-Down Color Picker</a>
     * Native name: UI_COMMANDTYPE_COLORANCHOR
     * @type {Integer (Int32)}
     */
    static COLORANCHOR => 11

    /**
     * This Command type is not supported by any framework controls.
     * Native name: UI_COMMANDTYPE_COLORCOLLECTION
     * @type {Integer (Int32)}
     */
    static COLORCOLLECTION => 12
}
