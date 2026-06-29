#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WM_WRITER_STATISTICS structure describes the performance of a writing operation.
 * @remarks
 * Sample rates are specified in kilohertz. For instance, a sample rate of 8 indicates 8000 samples per second.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_writer_statistics
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_WRITER_STATISTICS {
    #StructPack 8

    /**
     * <b>QWORD</b> containing the sample count.
     */
    qwSampleCount : Int64

    /**
     * <b>QWORD</b> containing the byte count.
     */
    qwByteCount : Int64

    /**
     * <b>QWORD</b> containing the dropped sample count.
     */
    qwDroppedSampleCount : Int64

    /**
     * <b>QWORD</b> containing the dropped byte count.
     */
    qwDroppedByteCount : Int64

    /**
     * <b>DWORD</b> containing the current bit rate.
     */
    dwCurrentBitrate : UInt32

    /**
     * <b>DWORD</b> containing the average bit rate.
     */
    dwAverageBitrate : UInt32

    /**
     * <b>DWORD</b> containing the expected bit rate.
     */
    dwExpectedBitrate : UInt32

    /**
     * <b>DWORD</b> containing the current sample rate.
     */
    dwCurrentSampleRate : UInt32

    /**
     * <b>DWORD</b> containing the average sample rate.
     */
    dwAverageSampleRate : UInt32

    /**
     * <b>DWORD</b> containing the expected sample rate.
     */
    dwExpectedSampleRate : UInt32

}
