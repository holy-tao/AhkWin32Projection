#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CIEXYZ structure contains the x,y, and z coordinates of a specific color in a specified color space.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-ciexyz
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct CIEXYZ {
    #StructPack 4

    /**
     * The x coordinate in fix point (2.30).
     */
    ciexyzX : Int32

    /**
     * The y coordinate in fix point (2.30).
     */
    ciexyzY : Int32

    /**
     * The z coordinate in fix point (2.30).
     */
    ciexyzZ : Int32

}
