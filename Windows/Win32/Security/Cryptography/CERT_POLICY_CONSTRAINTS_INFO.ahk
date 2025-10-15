#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

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
    fRequireExplicitPolicy{
        get {
            if(!this.HasProp("__fRequireExplicitPolicy"))
                this.__fRequireExplicitPolicy := BOOL(this.ptr + 0)
            return this.__fRequireExplicitPolicy
        }
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
    fInhibitPolicyMapping{
        get {
            if(!this.HasProp("__fInhibitPolicyMapping"))
                this.__fInhibitPolicyMapping := BOOL(this.ptr + 8)
            return this.__fInhibitPolicyMapping
        }
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
