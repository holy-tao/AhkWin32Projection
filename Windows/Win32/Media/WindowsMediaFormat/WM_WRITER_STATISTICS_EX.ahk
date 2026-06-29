#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WM_WRITER_STATISTICS_EX structure is used by IWMWriterAdvanced3::GetStatisticsEx to obtain extended writer statistics.
 * @remarks
 * Sample rates are given in kilohertz.
 * 
 * Basic writer statistics are contained within a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_writer_statistics">WM_WRITER_STATISTICS</a> structure and must be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getstatistics">IWMWriterAdvanced::GetStatistics</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_writer_statistics_ex
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_WRITER_STATISTICS_EX {
    #StructPack 4

    /**
     * <b>DWORD</b> containing the bit rate plus any overhead.
     */
    dwBitratePlusOverhead : UInt32

    /**
     * <b>DWORD</b> containing the current rate at which samples are dropped in the queue in order to reduce demands on the CPU.
     */
    dwCurrentSampleDropRateInQueue : UInt32

    /**
     * <b>DWORD</b> containing the current rate at which samples are dropped in the codec. Samples can be dropped when they contain little new data. To prevent this from happening, call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced2-setinputsetting">IWMWriterAdvanced2::SetInputSetting</a> to set the g_wszFixedFrameRate setting to <b>TRUE</b>.
     */
    dwCurrentSampleDropRateInCodec : UInt32

    /**
     * <b>DWORD</b> containing the current rate at which samples are dropped in the multiplexer because they arrived late or overflowed the buffer window.
     */
    dwCurrentSampleDropRateInMultiplexer : UInt32

    /**
     * <b>DWORD</b> containing the total number of samples dropped in the queue.
     */
    dwTotalSampleDropsInQueue : UInt32

    /**
     * <b>DWORD</b> containing the total number of samples dropped in the codec.
     */
    dwTotalSampleDropsInCodec : UInt32

    /**
     * <b>DWORD</b> containing the total number of samples dropped in the multiplexer.
     */
    dwTotalSampleDropsInMultiplexer : UInt32

}
