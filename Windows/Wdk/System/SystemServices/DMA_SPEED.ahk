#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DMA_SPEED extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Compatible => 0

    /**
     * @type {Integer (Int32)}
     */
    static TypeA => 1

    /**
     * @type {Integer (Int32)}
     */
    static TypeB => 2

    /**
     * @type {Integer (Int32)}
     */
    static TypeC => 3

    /**
     * @type {Integer (Int32)}
     */
    static TypeF => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaximumDmaSpeed => 5
}
