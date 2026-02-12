#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how tiling should occur in the U and V axis in order to fill the overall requested area of a texture.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtextureedgebehavior
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DTextureEdgeBehavior extends Win32Enum{

    /**
     * No tiling will occur.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Tiles repeat the texture resource at every integer junction. For example, with texture coordinates of (0.0,0.0), (0.0,3.0), (3.0,3.0), and (3.0,0.0), setting the **Wrap** texture edge behavior results in the texture being applied three times in both the u-and v-directions, as shown here.<img alt="Illustration of a face texture wrapped in the u-direction and the v-direction" src="images/wrap.png" />
     * @type {Integer (Int32)}
     */
    static Wrap => 1

    /**
     * Tiles mirror the texture at every integer boundary. For example, with texture coordinates of (0.0,0.0), (0.0,3.0), (3.0,3.0), and (3.0,0.0). Setting the **Wrap** texture edge behavior results in the texture being applied three times in both the u- and v-directions. Every other row and column that it is applied is a mirror image of the preceding row or column, as shown here. <img alt="Illustration of mirror images in a 3x3 grid" src="images/mirror.png" />
     * @type {Integer (Int32)}
     */
    static Mirror => 2

    /**
     * Clamps texture coordinates to the [0.0, 1.0] range. That is, it applies the texture once, then smears the color of edge pixels. For example, suppose that your application creates a square primitive and assigns texture coordinates of (0.0,0.0), (0.0,3.0), (3.0,3.0), and (3.0,0.0) to the primitive's vertices. Setting the **Clamp** texture edge behavior results in the texture being applied once. The pixel colors at the top of the columns and the end of the rows are extended to the top and right of the primitive respectively, as shown here.<img alt="Illustration of a texture and clamped texture." src="images/clamp.png" />
     * @type {Integer (Int32)}
     */
    static Clamp => 3
}
