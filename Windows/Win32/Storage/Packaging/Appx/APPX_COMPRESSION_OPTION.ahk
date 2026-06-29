#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the degree of compression used to store the file in the package.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_compression_option
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_COMPRESSION_OPTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
