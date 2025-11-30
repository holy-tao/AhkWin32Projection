#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class XPSRAS_PIXEL_FORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XPSRAS_PIXEL_FORMAT_32BPP_PBGRA_UINT_SRGB => 1

    /**
     * @type {Integer (Int32)}
     */
    static XPSRAS_PIXEL_FORMAT_64BPP_PRGBA_HALF_SCRGB => 2

    /**
     * @type {Integer (Int32)}
     */
    static XPSRAS_PIXEL_FORMAT_128BPP_PRGBA_FLOAT_SCRGB => 3
}
