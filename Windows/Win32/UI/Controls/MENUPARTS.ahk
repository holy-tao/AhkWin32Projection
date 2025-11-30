#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class MENUPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MENU_MENUITEM_TMSCHEMA => 1

    /**
     * @type {Integer (Int32)}
     */
    static MENU_MENUDROPDOWN_TMSCHEMA => 2

    /**
     * @type {Integer (Int32)}
     */
    static MENU_MENUBARITEM_TMSCHEMA => 3

    /**
     * @type {Integer (Int32)}
     */
    static MENU_MENUBARDROPDOWN_TMSCHEMA => 4

    /**
     * @type {Integer (Int32)}
     */
    static MENU_CHEVRON_TMSCHEMA => 5

    /**
     * @type {Integer (Int32)}
     */
    static MENU_SEPARATOR_TMSCHEMA => 6

    /**
     * @type {Integer (Int32)}
     */
    static MENU_BARBACKGROUND => 7

    /**
     * @type {Integer (Int32)}
     */
    static MENU_BARITEM => 8

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPBACKGROUND => 9

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPBORDERS => 10

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPCHECK => 11

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPCHECKBACKGROUND => 12

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPGUTTER => 13

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPITEM => 14

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPSEPARATOR => 15

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPSUBMENU => 16

    /**
     * @type {Integer (Int32)}
     */
    static MENU_SYSTEMCLOSE => 17

    /**
     * @type {Integer (Int32)}
     */
    static MENU_SYSTEMMAXIMIZE => 18

    /**
     * @type {Integer (Int32)}
     */
    static MENU_SYSTEMMINIMIZE => 19

    /**
     * @type {Integer (Int32)}
     */
    static MENU_SYSTEMRESTORE => 20

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPSUBMENUHCHOT => 21

    /**
     * @type {Integer (Int32)}
     */
    static MENU_SYSTEMCLOSEHCHOT => 22

    /**
     * @type {Integer (Int32)}
     */
    static MENU_SYSTEMMAXIMIZEHCHOT => 23

    /**
     * @type {Integer (Int32)}
     */
    static MENU_SYSTEMMINIMIZEHCHOT => 24

    /**
     * @type {Integer (Int32)}
     */
    static MENU_SYSTEMRESTOREHCHOT => 25

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPITEMKBFOCUS => 26

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPITEMFOCUSABLE => 27

    /**
     * @type {Integer (Int32)}
     */
    static MENU_POPUPSUBMENU_HCHOT => 21
}
