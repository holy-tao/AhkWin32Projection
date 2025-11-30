#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DashStyle enumeration specifies the line style of a line drawn with a Windows GDI+ pen. The line can be drawn by using one of several predefined styles or a custom style.
 * @remarks
 * 
 * A custom dashed line is created by calling the 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdipluspen/nf-gdipluspen-pen-setdashpattern">Pen::SetDashPattern</a> method, which takes an array of values for the dash lengths and the space lengths.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-dashstyle
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class DashStyle extends Win32Enum{

    /**
     * Specifies a solid line.
     * @type {Integer (Int32)}
     */
    static DashStyleSolid => 0

    /**
     * Specifies a dashed line.
     * @type {Integer (Int32)}
     */
    static DashStyleDash => 1

    /**
     * Specifies a dotted line.
     * @type {Integer (Int32)}
     */
    static DashStyleDot => 2

    /**
     * Specifies an alternating dash-dot line.
     * @type {Integer (Int32)}
     */
    static DashStyleDashDot => 3

    /**
     * Specifies an alternating dash-dot-dot line.
     * @type {Integer (Int32)}
     */
    static DashStyleDashDotDot => 4

    /**
     * Specifies a user-defined, custom dashed line.
     * @type {Integer (Int32)}
     */
    static DashStyleCustom => 5
}
