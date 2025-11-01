#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOMAINDESC.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-domain_tree
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DOMAIN_TREE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dsSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<DOMAINDESC>}
     */
    aDomains{
        get {
            if(!this.HasProp("__aDomainsProxyArray"))
                this.__aDomainsProxyArray := Win32FixedArray(this.ptr + 8, 1, DOMAINDESC, "")
            return this.__aDomainsProxyArray
        }
    }
}
