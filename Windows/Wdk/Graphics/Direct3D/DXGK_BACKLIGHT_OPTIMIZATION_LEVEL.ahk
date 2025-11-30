#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_BACKLIGHT_OPTIMIZATION_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DxgkBacklightOptimizationDisable => 0

    /**
     * @type {Integer (Int32)}
     */
    static DxgkBacklightOptimizationDesktop => 1

    /**
     * @type {Integer (Int32)}
     */
    static DxgkBacklightOptimizationDynamic => 2

    /**
     * @type {Integer (Int32)}
     */
    static DxgkBacklightOptimizationDimmed => 3

    /**
     * @type {Integer (Int32)}
     */
    static DxgkBacklightOptimizationEDR => 4
}
