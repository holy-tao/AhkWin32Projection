#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_VideoTransferFunction extends Win32Enum {

    /**
     * Native name: DXVA_VideoTransFuncShift
     * @type {Integer (Int32)}
     */
    static TransFuncShift => 27

    /**
     * Native name: DXVA_VideoTransFuncMask
     * @type {Integer (Int32)}
     */
    static TransFuncMask => -134217728

    /**
     * Native name: DXVA_VideoTransFunc_Unknown
     * @type {Integer (Int32)}
     */
    static TransFunc_Unknown => 0

    /**
     * Native name: DXVA_VideoTransFunc_10
     * @type {Integer (Int32)}
     */
    static TransFunc_10 => 1

    /**
     * Native name: DXVA_VideoTransFunc_18
     * @type {Integer (Int32)}
     */
    static TransFunc_18 => 2

    /**
     * Native name: DXVA_VideoTransFunc_20
     * @type {Integer (Int32)}
     */
    static TransFunc_20 => 3

    /**
     * Native name: DXVA_VideoTransFunc_22
     * @type {Integer (Int32)}
     */
    static TransFunc_22 => 4

    /**
     * Native name: DXVA_VideoTransFunc_22_709
     * @type {Integer (Int32)}
     */
    static TransFunc_22_709 => 5

    /**
     * Native name: DXVA_VideoTransFunc_22_240M
     * @type {Integer (Int32)}
     */
    static TransFunc_22_240M => 6

    /**
     * Native name: DXVA_VideoTransFunc_22_8bit_sRGB
     * @type {Integer (Int32)}
     */
    static TransFunc_22_8bit_sRGB => 7

    /**
     * Native name: DXVA_VideoTransFunc_28
     * @type {Integer (Int32)}
     */
    static TransFunc_28 => 8
}
