#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_SIGNAL_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SIGNAL_UNAVAILABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SIGNAL_INACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SIGNAL_ACTIVE => 2
}
