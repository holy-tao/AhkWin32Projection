#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The HistogramDataHeader structure describes the blob format for the MF_CAPTURE_METADATA_HISTOGRAM attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-histogramdataheader
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct HistogramDataHeader {
    #StructPack 4

    /**
     * Size in bytes of this header + all following histogram data.
     */
    Size : UInt32

    /**
     * Mask of the color channel for the histogram data.
     */
    ChannelMask : UInt32

    /**
     * 1 if linear, 0 if nonlinear.
     */
    Linear : UInt32

}
