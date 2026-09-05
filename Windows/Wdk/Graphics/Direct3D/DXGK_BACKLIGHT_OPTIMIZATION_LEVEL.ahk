#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_BACKLIGHT_OPTIMIZATION_LEVEL extends Win32Enum {

    /**
     * Native name: DxgkBacklightOptimizationDisable
     * @type {Integer (Int32)}
     */
    static Disable => 0

    /**
     * Native name: DxgkBacklightOptimizationDesktop
     * @type {Integer (Int32)}
     */
    static Desktop => 1

    /**
     * Native name: DxgkBacklightOptimizationDynamic
     * @type {Integer (Int32)}
     */
    static Dynamic => 2

    /**
     * Native name: DxgkBacklightOptimizationDimmed
     * @type {Integer (Int32)}
     */
    static Dimmed => 3

    /**
     * Native name: DxgkBacklightOptimizationEDR
     * @type {Integer (Int32)}
     */
    static OptimizationEDR => 4
}
