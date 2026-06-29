#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the cache options available for an encoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmapencodercacheoption
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapEncoderCacheOption {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The encoder is cached in memory. This option is not supported.
     * @type {Integer (Int32)}
     */
    static WICBitmapEncoderCacheInMemory => 0

    /**
     * The encoder is cached to a temporary file. This option is not supported.
     * @type {Integer (Int32)}
     */
    static WICBitmapEncoderCacheTempFile => 1

    /**
     * The encoder is not cached.
     * @type {Integer (Int32)}
     */
    static WICBitmapEncoderNoCache => 2
}
