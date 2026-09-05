#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class DashStyle extends Win32Enum {

    /**
     * Native name: DashStyleSolid
     * @type {Integer (Int32)}
     */
    static Solid => 0

    /**
     * Native name: DashStyleDash
     * @type {Integer (Int32)}
     */
    static Dash => 1

    /**
     * Native name: DashStyleDot
     * @type {Integer (Int32)}
     */
    static Dot => 2

    /**
     * Native name: DashStyleDashDot
     * @type {Integer (Int32)}
     */
    static DashDot => 3

    /**
     * Native name: DashStyleDashDotDot
     * @type {Integer (Int32)}
     */
    static DashDotDot => 4

    /**
     * Native name: DashStyleCustom
     * @type {Integer (Int32)}
     */
    static Custom => 5
}
