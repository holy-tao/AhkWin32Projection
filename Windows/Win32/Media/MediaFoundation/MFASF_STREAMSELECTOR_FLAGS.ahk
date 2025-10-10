#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the ASF stream selector options.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/ne-wmcontainer-mfasf_streamselector_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFASF_STREAMSELECTOR_FLAGS{

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
