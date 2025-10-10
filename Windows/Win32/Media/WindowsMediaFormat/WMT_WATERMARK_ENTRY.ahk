#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMT_WATERMARK_ENTRY structure contains information describing a watermarking system.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wmt_watermark_entry
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_WATERMARK_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A value from the <b>WMT_WATERMARK_ENTRY_TYPE</b> enumeration type specifying the type of watermarking system.
     * @type {Integer}
     */
    wmetType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * GUID value identifying the watermarking system.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of display name in wide characters.
     * @type {Integer}
     */
    cbDisplayName {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a wide-character null-terminated string containing the display name.
     * @type {Pointer<Char>}
     */
    pwszDisplayName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
