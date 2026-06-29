#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CIEXYZ.ahk" { CIEXYZ }

/**
 * The CIEXYZTRIPLE structure contains the x,y, and z coordinates of the three colors that correspond to the red, green, and blue endpoints for a specified logical color space.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-ciexyztriple
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct CIEXYZTRIPLE {
    #StructPack 4

    /**
     * The xyz coordinates of red endpoint.
     */
    ciexyzRed : CIEXYZ

    /**
     * The xyz coordinates of green endpoint.
     */
    ciexyzGreen : CIEXYZ

    /**
     * The xyz coordinates of blue endpoint.
     */
    ciexyzBlue : CIEXYZ

}
