#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the input operations for which visual feedback should be provided.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_showcontact
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_SHOWCONTACT extends Win32BitflagEnum{

    /**
     * Down.
     * @type {Integer (UInt32)}
     */
    static DWMSC_DOWN => 1

    /**
     * Up.
     * @type {Integer (UInt32)}
     */
    static DWMSC_UP => 2

    /**
     * Drag.
     * @type {Integer (UInt32)}
     */
    static DWMSC_DRAG => 4

    /**
     * Hold.
     * @type {Integer (UInt32)}
     */
    static DWMSC_HOLD => 8

    /**
     * Pen barrel.
     * @type {Integer (UInt32)}
     */
    static DWMSC_PENBARREL => 16

    /**
     * None.
     * @type {Integer (UInt32)}
     */
    static DWMSC_NONE => 0

    /**
     * All.
     * @type {Integer (UInt32)}
     */
    static DWMSC_ALL => 4294967295
}
