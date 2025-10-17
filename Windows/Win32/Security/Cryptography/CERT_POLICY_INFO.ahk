#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_POLICY_INFO structure contains an object identifier (OID) specifying a policy and an optional array of policy qualifiers.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_policy_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_POLICY_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Object identifier (OID) string specifying the policy.
     * @type {PSTR}
     */
    pszPolicyIdentifier {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of elements in the <b>rgPolicyQualifier</b> array.
     * @type {Integer}
     */
    cPolicyQualifier {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_policy_qualifier_info">CERT_POLICY_QUALIFIER_INFO</a> structures.
     * @type {Pointer<CERT_POLICY_QUALIFIER_INFO>}
     */
    rgPolicyQualifier {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
