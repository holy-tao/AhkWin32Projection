#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type that contains the binary information for an image in a Journal note.
 * @see https://learn.microsoft.com/windows/win32/tablet/imagetype-complex-type
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ImageType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ImageTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ImageTypeBitmap => 1

    /**
     * @type {Integer (Int32)}
     */
    static ImageTypeMetafile => 2
}
