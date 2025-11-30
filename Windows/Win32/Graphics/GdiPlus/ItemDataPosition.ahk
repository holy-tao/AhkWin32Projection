#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ItemDataPosition enumeration is used to specify the location of custom metadata in an image file.
 * @remarks
 * 
 * GDI+ supports custom metadata for JPEG, PNG, and GIF image files.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/ne-gdiplusimaging-itemdataposition
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ItemDataPosition extends Win32Enum{

    /**
     * Specifies that custom metadata is stored after the file header. Valid for JPEG, PNG, and GIF.
     * @type {Integer (Int32)}
     */
    static ItemDataPositionAfterHeader => 0

    /**
     * Specifies that custom metadata is stored after the palette. Valid for PNG.
     * @type {Integer (Int32)}
     */
    static ItemDataPositionAfterPalette => 1

    /**
     * Specifies that custom metadata is stored after the pixel data. Valid for GIF and PNG.
     * @type {Integer (Int32)}
     */
    static ItemDataPositionAfterBits => 2
}
