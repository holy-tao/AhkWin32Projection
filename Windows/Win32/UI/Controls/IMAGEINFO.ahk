#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * Contains information about an image in an image list. This structure is used with the IImageList::GetImageInfo function. (IMAGEINFO)
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-imageinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct IMAGEINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the images.
     */
    hbmImage : HBITMAP

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to a monochrome bitmap that contains the masks for the images. If the image list does not contain a mask, this member is <b>NULL</b>.
     */
    hbmMask : HBITMAP

    /**
     * Type: <b>int</b>
     * 
     * Not used. This member should always be zero.
     */
    Unused1 : Int32

    /**
     * Type: <b>int</b>
     * 
     * Not used. This member should always be zero.
     */
    Unused2 : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The bounding rectangle of the specified image within the bitmap specified by 
     * 					<b>hbmImage</b>.
     */
    rcImage : RECT

}
