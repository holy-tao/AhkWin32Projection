#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class AVRT_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AVRT_PRIORITY_VERYLOW => -2

    /**
     * @type {Integer (Int32)}
     */
    static AVRT_PRIORITY_LOW => -1

    /**
     * @type {Integer (Int32)}
     */
    static AVRT_PRIORITY_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static AVRT_PRIORITY_HIGH => 1

    /**
     * @type {Integer (Int32)}
     */
    static AVRT_PRIORITY_CRITICAL => 2
}
