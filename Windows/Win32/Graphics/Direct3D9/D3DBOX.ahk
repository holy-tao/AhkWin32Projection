#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a volume.
 * @remarks
 * **D3DBOX** includes the left, top, and front edges; however, the right, bottom, and back edges are not included. For example, a box that is 100 units wide and begins at 0 (thus, including the points up to and including 99) would be expressed with a value of 0 for the Left member and a value of 100 for the Right member. Note that a value of 99 is not used for the Right member.
 * 
 * The restrictions on side ordering observed for **D3DBOX** are left to right, top to bottom, and front to back.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dbox
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DBOX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the left side of the box on the x-axis.
     * @type {Integer}
     */
    Left {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the top of the box on the y-axis.
     * @type {Integer}
     */
    Top {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the right side of the box on the x-axis.
     * @type {Integer}
     */
    Right {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the bottom of the box on the y-axis.
     * @type {Integer}
     */
    Bottom {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the front of the box on the z-axis.
     * @type {Integer}
     */
    Front {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the back of the box on the z-axis.
     * @type {Integer}
     */
    Back {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
