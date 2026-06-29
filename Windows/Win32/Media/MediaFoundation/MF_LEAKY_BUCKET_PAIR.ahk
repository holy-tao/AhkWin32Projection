#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the buffering requirements of a file.
 * @remarks
 * This structure describes the buffering requirements for content encoded at the bit rate specified in the <b>dwBitrate</b>. The <b>msBufferWindow</b> member indicates how much data should be buffered before starting playback. The size of the buffer in bytes is <b>msBufferWinow</b>×<b>dwBitrate</b> / 8000.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mf_leaky_bucket_pair
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_LEAKY_BUCKET_PAIR {
    #StructPack 4

    /**
     * Bit rate, in bits per second.
     */
    dwBitrate : UInt32

    /**
     * Size of the buffer window, in milliseconds.
     */
    msBufferWindow : UInt32

}
