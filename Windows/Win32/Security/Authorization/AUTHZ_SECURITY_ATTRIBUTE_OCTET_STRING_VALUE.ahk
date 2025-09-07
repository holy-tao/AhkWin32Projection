#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies an octet string value for a security attribute.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_security_attribute_octet_string_value
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to the value.
     * @type {Pointer<Void>}
     */
    pValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The length, in bytes, of the <b>pValue</b> member.
     * @type {Integer}
     */
    ValueLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
