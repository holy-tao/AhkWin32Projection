#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DOMAIN_TREE.ahk" { DOMAIN_TREE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDsBrowseDomainTree interface is used by an application to display a domain browser dialog box and/or obtain a list of trust domains related to a given computer.
 * @remarks
 * An instance of this interface is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with the <b>CLSID_DsDomainTreeBrowser</b> class identifier as shown below.
 * 
 * 
 * ```cpp
 * HRESULT hr = S_OK;
 * IDsBrowseDomainTree *pDSB = NULL;
 * 
 * hr = CoCreateInstance(    CLSID_DsDomainTreeBrowser,
 *                           NULL,
 *                           CLSCTX_INPROC_SERVER,
 *                           IID_IDsBrowseDomainTree,
 *                           (void**)&pDSB);
 * 
 * if(SUCCEEDED(hr))
 * {
 *     //use the IDsBrowseDomainTree object
 * 
 *     //release the IDsBrowseDomainTree object
 *     pDSB->Release();
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/nn-dsclient-idsbrowsedomaintree
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IDsBrowseDomainTree extends IUnknown {
    /**
     * The interface identifier for IDsBrowseDomainTree
     * @type {Guid}
     */
    static IID := Guid("{7cabcf1e-78f5-11d2-960c-00c04fa31a86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDsBrowseDomainTree interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BrowseTo           : IntPtr
        GetDomains         : IntPtr
        FreeDomains        : IntPtr
        FlushCachedDomains : IntPtr
        SetComputer        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDsBrowseDomainTree.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDsBrowseDomainTree::BrowseTo method displays a dialog box used to browse for a domain.
     * @param {HWND} hwndParent Handle of the window that will be the owner of the domain browser dialog box.
     * @param {Integer} dwFlags 
     * @returns {PWSTR} Pointer to a Unicode string pointer that receives the path string of the domain selected in the domain browser. This memory must be freed when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. By default, this path takes the form "myDom.Fabrikam.com". If <i>dwFlags</i> contains the <b>DBDTF_RETURNFQDN</b> flag, the path takes the form "DC=myDom, DC=Fabrikam, DC=com".
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsbrowsedomaintree-browseto
     */
    BrowseTo(hwndParent, dwFlags) {
        result := ComCall(3, this, HWND, hwndParent, PWSTR.Ptr, &ppszTargetPath := 0, "uint", dwFlags, "HRESULT")
        return ppszTargetPath
    }

    /**
     * The IDsBrowseDomainTree::GetDomains method retrieves the trust domains of the current computer. The current computer is set using the IDsBrowseDomainTree::SetComputer method.
     * @remarks
     * For more information about how to access and use the data provided by this method, see <a href="https://docs.microsoft.com/windows/desktop/AD/domain-browser">Domain Browser</a>.
     * @param {Pointer<Pointer<DOMAIN_TREE>>} ppDomainTree Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-domain_tree">DOMAINTREE</a> structure pointer that receives the trust domain data. The caller must free this memory when no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nf-dsclient-idsbrowsedomaintree-freedomains">IDsBrowseDomainTree::FreeDomains</a>.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> value including the following.
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsbrowsedomaintree-getdomains
     */
    GetDomains(ppDomainTree, dwFlags) {
        ppDomainTreeMarshal := ppDomainTree is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppDomainTreeMarshal, ppDomainTree, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The IDsBrowseDomainTree::FreeDomains method frees the memory allocated by the IDsBrowseDomainTree::GetDomains method.
     * @param {Pointer<Pointer<DOMAIN_TREE>>} ppDomainTree Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-domain_tree">DOMAINTREE</a> data structure.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> value including the following.
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsbrowsedomaintree-freedomains
     */
    FreeDomains(ppDomainTree) {
        ppDomainTreeMarshal := ppDomainTree is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, ppDomainTreeMarshal, ppDomainTree, "HRESULT")
        return result
    }

    /**
     * The IDsBrowseDomainTree::FlushCachedDomains method frees the cached domain list.
     * @remarks
     * This method frees the internal cached domain data. This method must  be called before calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nf-dsclient-idsbrowsedomaintree-setcomputer">IDsBrowseDomainTree::SetComputer</a> to retarget to a computer of a different domain.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> value including the following.
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsbrowsedomaintree-flushcacheddomains
     */
    FlushCachedDomains() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Specifies the computer and credentials to be used by this instance of the IDsBrowseDomainTree interface.
     * @remarks
     * If this method is not called, the local host is assumed as the default computer.
     * 
     * When <b>SetComputer</b> is called on a particular <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nn-dsclient-idsbrowsedomaintree">IDsBrowseDomainTree</a> instance, <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nf-dsclient-idsbrowsedomaintree-flushcacheddomains">IDsBrowseDomainTree::FlushCachedDomains</a> must be called before <b>SetComputer</b> is called again.
     * @param {PWSTR} pszComputerName Pointer to a null-terminated Unicode string that contains the name of the target computer.
     * @param {PWSTR} pszUserName Pointer to a null-terminated Unicode string that contains the user name used to access the  computer.
     * @param {PWSTR} pszPassword Pointer to a null-terminated Unicode string that contains the password used to access the  computer.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> value including the following.
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsbrowsedomaintree-setcomputer
     */
    SetComputer(pszComputerName, pszUserName, pszPassword) {
        pszComputerName := pszComputerName is String ? StrPtr(pszComputerName) : pszComputerName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(7, this, "ptr", pszComputerName, "ptr", pszUserName, "ptr", pszPassword, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDsBrowseDomainTree.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BrowseTo := CallbackCreate(GetMethod(implObj, "BrowseTo"), flags, 4)
        this.vtbl.GetDomains := CallbackCreate(GetMethod(implObj, "GetDomains"), flags, 3)
        this.vtbl.FreeDomains := CallbackCreate(GetMethod(implObj, "FreeDomains"), flags, 2)
        this.vtbl.FlushCachedDomains := CallbackCreate(GetMethod(implObj, "FlushCachedDomains"), flags, 1)
        this.vtbl.SetComputer := CallbackCreate(GetMethod(implObj, "SetComputer"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BrowseTo)
        CallbackFree(this.vtbl.GetDomains)
        CallbackFree(this.vtbl.FreeDomains)
        CallbackFree(this.vtbl.FlushCachedDomains)
        CallbackFree(this.vtbl.SetComputer)
    }
}
