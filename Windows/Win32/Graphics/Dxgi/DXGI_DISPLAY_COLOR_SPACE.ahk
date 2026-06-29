#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Don't use this structure; it is not supported and it will be removed from the header in a future release.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_display_color_space
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_DISPLAY_COLOR_SPACE {
    #StructPack 4

    /**
     * The primary coordinates, as an 8 by 2 array of FLOAT values.
     */
    PrimaryCoordinates : Float32[16]

    /**
     * The white points, as a 16 by 2 array of FLOAT values.
     */
    WhitePoints : Float32[32]

}
