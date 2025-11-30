#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HEADERITEMRIGHTSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HIRS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static HIRS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HIRS_PRESSED => 3
}
