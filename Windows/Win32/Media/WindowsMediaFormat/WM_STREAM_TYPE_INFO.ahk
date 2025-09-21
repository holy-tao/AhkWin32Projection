#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_STREAM_TYPE_INFO structure is used as the data item for the WM/StreamTypeInfo complex metadata attribute. It stores the major type and the size of the associated format data.
 * @remarks
 * None.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_stream_type_info
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_STREAM_TYPE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The major type of the stream.
     * @type {Pointer<Guid>}
     */
    guidMajorType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of format in bytes.
     * @type {Integer}
     */
    cbFormat {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
