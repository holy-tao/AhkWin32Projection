#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The WM_STREAM_TYPE_INFO structure is used as the data item for the WM/StreamTypeInfo complex metadata attribute. It stores the major type and the size of the associated format data.
 * @remarks
 * None.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_stream_type_info
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WM_STREAM_TYPE_INFO extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * The major type of the stream.
     * @type {Guid}
     */
    guidMajorType {
        get {
            if(!this.HasProp("__guidMajorType"))
                this.__guidMajorType := Guid(0, this)
            return this.__guidMajorType
        }
    }

    /**
     * The size of format in bytes.
     * @type {Integer}
     */
    cbFormat {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
