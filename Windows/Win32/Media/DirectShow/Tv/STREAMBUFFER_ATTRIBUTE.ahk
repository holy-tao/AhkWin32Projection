#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * This topic applies only to Windows XP Service Pack 1 or later. The STREAMBUFFER_ATTRIBUTE structure describes an attribute on a stream buffer file.
 * @see https://docs.microsoft.com/windows/win32/api//sbe/ns-sbe-streambuffer_attribute
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class STREAMBUFFER_ATTRIBUTE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated wide-character string that contains the name of the attribute.
     * @type {PWSTR}
     */
    pszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ne-sbe-streambuffer_attr_datatype">STREAMBUFFER_ATTR_DATATYPE</a> enumeration. The value indicates the data type that you should use to interpret the attribute data, which is contained in the <b>pbAttribute</b> member.
     * @type {Integer}
     */
    StreamBufferAttributeType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Pointer to a buffer that contains the attribute data.
     * @type {Pointer<Byte>}
     */
    pbAttribute {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The size of the buffer given in <b>pbAttribute</b>, in bytes.
     * @type {Integer}
     */
    cbLength {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
