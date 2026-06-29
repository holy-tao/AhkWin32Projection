#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMT_FILESINK_MODE enumeration type defines the types of input accepted by the file sink.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_filesink_mode
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_FILESINK_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The file sink accepts normal buffers through calls to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-ondataunit">IWMWriterSink::OnDataUnit</a>. This is the default behavior.
     * @type {Integer (Int32)}
     */
    static WMT_FM_SINGLE_BUFFERS => 1

    /**
     * The file sink accepts data as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_filesink_data_unit">WMT_FILESINK_DATA_UNIT</a> structures delivered by <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-ondataunitex">IWMWriterFileSink3::OnDataUnitEx</a>.
     * @type {Integer (Int32)}
     */
    static WMT_FM_FILESINK_DATA_UNITS => 2

    /**
     * The file sink accepts unbuffered data. A call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setunbufferedio">IWMWriterFileSink3::SetUnbufferedIO</a> will succeed.
     * @type {Integer (Int32)}
     */
    static WMT_FM_FILESINK_UNBUFFERED => 4
}
