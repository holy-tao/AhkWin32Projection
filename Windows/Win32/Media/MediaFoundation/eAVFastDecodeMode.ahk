#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the video decoding speed. This enumeration is used with the AVDecVideoFastDecodeMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavfastdecodemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVFastDecodeMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use normal decoding.
     * @type {Integer (Int32)}
     */
    static eVideoDecodeCompliant => 0

    /**
     * Use the optimal loop filter.
     * @type {Integer (Int32)}
     */
    static eVideoDecodeOptimalLF => 1

    /**
     * Disable the loop filter.
     * @type {Integer (Int32)}
     */
    static eVideoDecodeDisableLF => 2

    /**
     * Use the fastest decoding mode.
     * @type {Integer (Int32)}
     */
    static eVideoDecodeFastest => 32
}
