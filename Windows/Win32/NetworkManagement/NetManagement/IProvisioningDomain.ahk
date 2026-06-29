#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Data\Xml\MsXml\IXMLDOMNodeList.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class IProvisioningDomain extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvisioningDomain
     * @type {Guid}
     */
    static IID => Guid("{c96fbd50-24dd-11d8-89fb-00904b2ea9c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Query"]

    /**
     * 
     * @param {PWSTR} pszwPathToFolder 
     * @returns {HRESULT} 
     */
    Add(pszwPathToFolder) {
        pszwPathToFolder := pszwPathToFolder is String ? StrPtr(pszwPathToFolder) : pszwPathToFolder

        result := ComCall(3, this, "ptr", pszwPathToFolder, "HRESULT")
        return result
    }

    /**
     * The Query object represents a compound query.
     * @param {PWSTR} pszwDomain 
     * @param {PWSTR} pszwLanguage 
     * @param {PWSTR} pszwXPathQuery 
     * @returns {IXMLDOMNodeList} 
     * @see https://learn.microsoft.com/windows/win32/WMP/query-object
     */
    Query(pszwDomain, pszwLanguage, pszwXPathQuery) {
        pszwDomain := pszwDomain is String ? StrPtr(pszwDomain) : pszwDomain
        pszwLanguage := pszwLanguage is String ? StrPtr(pszwLanguage) : pszwLanguage
        pszwXPathQuery := pszwXPathQuery is String ? StrPtr(pszwXPathQuery) : pszwXPathQuery

        result := ComCall(4, this, "ptr", pszwDomain, "ptr", pszwLanguage, "ptr", pszwXPathQuery, "ptr*", &_Nodes := 0, "HRESULT")
        return IXMLDOMNodeList(_Nodes)
    }
}
