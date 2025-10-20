#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsBrowseDomainTree interface is used by an application to display a domain browser dialog box and/or obtain a list of trust domains related to a given computer.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dsclient/nn-dsclient-idsbrowsedomaintree
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsBrowseDomainTree extends IUnknown{
    /**
     * The interface identifier for IDsBrowseDomainTree
     * @type {Guid}
     */
    static IID => Guid("{7cabcf1e-78f5-11d2-960c-00c04fa31a86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<PWSTR>} ppszTargetPath 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    BrowseTo(hwndParent, ppszTargetPath, dwFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", ppszTargetPath, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DOMAIN_TREE>} ppDomainTree 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetDomains(ppDomainTree, dwFlags) {
        result := ComCall(4, this, "ptr", ppDomainTree, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DOMAIN_TREE>} ppDomainTree 
     * @returns {HRESULT} 
     */
    FreeDomains(ppDomainTree) {
        result := ComCall(5, this, "ptr", ppDomainTree, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushCachedDomains() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszComputerName 
     * @param {PWSTR} pszUserName 
     * @param {PWSTR} pszPassword 
     * @returns {HRESULT} 
     */
    SetComputer(pszComputerName, pszUserName, pszPassword) {
        pszComputerName := pszComputerName is String ? StrPtr(pszComputerName) : pszComputerName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(7, this, "ptr", pszComputerName, "ptr", pszUserName, "ptr", pszPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
