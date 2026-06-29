#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the ASF multiplexer options.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ne-wmcontainer-mfasf_multiplexerflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFASF_MULTIPLEXERFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The multiplexer automatically adjusts the bit rate of the ASF content in response to the characteristics of the streams being multiplexed.
     * @type {Integer (Int32)}
     */
    static MFASF_MULTIPLEXER_AUTOADJUST_BITRATE => 1
}
