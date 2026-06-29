#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the raster status.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3draster-status
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DRASTER_STATUS {
    #StructPack 4

    /**
     * Type: **[**BOOL**](../winprog/windows-data-types.md)**
     */
    InVBlank : BOOL

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * If InVBlank is **FALSE**, then this value is an integer roughly corresponding to the current scan line painted by the raster. Scan lines are numbered in the same way as Direct3D surface coordinates: 0 is the top of the primary surface, extending to the value (height of the surface - 1) at the bottom of the display.
     * 
     * If InVBlank is **TRUE**, then this value is set to zero and can be ignored.
     */
    ScanLine : UInt32

}
