#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the security package's object identifier (OID).
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_serialized_oid
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_SERIALIZED_OID extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * The length of the OID.
     * @type {Integer}
     */
    OidLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The attributes of the OID.
     * @type {Integer}
     */
    OidAttributes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The value of the OID. The value of SECPKG_MAX_OID_LENGTH is currently set to 32.
     * @type {Array<Byte>}
     */
    OidValue{
        get {
            if(!this.HasProp("__OidValueProxyArray"))
                this.__OidValueProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__OidValueProxyArray
        }
    }
}
