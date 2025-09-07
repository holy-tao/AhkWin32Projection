#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains data about an element in a domain tree obtained with the IDsBrowseDomainTree::GetDomains method.
 * @remarks
 * For more information about how to access and use the information in this structure, see <a href="https://docs.microsoft.com/windows/desktop/AD/domain-browser">Domain Browser</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-domaindesc
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DOMAINDESC extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains the domain name.
     * @type {PWSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PWSTR(this.ptr + 0)
            return this.__pszName
        }
    }

    /**
     * Pointer to a Unicode string that contains the path of the domain. Reserved.
     * @type {PWSTR}
     */
    pszPath{
        get {
            if(!this.HasProp("__pszPath"))
                this.__pszPath := PWSTR(this.ptr + 8)
            return this.__pszPath
        }
    }

    /**
     * Pointer to a Unicode string that contains the fully qualified name of the domain in the form "DC=myDom, DC=Fabrikam, DC=com". This member is  blank if the <b>DBDTF_RETURNFQDN</b> flag is not set in the <i>dwFlags</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nf-dsclient-idsbrowsedomaintree-getdomains">IDsBrowseDomainTree::GetDomains</a>.
     * @type {PWSTR}
     */
    pszNCName{
        get {
            if(!this.HasProp("__pszNCName"))
                this.__pszNCName := PWSTR(this.ptr + 16)
            return this.__pszNCName
        }
    }

    /**
     * Pointer to a Unicode string that contains the name of the parent domain. This member is <b>NULL</b> if the domain has no parent.
     * @type {PWSTR}
     */
    pszTrustParent{
        get {
            if(!this.HasProp("__pszTrustParent"))
                this.__pszTrustParent := PWSTR(this.ptr + 24)
            return this.__pszTrustParent
        }
    }

    /**
     * Pointer to a Unicode string that contains the object class name of the domain.
     * @type {PWSTR}
     */
    pszObjectClass{
        get {
            if(!this.HasProp("__pszObjectClass"))
                this.__pszObjectClass := PWSTR(this.ptr + 32)
            return this.__pszObjectClass
        }
    }

    /**
     * Contains a set of flags that specify the attributes of the trust. For more information, and a list of possible values, see the <i>Flags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsa">DsEnumerateDomainTrusts</a>.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Contains a nonzero value if the domain is a down-level domain or zero otherwise.
     * @type {Integer}
     */
    fDownLevel {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Contains a pointer to a <b>DOMAINDESC</b> structure that represents the first child of the domain. Obtain subsequent children by accessing the <b>pdNextSibling</b> member of the child structure. This member is <b>NULL</b> if the domain has no children.
     * @type {Pointer<DOMAINDESC>}
     */
    pdChildList {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Contains a pointer to a <b>DOMAINDESC</b> structure that represents the next sibling of the domain. Obtain subsequent siblings by accessing the <b>pdNextSibling</b> member of the sibling structure. This member is <b>NULL</b> if the domain has no siblings.
     * @type {Pointer<DOMAINDESC>}
     */
    pdNextSibling {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
