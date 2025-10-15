#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_CertInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbSubjectName {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    pwszSubjectName{
        get {
            if(!this.HasProp("__pwszSubjectName"))
                this.__pwszSubjectName := PWSTR(this.ptr + 8)
            return this.__pwszSubjectName
        }
    }

    /**
     * @type {Integer}
     */
    cbIssuerName {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pwszIssuerName{
        get {
            if(!this.HasProp("__pwszIssuerName"))
                this.__pwszIssuerName := PWSTR(this.ptr + 24)
            return this.__pwszIssuerName
        }
    }

    /**
     * @type {Integer}
     */
    dwKeySize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
