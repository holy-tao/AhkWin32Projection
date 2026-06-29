#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WM_LEAKY_BUCKET_PAIR structure describes the buffering requirements for a VBR file. This structure is used with the ASFLeakyBucketPairs attribute.
 * @remarks
 * The <b>ASFLeakyBucketPairs</b> attribute gives a list of bit rates and corresponding buffer windows. For each bit rate, the <b>msBufferWindow</b> member indicates how much content the reader object will buffer before it begins playback. The size of the buffer in bytes equals <b>msBufferWindow</b> x <b>dwBitrate</b> / 8000.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_leaky_bucket_pair
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_LEAKY_BUCKET_PAIR {
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
