#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the color and usage of an entry in a logical palette.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-paletteentry
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct PALETTEENTRY {
    #StructPack 1

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The red intensity value for the palette entry.
     */
    peRed : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The green intensity value for the palette entry.
     */
    peGreen : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The blue intensity value for the palette entry.
     */
    peBlue : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The alpha intensity value for the palette entry. Note that as of DirectX 8, this member is treated differently than documented for Windows.
     */
    peFlags : Int8

}
