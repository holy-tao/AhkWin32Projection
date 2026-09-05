#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_OUTPUT_WIRE_COLOR_SPACE_TYPE extends Win32Enum {

    /**
     * Native name: D3DDDI_OUTPUT_WIRE_COLOR_SPACE_G22_P709
     * @type {Integer (Int32)}
     */
    static G22_P709 => 0

    /**
     * Native name: D3DDDI_OUTPUT_WIRE_COLOR_SPACE_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 4

    /**
     * Native name: D3DDDI_OUTPUT_WIRE_COLOR_SPACE_G2084_P2020
     * @type {Integer (Int32)}
     */
    static G2084_P2020 => 12

    /**
     * Native name: D3DDDI_OUTPUT_WIRE_COLOR_SPACE_G22_P709_WCG
     * @type {Integer (Int32)}
     */
    static G22_P709_WCG => 30

    /**
     * Native name: D3DDDI_OUTPUT_WIRE_COLOR_SPACE_G22_P2020
     * @type {Integer (Int32)}
     */
    static G22_P2020 => 31

    /**
     * Native name: D3DDDI_OUTPUT_WIRE_COLOR_SPACE_G2084_P2020_HDR10PLUS
     * @type {Integer (Int32)}
     */
    static G2084_P2020_HDR10PLUS => 32

    /**
     * Native name: D3DDDI_OUTPUT_WIRE_COLOR_SPACE_G2084_P2020_DVLL
     * @type {Integer (Int32)}
     */
    static G2084_P2020_DVLL => 33
}
