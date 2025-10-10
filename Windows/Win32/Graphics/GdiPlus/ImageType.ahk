#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ImageType enumeration indicates whether an image is a bitmap or a metafile. The Image::GetType method returns an element of this enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-imagetype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ImageType{

    /**
     * Indicates that the image type is not known.
     * @type {Integer (Int32)}
     */
    static ImageTypeUnknown => 0

    /**
     * Indicates a bitmap image.
     * @type {Integer (Int32)}
     */
    static ImageTypeBitmap => 1

    /**
     * Indicates a metafile image.
     * @type {Integer (Int32)}
     */
    static ImageTypeMetafile => 2
}
