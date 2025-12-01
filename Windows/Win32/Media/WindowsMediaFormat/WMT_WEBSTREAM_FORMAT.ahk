#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMT_WEBSTREAM_FORMAT structure contains information about a Web stream. This structure is used as the pbFormat member of the WM_MEDIA_TYPE structure for Web streams.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_webstream_format
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_WEBSTREAM_FORMAT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * <b>WORD</b> containing the size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * <b>WORD</b> containing the size of Web stream sample header, in bytes.
     * @type {Integer}
     */
    cbSampleHeaderFixedData {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * <b>WORD</b> containing the version number. Set to 1 for streams created with the Windows Media Format 9 Series SDK.
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * <b>WORD</b>. Reserved.
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 8
    }
}
