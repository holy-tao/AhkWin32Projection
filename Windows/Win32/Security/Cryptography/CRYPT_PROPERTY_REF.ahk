#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a CNG context property.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-crypt_property_ref
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_PROPERTY_REF extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the property.
     * @type {Pointer<Char>}
     */
    pszProperty {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size, in bytes, of the <b>pbValue</b> buffer.
     * @type {Integer}
     */
    cbValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a memory buffer that contains the value of the property. The format and type of this data depend on the property.
     * @type {Pointer<Byte>}
     */
    pbValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
