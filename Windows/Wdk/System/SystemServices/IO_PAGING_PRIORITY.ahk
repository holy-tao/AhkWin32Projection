#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_PAGING_PRIORITY extends Win32Enum {

    /**
     * Native name: IoPagingPriorityInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Native name: IoPagingPriorityNormal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: IoPagingPriorityHigh
     * @type {Integer (Int32)}
     */
    static High => 2

    /**
     * Native name: IoPagingPriorityReserved1
     * @type {Integer (Int32)}
     */
    static Reserved1 => 3

    /**
     * Native name: IoPagingPriorityReserved2
     * @type {Integer (Int32)}
     */
    static Reserved2 => 4
}
