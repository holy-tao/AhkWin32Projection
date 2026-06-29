#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WIA\_RAW\_HEADER structure defines an image in the RAW data format of a device and enables applications to use RAW format in Windows Image Acquisition (WIA) transfers.
 * @remarks
 * Because this is not a file format, use an empty string for the WIA\_IPA\_FILE\_EXTENSION property.
 * 
 * The palette and the data can come in either order.
 * 
 * **RawDataSize** does not include either the header or the palette. Use this field to verify that the transfer of the image has been successful.
 * 
 * **PaletteSize** is bytes, not the number of entries in the palette.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-wia-raw-header
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_RAW_HEADER {
    #StructPack 4

    /**
     * Type: **DWORD**
     * 
     * 
     * The name of the format. This must be the literal 'WRAW' (four single byte ASCII characters).
     */
    Tag : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The version of the RAW format. Always use 0x00010000.
     */
    Version : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The total valid bytes in the header.
     */
    HeaderSize : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The horizontal resolution in dots per inch.
     */
    XRes : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The vertical resolution in dots per inch.
     */
    YRes : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The width of the image in pixels.
     */
    XExtent : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The height of the image in pixels.
     */
    YExtent : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The number of bytes in a line of an uncompressed image. Use 0 when the data is compressed to signal that the number of bytes per line is unknown.
     */
    BytesPerLine : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The total number of bits per pixel for all the pixel's channels.
     */
    BitsPerPixel : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The number of color channels in a pixel.
     */
    ChannelsPerPixel : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The WIA\_IPA\_DATATYPE of the image. Since WIA\_IPA\_FORMAT is set to WiaImgFmt\_RAW, this is a list of allowed values from which the application picks.
     * 
     * 
     * **BitsPerChannel\[8\]**
     * 
     * Type: **BYTE**
     * 
     * 
     * The number of bits in a channel, up to a maximum of 8.
     */
    DataType : UInt32

    BitsPerChannel : Int8[8]

    /**
     * Type: **DWORD**
     * 
     * 
     * A WIA\_IPA\_COMPRESSION value specifying the type of compression used, if any.
     */
    Compression : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * A WIA\_IPA\_PHOTOMETRIC\_INTERP value specifying the photometric interpretation of the image.
     */
    PhotometricInterp : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * A value representing the image line order. This is always either WIA\_LINE\_ORDER\_TOP\_TO\_BOTTOM or WIA\_LINE\_ORDER\_BOTTOM\_TO\_TOP.
     */
    LineOrder : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The position of the raw image data in bytes, starting from position where the header ends or the position where the palette ends.
     */
    RawDataOffset : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The size, in bytes, of the raw image data.
     */
    RawDataSize : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The position of the palette in bytes, starting from the position where the header ends or the position where the data ends. (This value is 0, if there is no palette.)
     */
    PaletteOffset : UInt32

    /**
     * Type: **DWORD**
     * 
     * 
     * The size, in bytes, of the palette table. (This is 0, if there is no palette.)
     */
    PaletteSize : UInt32

}
