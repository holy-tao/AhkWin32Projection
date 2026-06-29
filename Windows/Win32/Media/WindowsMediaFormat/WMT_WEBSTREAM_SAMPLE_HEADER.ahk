#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The WMT_WEBSTREAM_SAMPLE_HEADER structure is used as a variable-sized header for each Web stream sample.
 * @remarks
 * In a Web stream, each sample begins with this structure. The application is responsible for determining the size of the structure for each sample delivered. The size depends on the length of the <b>wszURL</b> member, as reported in the <b>cbLength</b> member.
 * 
 * If <b>wSampleType</b> is WEBSTREAM_SAMPLE_TYPE_FILE, the sample contains data immediately following the header that should be cached for later rendering. If the type is WEBSTREAM_SAMPLE_TYPE_RENDER, the sample contains no data. The application should cause the file named in the <b>wszURL</b> member to be immediately rendered on the display.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_webstream_sample_header
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_WEBSTREAM_SAMPLE_HEADER {
    #StructPack 2

    /**
     * <b>WORD</b> containing the size of <b>wszURL</b> in wide characters.
     */
    cbLength : UInt16

    /**
     * <b>WORD</b> containing the zero-based part number to which the sample applies. When the last part is received, <b>wPart</b> equals <b>cTotalParts</b>– 1.
     */
    wPart : UInt16

    /**
     * <b>WORD</b> containing the total number of parts in the Web stream.
     */
    cTotalParts : UInt16

    /**
     * <b>WORD</b> containing the type of Web stream, either WEBSTREAM_SAMPLE_TYPE_FILE (0x1) or WEBSTREAM_SAMPLE_TYPE_RENDER (0x2). See Remarks.
     */
    wSampleType : UInt16

    /**
     * Wide-character null-terminated string specifying the local URL.
     */
    wszURL : WCHAR[1]

}
