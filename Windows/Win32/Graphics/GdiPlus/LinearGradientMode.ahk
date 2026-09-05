#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class LinearGradientMode extends Win32Enum {

    /**
     * Native name: LinearGradientModeHorizontal
     * @type {Integer (Int32)}
     */
    static Horizontal => 0

    /**
     * Native name: LinearGradientModeVertical
     * @type {Integer (Int32)}
     */
    static Vertical => 1

    /**
     * Native name: LinearGradientModeForwardDiagonal
     * @type {Integer (Int32)}
     */
    static ForwardDiagonal => 2

    /**
     * Native name: LinearGradientModeBackwardDiagonal
     * @type {Integer (Int32)}
     */
    static BackwardDiagonal => 3
}
