#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SecPkgCred_ClientCertPolicy extends Win32Struct {
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
     * @type {Guid}
     */
    guidPolicyId {
        get {
            if(!this.HasProp("__guidPolicyId"))
                this.__guidPolicyId := Guid(4, this)
            return this.__guidPolicyId
        }
    }

    /**
     * @type {Integer}
     */
    dwCertFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwUrlRetrievalTimeout {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BOOL}
     */
    fCheckRevocationFreshnessTime {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwRevocationFreshnessTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {BOOL}
     */
    fOmitUsageCheck {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {PWSTR}
     */
    pwszSslCtlStoreName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {PWSTR}
     */
    pwszSslCtlIdentifier {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
