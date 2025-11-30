#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WINDOW_LONG_PTR_INDEX extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GWL_EXSTYLE => -20

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_HINSTANCE => -6

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_HWNDPARENT => -8

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_ID => -12

    /**
     * @type {Integer (Int32)}
     */
    static GWL_STYLE => -16

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_USERDATA => -21

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_WNDPROC => -4

    /**
     * @type {Integer (Int32)}
     */
    static GWL_HINSTANCE => -6

    /**
     * @type {Integer (Int32)}
     */
    static GWL_ID => -12

    /**
     * @type {Integer (Int32)}
     */
    static GWL_USERDATA => -21

    /**
     * @type {Integer (Int32)}
     */
    static GWL_WNDPROC => -4

    /**
     * @type {Integer (Int32)}
     */
    static GWL_HWNDPARENT => -8
}
