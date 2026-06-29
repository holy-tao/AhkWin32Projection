#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Creates a D2D1_SIZE_F structure that contains the specified width and height.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-sizef
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct SizeF {
    #StructPack 4

    Width : Float32

    Height : Float32

}
