#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IO_PAGING_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IoPagingPriorityInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoPagingPriorityNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoPagingPriorityHigh => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoPagingPriorityReserved1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoPagingPriorityReserved2 => 4
}
