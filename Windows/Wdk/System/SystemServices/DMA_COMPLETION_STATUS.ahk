#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DMA_COMPLETION_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DmaComplete => 0

    /**
     * @type {Integer (Int32)}
     */
    static DmaAborted => 1

    /**
     * @type {Integer (Int32)}
     */
    static DmaError => 2

    /**
     * @type {Integer (Int32)}
     */
    static DmaCancelled => 3
}
