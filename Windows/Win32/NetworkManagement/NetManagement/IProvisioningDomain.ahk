#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Data\Xml\MsXml\IXMLDOMNodeList.ahk" { IXMLDOMNodeList }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct IProvisioningDomain extends IUnknown {
    /**
     * The interface identifier for IProvisioningDomain
     * @type {Guid}
     */
    static IID := Guid("{c96fbd50-24dd-11d8-89fb-00904b2ea9c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvisioningDomain interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Add   : IntPtr
        Query : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvisioningDomain.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IProvisioningDomain.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Query := CallbackCreate(GetMethod(implObj, "Query"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Query)
    }
}
