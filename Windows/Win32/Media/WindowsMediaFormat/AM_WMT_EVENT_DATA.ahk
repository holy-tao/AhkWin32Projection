#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The AM_WMT_EVENT_DATA structure contains information pertaining to an EC_WMT_EVENT and the associated status code returned by the Windows Media Format SDK.
 * @remarks
 * This structure is relevant when using the <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-asf-reader-filter">WM ASF Reader</a> filter to read files protected with Digital Rights Management.
 * @see https://learn.microsoft.com/windows/win32/api/evcode/ns-evcode-am_wmt_event_data
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct AM_WMT_EVENT_DATA {
    #StructPack 8

    /**
     * The status code returned by the Windows Media Format SDK.
     */
    hrStatus : HRESULT

    /**
     * Pointer whose data is dependent on the value of the <b>WMT_STATUS</b> message in <i>lParam1</i> of the <b>EC_WMT_EVENT</b> event. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/ec-wmt-event">EC_WMT_EVENT</a>.
     */
    pData : IntPtr

}
