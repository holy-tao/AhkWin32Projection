#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the ASF stream selector options.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ne-wmcontainer-mfasf_streamselector_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFASF_STREAMSELECTOR_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The stream selector will not set thinning. Thinning is the process of removing samples from a stream to reduce the bit rate.
     * @type {Integer (Int32)}
     */
    static MFASF_STREAMSELECTOR_DISABLE_THINNING => 1

    /**
     * The stream selector will use the average bit rate of streams when selecting streams.
     * @type {Integer (Int32)}
     */
    static MFASF_STREAMSELECTOR_USE_AVERAGE_BITRATE => 2
}
