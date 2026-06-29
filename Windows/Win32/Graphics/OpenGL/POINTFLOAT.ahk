#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The POINTFLOAT structure contains the x and y coordinates of a point.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-pointfloat
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct POINTFLOAT {
    #StructPack 4

    /**
     * Specifies the horizontal (x) coordinate of a point.
     */
    x : Float32

    /**
     * Specifies the vertical (y) coordinate of a point.
     */
    y : Float32

}
