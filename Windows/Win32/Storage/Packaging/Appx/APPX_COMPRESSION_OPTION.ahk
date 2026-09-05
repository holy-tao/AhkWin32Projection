#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the degree of compression used to store the file in the package.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_compression_option
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class APPX_COMPRESSION_OPTION extends Win32Enum {

    /**
     * No compression.
     * Native name: APPX_COMPRESSION_OPTION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Normal  compression.
     * Native name: APPX_COMPRESSION_OPTION_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 1

    /**
     * Maximum compression.
     * Native name: APPX_COMPRESSION_OPTION_MAXIMUM
     * @type {Integer (Int32)}
     */
    static MAXIMUM => 2

    /**
     * Fast compression.
     * Native name: APPX_COMPRESSION_OPTION_FAST
     * @type {Integer (Int32)}
     */
    static FAST => 3

    /**
     * Super-fast compression.
     * Native name: APPX_COMPRESSION_OPTION_SUPERFAST
     * @type {Integer (Int32)}
     */
    static SUPERFAST => 4
}
