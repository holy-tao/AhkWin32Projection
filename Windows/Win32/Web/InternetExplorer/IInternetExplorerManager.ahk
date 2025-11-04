#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IInternetExplorerManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetExplorerManager
     * @type {Guid}
     */
    static IID => Guid("{acc84351-04ff-44f9-b23f-655ed168c6d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateObject"]

    /**
     * 
     * @param {Integer} dwConfig 
     * @param {PWSTR} pszURL 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    CreateObject(dwConfig, pszURL, riid, ppv) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", dwConfig, "ptr", pszURL, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}
