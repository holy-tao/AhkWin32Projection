#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a fully qualified binary name value associated with a security attribute.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_security_attribute_fqbn_value
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The version number of the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to strings that specify the names of the publisher, the product, and the original binary file of the value.
     * @type {Pointer<Ptr>}
     */
    pName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
