#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a volume.
 * @remarks
 * **D3DBOX** includes the left, top, and front edges; however, the right, bottom, and back edges are not included. For example, a box that is 100 units wide and begins at 0 (thus, including the points up to and including 99) would be expressed with a value of 0 for the Left member and a value of 100 for the Right member. Note that a value of 99 is not used for the Right member.
 * 
 * The restrictions on side ordering observed for **D3DBOX** are left to right, top to bottom, and front to back.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dbox
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DBOX {
    #StructPack 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the left side of the box on the x-axis.
     */
    Left : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the top of the box on the y-axis.
     */
    Top : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the right side of the box on the x-axis.
     */
    Right : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the bottom of the box on the y-axis.
     */
    Bottom : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the front of the box on the z-axis.
     */
    Front : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Position of the back of the box on the z-axis.
     */
    Back : UInt32

}
