#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the offset of a registration object type name.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_registration_object_type_name_offset
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a wide character string that represents the name of the object type.
     * @type {Pointer<PWSTR>}
     */
    szObjectTypeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Offset of the object type name in an object types message DLL.
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
