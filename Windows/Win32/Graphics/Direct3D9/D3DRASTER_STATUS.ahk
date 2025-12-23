#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the raster status.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3draster-status
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DRASTER_STATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[**BOOL**](../winprog/windows-data-types.md)**
     * @type {BOOL}
     */
    InVBlank {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * If InVBlank is **FALSE**, then this value is an integer roughly corresponding to the current scan line painted by the raster. Scan lines are numbered in the same way as Direct3D surface coordinates: 0 is the top of the primary surface, extending to the value (height of the surface - 1) at the bottom of the display.
     * 
     * If InVBlank is **TRUE**, then this value is set to zero and can be ignored.
     * @type {Integer}
     */
    ScanLine {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
