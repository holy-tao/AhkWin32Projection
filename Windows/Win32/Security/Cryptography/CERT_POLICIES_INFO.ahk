#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_POLICIES_INFO structure contains an array of CERT_POLICY_INFO.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_policies_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_POLICIES_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>rgPolicyInfo</b> array.
     * @type {Integer}
     */
    cPolicyInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_policy_info">CERT_POLICY_INFO</a> structures.
     * @type {Pointer<CERT_POLICY_INFO>}
     */
    rgPolicyInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
