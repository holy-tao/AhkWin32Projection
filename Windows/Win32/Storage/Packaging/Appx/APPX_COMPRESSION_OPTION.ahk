#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the degree of compression used to store the file in the package.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ne-appxpackaging-appx_compression_option
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_COMPRESSION_OPTION{

    /**
     * No compression.
     * @type {Integer (Int32)}
     */
    static APPX_COMPRESSION_OPTION_NONE => 0

    /**
     * Normal  compression.
     * @type {Integer (Int32)}
     */
    static APPX_COMPRESSION_OPTION_NORMAL => 1

    /**
     * Maximum compression.
     * @type {Integer (Int32)}
     */
    static APPX_COMPRESSION_OPTION_MAXIMUM => 2

    /**
     * Fast compression.
     * @type {Integer (Int32)}
     */
    static APPX_COMPRESSION_OPTION_FAST => 3

    /**
     * Super-fast compression.
     * @type {Integer (Int32)}
     */
    static APPX_COMPRESSION_OPTION_SUPERFAST => 4
}
