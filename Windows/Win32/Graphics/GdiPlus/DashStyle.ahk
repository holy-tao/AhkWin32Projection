#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class DashStyle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleSolid => 0

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleDash => 1

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleDot => 2

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleDashDot => 3

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleDashDotDot => 4

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleCustom => 5
}
