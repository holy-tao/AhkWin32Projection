#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the capabilities of the decoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmapdecodercapabilities
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapDecoderCapabilities {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
