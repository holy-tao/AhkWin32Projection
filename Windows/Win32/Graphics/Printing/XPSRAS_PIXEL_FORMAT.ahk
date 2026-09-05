#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class XPSRAS_PIXEL_FORMAT extends Win32Enum {

    /**
     * Native name: XPSRAS_PIXEL_FORMAT_32BPP_PBGRA_UINT_SRGB
     * @type {Integer (Int32)}
     */
    static 32BPP_PBGRA_UINT_SRGB => 1

    /**
     * Native name: XPSRAS_PIXEL_FORMAT_64BPP_PRGBA_HALF_SCRGB
     * @type {Integer (Int32)}
     */
    static 64BPP_PRGBA_HALF_SCRGB => 2

    /**
     * Native name: XPSRAS_PIXEL_FORMAT_128BPP_PRGBA_FLOAT_SCRGB
     * @type {Integer (Int32)}
     */
    static 128BPP_PRGBA_FLOAT_SCRGB => 3
}
