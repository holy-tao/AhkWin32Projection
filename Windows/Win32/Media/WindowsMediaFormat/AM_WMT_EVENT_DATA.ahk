#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AM_WMT_EVENT_DATA structure contains information pertaining to an EC_WMT_EVENT and the associated status code returned by the Windows Media Format SDK.
 * @remarks
 * This structure is relevant when using the <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-asf-reader-filter">WM ASF Reader</a> filter to read files protected with Digital Rights Management.
 * @see https://learn.microsoft.com/windows/win32/api/evcode/ns-evcode-am_wmt_event_data
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class AM_WMT_EVENT_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The status code returned by the Windows Media Format SDK.
     * @type {HRESULT}
     */
    hrStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Pointer whose data is dependent on the value of the <b>WMT_STATUS</b> message in <i>lParam1</i> of the <b>EC_WMT_EVENT</b> event. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/ec-wmt-event">EC_WMT_EVENT</a>.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
