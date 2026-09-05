#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DMA_COMPLETION_STATUS extends Win32Enum {

    /**
     * Native name: DmaComplete
     * @type {Integer (Int32)}
     */
    static Complete => 0

    /**
     * Native name: DmaAborted
     * @type {Integer (Int32)}
     */
    static Aborted => 1

    /**
     * Native name: DmaError
     * @type {Integer (Int32)}
     */
    static Error => 2

    /**
     * Native name: DmaCancelled
     * @type {Integer (Int32)}
     */
    static Cancelled => 3
}
