#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * The CERT_POLICY_QUALIFIER_INFO structure contains an object identifier (OID) specifying the qualifier and qualifier-specific supplemental information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_policy_qualifier_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_POLICY_QUALIFIER_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * OID specifying the qualifier.
     * @type {Pointer<Ptr>}
     */
    pszPolicyQualifierId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_OBJID_BLOB</a> structure that contains qualifier specific supplemental information.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Qualifier{
        get {
            if(!this.HasProp("__Qualifier"))
                this.__Qualifier := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__Qualifier
        }
    }
}
