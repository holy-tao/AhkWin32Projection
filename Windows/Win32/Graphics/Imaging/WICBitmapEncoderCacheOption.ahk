#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the cache options available for an encoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmapencodercacheoption
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapEncoderCacheOption extends Win32Enum {

    /**
     * The encoder is cached in memory. This option is not supported.
     * Native name: WICBitmapEncoderCacheInMemory
     * @type {Integer (Int32)}
     */
    static InMemory => 0

    /**
     * The encoder is cached to a temporary file. This option is not supported.
     * Native name: WICBitmapEncoderCacheTempFile
     * @type {Integer (Int32)}
     */
    static TempFile => 1

    /**
     * The encoder is not cached.
     * Native name: WICBitmapEncoderNoCache
     * @type {Integer (Int32)}
     */
    static NoCache => 2
}
