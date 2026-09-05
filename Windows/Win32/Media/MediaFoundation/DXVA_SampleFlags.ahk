#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_SampleFlags extends Win32Enum {

    /**
     * Native name: DXVA_SampleFlagsMask
     * @type {Integer (Int32)}
     */
    static Mask => 15

    /**
     * Native name: DXVA_SampleFlag_Palette_Changed
     * @type {Integer (Int32)}
     */
    static Flag_Palette_Changed => 1

    /**
     * Native name: DXVA_SampleFlag_SrcRect_Changed
     * @type {Integer (Int32)}
     */
    static Flag_SrcRect_Changed => 2

    /**
     * Native name: DXVA_SampleFlag_DstRect_Changed
     * @type {Integer (Int32)}
     */
    static Flag_DstRect_Changed => 4

    /**
     * Native name: DXVA_SampleFlag_ColorData_Changed
     * @type {Integer (Int32)}
     */
    static Flag_ColorData_Changed => 8
}
