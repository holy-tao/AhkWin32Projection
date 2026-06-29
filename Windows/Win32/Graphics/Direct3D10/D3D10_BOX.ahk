#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a 3D box. (D3D10_BOX)
 * @remarks
 * The following diagram shows a 3D box, where the origin is the left, front, top corner.
 * 
 * <img alt="Diagram of a 3D box, where the origin is the left, front, top corner" src="./images/d3d10_box.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_box
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_BOX {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x position of the left hand side of the box.
     */
    left : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y position of the top of the box.
     */
    top : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z position of the front of the box.
     */
    front : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x position of the right hand side of the box.
     */
    right : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y position of the bottom of the box.
     */
    bottom : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z position of the back of the box.
     */
    back : UInt32

}
