#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a rectangle for Windows Imaging Component (WIC) API.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicrect
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICRect {
    #StructPack 4

    /**
     * Type: <b>INT</b>
     * 
     * The horizontal coordinate of the rectangle.
     */
    X : Int32

    /**
     * Type: <b>INT</b>
     * 
     * The vertical coordinate of the rectangle.
     */
    Y : Int32

    /**
     * Type: <b>INT</b>
     * 
     * The width of the rectangle.
     */
    Width : Int32

    /**
     * Type: <b>INT</b>
     * 
     * The height of the rectangle.
     */
    Height : Int32

}
