#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of Windows Imaging Component (WIC) component.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wiccomponenttype
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICComponentType extends Win32Enum {

    /**
     * A WIC decoder.
     * Native name: WICDecoder
     * @type {Integer (Int32)}
     */
    static Decoder => 1

    /**
     * A WIC encoder.
     * Native name: WICEncoder
     * @type {Integer (Int32)}
     */
    static Encoder => 2

    /**
     * A WIC pixel converter.
     * Native name: WICPixelFormatConverter
     * @type {Integer (Int32)}
     */
    static PixelFormatConverter => 4

    /**
     * A WIC metadata reader.
     * Native name: WICMetadataReader
     * @type {Integer (Int32)}
     */
    static MetadataReader => 8

    /**
     * A WIC metadata writer.
     * Native name: WICMetadataWriter
     * @type {Integer (Int32)}
     */
    static MetadataWriter => 16

    /**
     * A WIC pixel format.
     * Native name: WICPixelFormat
     * @type {Integer (Int32)}
     */
    static PixelFormat => 32

    /**
     * All WIC components.
     * Native name: WICAllComponents
     * @type {Integer (Int32)}
     */
    static AllComponents => 63
}
