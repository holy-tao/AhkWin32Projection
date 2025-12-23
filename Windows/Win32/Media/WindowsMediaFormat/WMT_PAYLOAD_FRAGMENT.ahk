#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WMT_BUFFER_SEGMENT.ahk

/**
 * The WMT_PAYLOAD_FRAGMENT structure contains the information needed to extract a payload fragment from a buffer and identifies the payload to which the fragment belongs.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_payload_fragment
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_PAYLOAD_FRAGMENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <b>DWORD</b> containing the payload index. This identifies the payload item to which this fragment belongs.
     * @type {Integer}
     */
    dwPayloadIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <b>WMT_BUFFER_SEGMENT</b> structure specifying the buffer segment containing the payload fragment.
     * @type {WMT_BUFFER_SEGMENT}
     */
    segmentData{
        get {
            if(!this.HasProp("__segmentData"))
                this.__segmentData := WMT_BUFFER_SEGMENT(8, this)
            return this.__segmentData
        }
    }
}
