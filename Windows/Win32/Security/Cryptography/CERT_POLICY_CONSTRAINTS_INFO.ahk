#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_POLICY_CONSTRAINTS_INFO structure contains established policies for accepting certificates as trusted.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_policy_constraints_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_POLICY_CONSTRAINTS_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * <b>BOOL</b> flag indicating whether explicit policy information is required.
     * @type {BOOL}
     */
    fRequireExplicitPolicy {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <b>DWORD</b> indicating the number of required explicit policy certificates.
     * @type {Integer}
     */
    dwRequireExplicitPolicySkipCerts {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <b>BOOL</b> flag indicating whether policy mapping is inhibited.
     * @type {BOOL}
     */
    fInhibitPolicyMapping {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * <b>DWORD</b> indicating the number of policy mapping certificates to be skipped.
     * @type {Integer}
     */
    dwInhibitPolicyMappingSkipCerts {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
