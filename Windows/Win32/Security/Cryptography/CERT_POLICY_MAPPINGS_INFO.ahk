#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_POLICY_MAPPINGS_INFO structure provides mapping between the policy OIDs of two domains.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_policy_mappings_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_POLICY_MAPPINGS_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Count of the number of elements in the <b>rgPolicyMapping</b> array.
     * @type {Integer}
     */
    cPolicyMapping {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_policy_mapping">CERT_POLICY_MAPPING</a> structures. Each element of this array provides pair of OIDs mapping the identifies of one domain to identifiers in the other domain.
     * @type {Pointer<CERT_POLICY_MAPPING>}
     */
    rgPolicyMapping {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
