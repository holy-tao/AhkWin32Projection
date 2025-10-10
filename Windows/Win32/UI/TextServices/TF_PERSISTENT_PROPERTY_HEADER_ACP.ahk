#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TF_PERSISTENT_PROPERTY_HEADER_ACP structure is used to provide property header data.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/ns-msctf-tf_persistent_property_header_acp
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_PERSISTENT_PROPERTY_HEADER_ACP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Contains a GUID that identifies the property.
     * @type {Pointer<Guid>}
     */
    guidType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the starting character position of the property.
     * @type {Integer}
     */
    ichStart {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Contains the number of characters that the property spans.
     * @type {Integer}
     */
    cch {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Contains the size, in bytes, of the property value.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Contains a <b>DWORD</b> value defined by the property owner.
     * @type {Integer}
     */
    dwPrivate {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Contains the CLSID of the property owner.
     * @type {Pointer<Guid>}
     */
    clsidTIP {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
