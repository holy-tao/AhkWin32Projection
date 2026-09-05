#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class DXVA2_SampleFlags extends Win32Enum {

    /**
     * Native name: DXVA2_SampleFlag_Palette_Changed
     * @type {Integer (Int32)}
     */
    static Flag_Palette_Changed => 1

    /**
     * Native name: DXVA2_SampleFlag_SrcRect_Changed
     * @type {Integer (Int32)}
     */
    static Flag_SrcRect_Changed => 2

    /**
     * Native name: DXVA2_SampleFlag_DstRect_Changed
     * @type {Integer (Int32)}
     */
    static Flag_DstRect_Changed => 4

    /**
     * Native name: DXVA2_SampleFlag_ColorData_Changed
     * @type {Integer (Int32)}
     */
    static Flag_ColorData_Changed => 8

    /**
     * Native name: DXVA2_SampleFlag_PlanarAlpha_Changed
     * @type {Integer (Int32)}
     */
    static Flag_PlanarAlpha_Changed => 16

    /**
     * Native name: DXVA2_SampleFlag_RFF
     * @type {Integer (Int32)}
     */
    static Flag_RFF => 65536

    /**
     * Native name: DXVA2_SampleFlag_TFF
     * @type {Integer (Int32)}
     */
    static Flag_TFF => 131072

    /**
     * Native name: DXVA2_SampleFlag_RFF_TFF_Present
     * @type {Integer (Int32)}
     */
    static Flag_RFF_TFF_Present => 262144

    /**
     * Native name: DXVA2_SampleFlagsMask
     * @type {Integer (Int32)}
     */
    static Mask => -65505
}
