#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SECPKG_SERIALIZED_OID.ahk

/**
 * Contains the object identifiers (OIDs) for the extended security package.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_extra_oids
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_EXTRA_OIDS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The total number of OIDs in the security package.
     * @type {Integer}
     */
    OidCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_serialized_oid">SECPKG_SERIALIZED_OID</a> structure containing the OID data.
     * @type {Array<SECPKG_SERIALIZED_OID>}
     */
    Oids{
        get {
            if(!this.HasProp("__OidsProxyArray"))
                this.__OidsProxyArray := Win32FixedArray(this.ptr + 8, 1, SECPKG_SERIALIZED_OID, "")
            return this.__OidsProxyArray
        }
    }
}
