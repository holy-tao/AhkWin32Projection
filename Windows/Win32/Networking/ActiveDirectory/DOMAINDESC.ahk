#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains data about an element in a domain tree obtained with the IDsBrowseDomainTree::GetDomains method.
 * @remarks
 * For more information about how to access and use the information in this structure, see <a href="https://docs.microsoft.com/windows/desktop/AD/domain-browser">Domain Browser</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-domaindesc
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DOMAINDESC {
    #StructPack 8

    /**
     * Pointer to a Unicode string that contains the domain name.
     */
    pszName : PWSTR

    /**
     * Pointer to a Unicode string that contains the path of the domain. Reserved.
     */
    pszPath : PWSTR

    /**
     * Pointer to a Unicode string that contains the fully qualified name of the domain in the form "DC=myDom, DC=Fabrikam, DC=com". This member is  blank if the <b>DBDTF_RETURNFQDN</b> flag is not set in the <i>dwFlags</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nf-dsclient-idsbrowsedomaintree-getdomains">IDsBrowseDomainTree::GetDomains</a>.
     */
    pszNCName : PWSTR

    /**
     * Pointer to a Unicode string that contains the name of the parent domain. This member is <b>NULL</b> if the domain has no parent.
     */
    pszTrustParent : PWSTR

    /**
     * Pointer to a Unicode string that contains the object class name of the domain.
     */
    pszObjectClass : PWSTR

    /**
     * Contains a set of flags that specify the attributes of the trust. For more information, and a list of possible values, see the <i>Flags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsa">DsEnumerateDomainTrusts</a>.
     */
    ulFlags : UInt32

    /**
     * Contains a nonzero value if the domain is a down-level domain or zero otherwise.
     */
    fDownLevel : BOOL

    /**
     * Contains a pointer to a <b>DOMAINDESC</b> structure that represents the first child of the domain. Obtain subsequent children by accessing the <b>pdNextSibling</b> member of the child structure. This member is <b>NULL</b> if the domain has no children.
     */
    pdChildList : DOMAINDESC.Ptr

    /**
     * Contains a pointer to a <b>DOMAINDESC</b> structure that represents the next sibling of the domain. Obtain subsequent siblings by accessing the <b>pdNextSibling</b> member of the sibling structure. This member is <b>NULL</b> if the domain has no siblings.
     */
    pdNextSibling : DOMAINDESC.Ptr

}
