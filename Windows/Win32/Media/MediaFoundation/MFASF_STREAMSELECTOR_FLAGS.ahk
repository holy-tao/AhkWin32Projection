#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the ASF stream selector options.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ne-wmcontainer-mfasf_streamselector_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFASF_STREAMSELECTOR_FLAGS extends Win32Enum{

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
