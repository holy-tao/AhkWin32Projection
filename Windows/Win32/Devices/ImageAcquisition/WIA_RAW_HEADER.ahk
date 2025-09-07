#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class WIA_RAW_HEADER extends Win32Struct
{
    static sizeof => 80

    static packingSize => 4

    /**
     * Type: **DWORD**
     * 
     * 
     * The name of the format. This must be the literal 'WRAW' (four single byte ASCII characters).
     * @type {Integer}
     */
    Tag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The version of the RAW format. Always use 0x00010000.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The total valid bytes in the header.
     * @type {Integer}
     */
    HeaderSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The horizontal resolution in dots per inch.
     * @type {Integer}
     */
    XRes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The vertical resolution in dots per inch.
     * @type {Integer}
     */
    YRes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The width of the image in pixels.
     * @type {Integer}
     */
    XExtent {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The height of the image in pixels.
     * @type {Integer}
     */
    YExtent {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The number of bytes in a line of an uncompressed image. Use 0 when the data is compressed to signal that the number of bytes per line is unknown.
     * @type {Integer}
     */
    BytesPerLine {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The total number of bits per pixel for all the pixel's channels.
     * @type {Integer}
     */
    BitsPerPixel {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The number of color channels in a pixel.
     * @type {Integer}
     */
    ChannelsPerPixel {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

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
     * @type {Integer}
     */
    DataType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Array<Byte>}
     */
    BitsPerChannel{
        get {
            if(!this.HasProp("__BitsPerChannelProxyArray"))
                this.__BitsPerChannelProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__BitsPerChannelProxyArray
        }
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * A WIA\_IPA\_COMPRESSION value specifying the type of compression used, if any.
     * @type {Integer}
     */
    Compression {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * A WIA\_IPA\_PHOTOMETRIC\_INTERP value specifying the photometric interpretation of the image.
     * @type {Integer}
     */
    PhotometricInterp {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * A value representing the image line order. This is always either WIA\_LINE\_ORDER\_TOP\_TO\_BOTTOM or WIA\_LINE\_ORDER\_BOTTOM\_TO\_TOP.
     * @type {Integer}
     */
    LineOrder {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The position of the raw image data in bytes, starting from position where the header ends or the position where the palette ends.
     * @type {Integer}
     */
    RawDataOffset {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The size, in bytes, of the raw image data.
     * @type {Integer}
     */
    RawDataSize {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The position of the palette in bytes, starting from the position where the header ends or the position where the data ends. (This value is 0, if there is no palette.)
     * @type {Integer}
     */
    PaletteOffset {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The size, in bytes, of the palette table. (This is 0, if there is no palette.)
     * @type {Integer}
     */
    PaletteSize {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}
