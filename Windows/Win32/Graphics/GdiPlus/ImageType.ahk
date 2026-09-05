#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type that contains the binary information for an image in a Journal note.
 * @see https://learn.microsoft.com/windows/win32/tablet/imagetype-complex-type
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ImageType extends Win32Enum {

    /**
     * Native name: ImageTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: ImageTypeBitmap
     * @type {Integer (Int32)}
     */
    static Bitmap => 1

    /**
     * Native name: ImageTypeMetafile
     * @type {Integer (Int32)}
     */
    static Metafile => 2
}
