#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_WRITER_STATISTICS_EX structure is used by IWMWriterAdvanced3::GetStatisticsEx to obtain extended writer statistics.
 * @remarks
 * Sample rates are given in kilohertz.
  * 
  * Basic writer statistics are contained within a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_writer_statistics">WM_WRITER_STATISTICS</a> structure and must be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getstatistics">IWMWriterAdvanced::GetStatistics</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_writer_statistics_ex
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_WRITER_STATISTICS_EX extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * <b>DWORD</b> containing the bit rate plus any overhead.
     * @type {Integer}
     */
    dwBitratePlusOverhead {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>DWORD</b> containing the current rate at which samples are dropped in the queue in order to reduce demands on the CPU.
     * @type {Integer}
     */
    dwCurrentSampleDropRateInQueue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <b>DWORD</b> containing the current rate at which samples are dropped in the codec. Samples can be dropped when they contain little new data. To prevent this from happening, call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced2-setinputsetting">IWMWriterAdvanced2::SetInputSetting</a> to set the g_wszFixedFrameRate setting to <b>TRUE</b>.
     * @type {Integer}
     */
    dwCurrentSampleDropRateInCodec {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <b>DWORD</b> containing the current rate at which samples are dropped in the multiplexer because they arrived late or overflowed the buffer window.
     * @type {Integer}
     */
    dwCurrentSampleDropRateInMultiplexer {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * <b>DWORD</b> containing the total number of samples dropped in the queue.
     * @type {Integer}
     */
    dwTotalSampleDropsInQueue {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <b>DWORD</b> containing the total number of samples dropped in the codec.
     * @type {Integer}
     */
    dwTotalSampleDropsInCodec {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * <b>DWORD</b> containing the total number of samples dropped in the multiplexer.
     * @type {Integer}
     */
    dwTotalSampleDropsInMultiplexer {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
