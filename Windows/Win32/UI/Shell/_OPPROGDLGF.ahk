#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _OPPROGDLGF extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_ENABLEPAUSE => 128

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_ALLOWUNDO => 256

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_DONTDISPLAYSOURCEPATH => 512

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_DONTDISPLAYDESTPATH => 1024

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_NOMULTIDAYESTIMATES => 2048

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_DONTDISPLAYLOCATIONS => 4096
}
