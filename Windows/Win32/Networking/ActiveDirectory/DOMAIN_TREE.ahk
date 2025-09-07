#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DOMAINDESC.ahk

/**
 * The DOMAINTREE structure contains data about a node in a domain tree obtained with the IDsBrowseDomainTree::GetDomains method. Each of the domains in the tree node are represented by a DOMAINDESC structure.
 * @remarks
 * For more information about how to access and use the data in this structure, see <a href="https://docs.microsoft.com/windows/desktop/AD/domain-browser">Domain Browser</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-domain_tree
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DOMAIN_TREE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the <b>DOMAINTREE</b> structure and all <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-domaindesc">DOMAINDESC</a> structures in this <b>DOMAINTREE</b> structure.
     * @type {Integer}
     */
    dsSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the number of  <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-domaindesc">DOMAINDESC</a> structures in the <b>aDomains</b> array.
     * @type {Integer}
     */
    dwCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-domaindesc">DOMAINDESC</a> structures that represent the domains. The array does not contain any child or sibling relational data. The relational data is contained within the <b>DOMAINDESC</b> structures.
     * @type {Array<DOMAINDESC>}
     */
    aDomains{
        get {
            if(!this.HasProp("__aDomainsProxyArray"))
                this.__aDomainsProxyArray := Win32FixedArray(this.ptr + 8, 8, DOMAINDESC, "")
            return this.__aDomainsProxyArray
        }
    }
}
