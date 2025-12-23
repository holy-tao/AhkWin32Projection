#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_NominalRange extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRangeShift => 12

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRangeMask => 28672

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_Normal => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_Wide => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_0_255 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_16_235 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_48_208 => 3
}
