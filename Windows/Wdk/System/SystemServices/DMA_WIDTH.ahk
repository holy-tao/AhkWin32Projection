#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DMA_WIDTH extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Width8Bits => 0

    /**
     * @type {Integer (Int32)}
     */
    static Width16Bits => 1

    /**
     * @type {Integer (Int32)}
     */
    static Width32Bits => 2

    /**
     * @type {Integer (Int32)}
     */
    static Width64Bits => 3

    /**
     * @type {Integer (Int32)}
     */
    static WidthNoWrap => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaximumDmaWidth => 5
}
