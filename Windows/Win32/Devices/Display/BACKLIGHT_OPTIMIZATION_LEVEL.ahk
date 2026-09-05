#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class BACKLIGHT_OPTIMIZATION_LEVEL extends Win32Enum {

    /**
     * Native name: BacklightOptimizationDisable
     * @type {Integer (Int32)}
     */
    static Disable => 0

    /**
     * Native name: BacklightOptimizationDesktop
     * @type {Integer (Int32)}
     */
    static Desktop => 1

    /**
     * Native name: BacklightOptimizationDynamic
     * @type {Integer (Int32)}
     */
    static Dynamic => 2

    /**
     * Native name: BacklightOptimizationDimmed
     * @type {Integer (Int32)}
     */
    static Dimmed => 3

    /**
     * Native name: BacklightOptimizationEDR
     * @type {Integer (Int32)}
     */
    static OptimizationEDR => 4
}
