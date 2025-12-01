#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EmfToWmfBitsFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EmfToWmfBitsFlagsDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static EmfToWmfBitsFlagsEmbedEmf => 1

    /**
     * @type {Integer (Int32)}
     */
    static EmfToWmfBitsFlagsIncludePlaceable => 2

    /**
     * @type {Integer (Int32)}
     */
    static EmfToWmfBitsFlagsNoXORClip => 4
}
