#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class REPAIR_CLUSTER_NAME_ACCOUNT_CONFIG extends Win32Struct
{
    static sizeof => 32

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
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    pszUserName{
        get {
            if(!this.HasProp("__pszUserName"))
                this.__pszUserName := PWSTR(this.ptr + 8)
            return this.__pszUserName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszPassword{
        get {
            if(!this.HasProp("__pszPassword"))
                this.__pszPassword := PWSTR(this.ptr + 16)
            return this.__pszPassword
        }
    }

    /**
     * @type {PWSTR}
     */
    pszDomain{
        get {
            if(!this.HasProp("__pszDomain"))
                this.__pszDomain := PWSTR(this.ptr + 24)
            return this.__pszDomain
        }
    }
}
