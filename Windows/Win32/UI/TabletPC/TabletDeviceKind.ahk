#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class TabletDeviceKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TDK_Mouse => 0

    /**
     * @type {Integer (Int32)}
     */
    static TDK_Pen => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDK_Touch => 2
}
