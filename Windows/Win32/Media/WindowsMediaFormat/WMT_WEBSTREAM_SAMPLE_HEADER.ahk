#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMT_WEBSTREAM_SAMPLE_HEADER structure is used as a variable-sized header for each Web stream sample.
 * @remarks
 * In a Web stream, each sample begins with this structure. The application is responsible for determining the size of the structure for each sample delivered. The size depends on the length of the <b>wszURL</b> member, as reported in the <b>cbLength</b> member.
  * 
  * If <b>wSampleType</b> is WEBSTREAM_SAMPLE_TYPE_FILE, the sample contains data immediately following the header that should be cached for later rendering. If the type is WEBSTREAM_SAMPLE_TYPE_RENDER, the sample contains no data. The application should cause the file named in the <b>wszURL</b> member to be immediately rendered on the display.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_webstream_sample_header
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_WEBSTREAM_SAMPLE_HEADER extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * <b>WORD</b> containing the size of <b>wszURL</b> in wide characters.
     * @type {Integer}
     */
    cbLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * <b>WORD</b> containing the zero-based part number to which the sample applies. When the last part is received, <b>wPart</b> equals <b>cTotalParts</b>– 1.
     * @type {Integer}
     */
    wPart {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * <b>WORD</b> containing the total number of parts in the Web stream.
     * @type {Integer}
     */
    cTotalParts {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * <b>WORD</b> containing the type of Web stream, either WEBSTREAM_SAMPLE_TYPE_FILE (0x1) or WEBSTREAM_SAMPLE_TYPE_RENDER (0x2). See Remarks.
     * @type {Integer}
     */
    wSampleType {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Wide-character null-terminated string specifying the local URL.
     * @type {String}
     */
    wszURL {
        get => StrGet(this.ptr + 8, 0, "UTF-16")
        set => StrPut(value, this.ptr + 8, 0, "UTF-16")
    }
}
