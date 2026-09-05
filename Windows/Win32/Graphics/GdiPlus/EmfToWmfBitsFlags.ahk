#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class EmfToWmfBitsFlags extends Win32Enum {

    /**
     * Native name: EmfToWmfBitsFlagsDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: EmfToWmfBitsFlagsEmbedEmf
     * @type {Integer (Int32)}
     */
    static EmbedEmf => 1

    /**
     * Native name: EmfToWmfBitsFlagsIncludePlaceable
     * @type {Integer (Int32)}
     */
    static IncludePlaceable => 2

    /**
     * Native name: EmfToWmfBitsFlagsNoXORClip
     * @type {Integer (Int32)}
     */
    static NoXORClip => 4
}
