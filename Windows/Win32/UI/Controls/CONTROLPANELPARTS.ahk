#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class CONTROLPANELPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_NAVIGATIONPANE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_CONTENTPANE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_NAVIGATIONPANELABEL => 3

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_CONTENTPANELABEL => 4

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_TITLE => 5

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_BODYTEXT => 6

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_HELPLINK => 7

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_TASKLINK => 8

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_GROUPTEXT => 9

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_CONTENTLINK => 10

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_SECTIONTITLELINK => 11

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_LARGECOMMANDAREA => 12

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_SMALLCOMMANDAREA => 13

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_BUTTON => 14

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_MESSAGETEXT => 15

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_NAVIGATIONPANELINE => 16

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_CONTENTPANELINE => 17

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_BANNERAREA => 18

    /**
     * @type {Integer (Int32)}
     */
    static CPANEL_BODYTITLE => 19
}
