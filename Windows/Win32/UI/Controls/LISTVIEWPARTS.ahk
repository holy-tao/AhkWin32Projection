#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LISTVIEWPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LVP_LISTITEM => 1

    /**
     * @type {Integer (Int32)}
     */
    static LVP_LISTGROUP => 2

    /**
     * @type {Integer (Int32)}
     */
    static LVP_LISTDETAIL => 3

    /**
     * @type {Integer (Int32)}
     */
    static LVP_LISTSORTEDDETAIL => 4

    /**
     * @type {Integer (Int32)}
     */
    static LVP_EMPTYTEXT => 5

    /**
     * @type {Integer (Int32)}
     */
    static LVP_GROUPHEADER => 6

    /**
     * @type {Integer (Int32)}
     */
    static LVP_GROUPHEADERLINE => 7

    /**
     * @type {Integer (Int32)}
     */
    static LVP_EXPANDBUTTON => 8

    /**
     * @type {Integer (Int32)}
     */
    static LVP_COLLAPSEBUTTON => 9

    /**
     * @type {Integer (Int32)}
     */
    static LVP_COLUMNDETAIL => 10
}
