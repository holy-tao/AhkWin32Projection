#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MM_PAGE_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LowPagePriority => 0

    /**
     * @type {Integer (Int32)}
     */
    static NormalPagePriority => 16

    /**
     * @type {Integer (Int32)}
     */
    static HighPagePriority => 32
}
