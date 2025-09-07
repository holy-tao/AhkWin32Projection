#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the window dimensions of a render-target surface onto which a 3D volume projects.
 * @remarks
 * The X, Y, Width, and Height members describe the position and dimensions of the viewport on the render-target surface. Usually, applications render to the entire target surface; when rendering on a 640 x 480 surface, these members should be 0, 0, 640, and 480, respectively. The MinZ and MaxZ are typically set to 0.0 and 1.0 but can be set to other values to achieve specific effects. For example, you might set them both to 0.0 to force the system to render objects to the foreground of a scene, or both to 1.0 to force the objects into the background.
  * 
  * When the viewport parameters for a device change (because of a call to the [**SetViewport**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setviewport) method), the driver builds a new transformation matrix.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dviewport9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DVIEWPORT9 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Pixel coordinate of the upper-left corner of the viewport on the render-target surface. Unless you want to render to a subset of the surface, this member can be set to 0.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Pixel coordinate of the upper-left corner of the viewport on the render-target surface. Unless you want to render to a subset of the surface, this member can be set to 0.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width dimension of the clip volume, in pixels. Unless you are rendering only to a subset of the surface, this member should be set to the width dimension of the render-target surface.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height dimension of the clip volume, in pixels. Unless you are rendering only to a subset of the surface, this member should be set to the height dimension of the render-target surface.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: **float**
     * 
     * 
     * Together with MaxZ, value describing the range of depth values into which a scene is to be rendered, the minimum and maximum values of the clip volume. Most applications set this value to 0.0. Clipping is performed after applying the projection matrix.
     * @type {Float}
     */
    MinZ {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: **float**
     * 
     * 
     * Together with MinZ, value describing the range of depth values into which a scene is to be rendered, the minimum and maximum values of the clip volume. Most applications set this value to 1.0. Clipping is performed after applying the projection matrix.
     * @type {Float}
     */
    MaxZ {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
