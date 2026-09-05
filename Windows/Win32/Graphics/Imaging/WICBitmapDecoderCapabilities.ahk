#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the capabilities of the decoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmapdecodercapabilities
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapDecoderCapabilities extends Win32Enum {

    /**
     * Decoder recognizes the image was encoded with an encoder produced by the same vendor.
     * Native name: WICBitmapDecoderCapabilitySameEncoder
     * @type {Integer (Int32)}
     */
    static CapabilitySameEncoder => 1

    /**
     * Decoder can decode all the images within an image container.
     * Native name: WICBitmapDecoderCapabilityCanDecodeAllImages
     * @type {Integer (Int32)}
     */
    static CapabilityCanDecodeAllImages => 2

    /**
     * Decoder can decode some of the images within an image container.
     * Native name: WICBitmapDecoderCapabilityCanDecodeSomeImages
     * @type {Integer (Int32)}
     */
    static CapabilityCanDecodeSomeImages => 4

    /**
     * Decoder can enumerate the metadata blocks within a container format.
     * Native name: WICBitmapDecoderCapabilityCanEnumerateMetadata
     * @type {Integer (Int32)}
     */
    static CapabilityCanEnumerateMetadata => 8

    /**
     * Decoder can find and decode a thumbnail.
     * Native name: WICBitmapDecoderCapabilityCanDecodeThumbnail
     * @type {Integer (Int32)}
     */
    static CapabilityCanDecodeThumbnail => 16
}
