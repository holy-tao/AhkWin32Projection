#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOMAINDESC.ahk" { DOMAINDESC }

/**
 * The DOMAINTREE structure contains data about a node in a domain tree obtained with the IDsBrowseDomainTree::GetDomains method. Each of the domains in the tree node are represented by a DOMAINDESC structure.
 * @remarks
 * For more information about how to access and use the data in this structure, see <a href="https://docs.microsoft.com/windows/desktop/AD/domain-browser">Domain Browser</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-domain_tree
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DOMAIN_TREE {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the <b>DOMAINTREE</b> structure and all <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-domaindesc">DOMAINDESC</a> structures in this <b>DOMAINTREE</b> structure.
     */
    dsSize : UInt32

    /**
     * Contains the number of  <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-domaindesc">DOMAINDESC</a> structures in the <b>aDomains</b> array.
     */
    dwCount : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-domaindesc">DOMAINDESC</a> structures that represent the domains. The array does not contain any child or sibling relational data. The relational data is contained within the <b>DOMAINDESC</b> structures.
     */
    aDomains : DOMAINDESC[1]

}
