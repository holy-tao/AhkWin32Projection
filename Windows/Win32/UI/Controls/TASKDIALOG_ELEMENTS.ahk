#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TASKDIALOG_ELEMENTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TDE_CONTENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TDE_EXPANDED_INFORMATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDE_FOOTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static TDE_MAIN_INSTRUCTION => 3
}
