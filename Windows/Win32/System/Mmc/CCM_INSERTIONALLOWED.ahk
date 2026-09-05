#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 */
class CCM_INSERTIONALLOWED extends Win32Enum {

    /**
     * Native name: CCM_INSERTIONALLOWED_TOP
     * @type {Integer (Int32)}
     */
    static TOP => 1

    /**
     * Native name: CCM_INSERTIONALLOWED_NEW
     * @type {Integer (Int32)}
     */
    static NEW => 2

    /**
     * Native name: CCM_INSERTIONALLOWED_TASK
     * @type {Integer (Int32)}
     */
    static TASK => 4

    /**
     * Native name: CCM_INSERTIONALLOWED_VIEW
     * @type {Integer (Int32)}
     */
    static VIEW => 8
}
