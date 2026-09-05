#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_NominalRange extends Win32Enum {

    /**
     * Native name: DXVA_NominalRangeShift
     * @type {Integer (Int32)}
     */
    static Shift => 12

    /**
     * Native name: DXVA_NominalRangeMask
     * @type {Integer (Int32)}
     */
    static Mask => 28672

    /**
     * Native name: DXVA_NominalRange_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DXVA_NominalRange_Normal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: DXVA_NominalRange_Wide
     * @type {Integer (Int32)}
     */
    static Wide => 2

    /**
     * Native name: DXVA_NominalRange_0_255
     * @type {Integer (Int32)}
     */
    static 0_255 => 1

    /**
     * Native name: DXVA_NominalRange_16_235
     * @type {Integer (Int32)}
     */
    static 16_235 => 2

    /**
     * Native name: DXVA_NominalRange_48_208
     * @type {Integer (Int32)}
     */
    static 48_208 => 3
}
