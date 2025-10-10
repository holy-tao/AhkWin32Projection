#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the field information.
 * @see https://docs.microsoft.com/windows/win32/api//tdh/ns-tdh-provider_field_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PROVIDER_FIELD_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Offset to the null-terminated Unicode string that contains the name of the field, in English only.
     * @type {Integer}
     */
    NameOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Offset to the null-terminated Unicode string that contains the localized description of the field. The value is zero if the description does not exist.
     * @type {Integer}
     */
    DescriptionOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Field value.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
