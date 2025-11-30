#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_CHANGE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BDA_CHANGES_COMPLETE => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_CHANGES_PENDING => 1
}
