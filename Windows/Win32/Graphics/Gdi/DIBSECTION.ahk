#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\BITMAP.ahk" { BITMAP }
#Import ".\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The DIBSECTION structure contains information about a DIB created by calling the CreateDIBSection function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-dibsection
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DIBSECTION {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a> data structure that contains information about the DIB: its type, its dimensions, its color capacities, and a pointer to its bit values.
     */
    dsBm : BITMAP

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure that contains information about the color format of the DIB.
     */
    dsBmih : BITMAPINFOHEADER

    /**
     * Specifies three color masks for the DIB. This field is only valid when the <b>BitCount</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure has a value greater than 8. Each color mask indicates the bits that are used to encode one of the three color channels (red, green, and blue).
     */
    dsBitfields : UInt32[3]

    /**
     * Contains a handle to the file mapping object that the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a> function used to create the DIB. 
     * 			 If <b>CreateDIBSection</b> was called with a <b>NULL</b> value for its <i>hSection</i> parameter, 
     * 			 causing the system to allocate memory for the bitmap, the <i>dshSection</i> member will be <b>NULL</b>.
     */
    dshSection : HANDLE

    /**
     * The offset to the bitmap's bit values within the file mapping object referenced by <i>dshSection</i>. 
     * 			 If <i>dshSection</i> is <b>NULL</b>, the <i>dsOffset</i> value has no meaning.
     */
    dsOffset : UInt32

}
