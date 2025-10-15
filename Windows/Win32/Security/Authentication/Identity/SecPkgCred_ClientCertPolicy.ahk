#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgCred_ClientCertPolicy extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidPolicyId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwCertFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwUrlRetrievalTimeout {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {BOOL}
     */
    fCheckRevocationFreshnessTime{
        get {
            if(!this.HasProp("__fCheckRevocationFreshnessTime"))
                this.__fCheckRevocationFreshnessTime := BOOL(this.ptr + 24)
            return this.__fCheckRevocationFreshnessTime
        }
    }

    /**
     * @type {Integer}
     */
    dwRevocationFreshnessTime {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {BOOL}
     */
    fOmitUsageCheck{
        get {
            if(!this.HasProp("__fOmitUsageCheck"))
                this.__fOmitUsageCheck := BOOL(this.ptr + 32)
            return this.__fOmitUsageCheck
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszSslCtlStoreName{
        get {
            if(!this.HasProp("__pwszSslCtlStoreName"))
                this.__pwszSslCtlStoreName := PWSTR(this.ptr + 40)
            return this.__pwszSslCtlStoreName
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszSslCtlIdentifier{
        get {
            if(!this.HasProp("__pwszSslCtlIdentifier"))
                this.__pwszSslCtlIdentifier := PWSTR(this.ptr + 48)
            return this.__pwszSslCtlIdentifier
        }
    }
}
