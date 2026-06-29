#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WM_READER_STATISTICS structure describes the performance of a reading operation.
 * @remarks
 * You must set the <b>cbSize</b> member manually before using this structure. It should always be set to sizeof(<b>WM_READER_STATISTICS</b>).
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_reader_statistics
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_READER_STATISTICS {
    #StructPack 4

    /**
     * The size of the <b>WM_READER_STATISTICS</b> structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * <b>DWORD</b> containing the bandwidth, in bits per second.
     */
    dwBandwidth : UInt32

    /**
     * Count of packets received.
     */
    cPacketsReceived : UInt32

    /**
     * Count of lost packets which were recovered. This value is only relevant during network playback.
     */
    cPacketsRecovered : UInt32

    /**
     * Count of lost packets which were not recovered. This value is only relevant during network playback.
     */
    cPacketsLost : UInt32

    /**
     * <b>WORD</b> containing the quality, which is the percentage of total packets that were received.
     */
    wQuality : UInt16

}
