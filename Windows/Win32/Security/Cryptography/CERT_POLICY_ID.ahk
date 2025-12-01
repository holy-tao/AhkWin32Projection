#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_POLICY_ID structure contains a list of certificate policies that the certificate expressly supports, together with optional qualifier information pertaining to these policies.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_policy_id
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_POLICY_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>rgpszCertPolicyElementId</b> array.
     * @type {Integer}
     */
    cCertPolicyElementId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of pointers to policy element identifier strings.
     * @type {Pointer<PSTR>}
     */
    rgpszCertPolicyElementId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
