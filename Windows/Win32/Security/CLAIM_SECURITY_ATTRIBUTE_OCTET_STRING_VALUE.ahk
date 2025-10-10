#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies the OCTET_STRING value type of the claim security attribute.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-claim_security_attribute_octet_string_value
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer buffer that contains the <b>OCTET_STRING</b> value. The value is a series of bytes of the length indicated in the <b>ValueLength</b>  member.
     * @type {Pointer<Void>}
     */
    pValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The length, in bytes, of the <b>OCTET_STRING</b>  value.
     * @type {Integer}
     */
    ValueLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
