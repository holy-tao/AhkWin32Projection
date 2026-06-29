#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMT_WEBSTREAM_FORMAT structure contains information about a Web stream. This structure is used as the pbFormat member of the WM_MEDIA_TYPE structure for Web streams.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_webstream_format
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_WEBSTREAM_FORMAT {
    #StructPack 2

    /**
     * <b>WORD</b> containing the size of the structure, in bytes.
     */
    cbSize : UInt16 := this.Size

    /**
     * <b>WORD</b> containing the size of Web stream sample header, in bytes.
     */
    cbSampleHeaderFixedData : UInt16

    /**
     * <b>WORD</b> containing the version number. Set to 1 for streams created with the Windows Media Format 9 Series SDK.
     */
    wVersion : UInt16

    /**
     * <b>WORD</b>. Reserved.
     */
    wReserved : UInt16

}
