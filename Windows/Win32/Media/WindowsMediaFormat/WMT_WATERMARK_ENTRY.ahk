#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WMT_WATERMARK_ENTRY_TYPE.ahk" { WMT_WATERMARK_ENTRY_TYPE }

/**
 * The WMT_WATERMARK_ENTRY structure contains information describing a watermarking system.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_watermark_entry
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_WATERMARK_ENTRY {
    #StructPack 8

    /**
     * A value from the <b>WMT_WATERMARK_ENTRY_TYPE</b> enumeration type specifying the type of watermarking system.
     */
    wmetType : WMT_WATERMARK_ENTRY_TYPE

    /**
     * GUID value identifying the watermarking system.
     */
    clsid : Guid

    /**
     * The size of display name in wide characters.
     */
    cbDisplayName : UInt32

    /**
     * Pointer to a wide-character null-terminated string containing the display name.
     */
    pwszDisplayName : PWSTR

}
