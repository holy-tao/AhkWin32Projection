#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import ".\WMT_BUFFER_SEGMENT.ahk" { WMT_BUFFER_SEGMENT }

/**
 * The WMT_PAYLOAD_FRAGMENT structure contains the information needed to extract a payload fragment from a buffer and identifies the payload to which the fragment belongs.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_payload_fragment
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_PAYLOAD_FRAGMENT {
    #StructPack 8

    /**
     * <b>DWORD</b> containing the payload index. This identifies the payload item to which this fragment belongs.
     */
    dwPayloadIndex : UInt32

    /**
     * A <b>WMT_BUFFER_SEGMENT</b> structure specifying the buffer segment containing the payload fragment.
     */
    segmentData : WMT_BUFFER_SEGMENT

}
