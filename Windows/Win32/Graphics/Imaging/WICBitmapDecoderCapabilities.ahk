#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the capabilities of the decoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmapdecodercapabilities
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapDecoderCapabilities{

    /**
     * Decoder recognizes the image was encoded with an encoder produced by the same vendor.
     * @type {Integer (Int32)}
     */
    static WICBitmapDecoderCapabilitySameEncoder => 1

    /**
     * Decoder can decode all the images within an image container.
     * @type {Integer (Int32)}
     */
    static WICBitmapDecoderCapabilityCanDecodeAllImages => 2

    /**
     * Decoder can decode some of the images within an image container.
     * @type {Integer (Int32)}
     */
    static WICBitmapDecoderCapabilityCanDecodeSomeImages => 4

    /**
     * Decoder can enumerate the metadata blocks within a container format.
     * @type {Integer (Int32)}
     */
    static WICBitmapDecoderCapabilityCanEnumerateMetadata => 8

    /**
     * Decoder can find and decode a thumbnail.
     * @type {Integer (Int32)}
     */
    static WICBitmapDecoderCapabilityCanDecodeThumbnail => 16
}
