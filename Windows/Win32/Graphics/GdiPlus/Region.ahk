#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RegionChange method displays a system dialog box that enables the user to change the region associated with the DVD drive.
 * @remarks
 * The region for a DVD drive can be changed only five times.
 * @see https://learn.microsoft.com/windows/win32/DirectShow/regionchange-method
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Region extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
