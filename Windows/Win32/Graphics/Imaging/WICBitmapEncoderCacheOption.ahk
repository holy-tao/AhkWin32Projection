#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the cache options available for an encoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmapencodercacheoption
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapEncoderCacheOption{

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
