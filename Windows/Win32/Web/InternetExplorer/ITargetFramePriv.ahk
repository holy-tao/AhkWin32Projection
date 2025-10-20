#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetFramePriv extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetFramePriv
     * @type {Guid}
     */
    static IID => Guid("{9216e421-2bf5-11d0-82b4-00a0c90c29c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFrameDownwards", "FindFrameInContext", "OnChildFrameActivate", "OnChildFrameDeactivate", "NavigateHack", "FindBrowserByIndex"]

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUnknown>} ppunkTargetFrame 
     * @returns {HRESULT} 
     */
    FindFrameDownwards(pszTargetName, dwFlags, ppunkTargetFrame) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(3, this, "ptr", pszTargetName, "uint", dwFlags, "ptr*", ppunkTargetFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {IUnknown} punkContextFrame 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUnknown>} ppunkTargetFrame 
     * @returns {HRESULT} 
     */
    FindFrameInContext(pszTargetName, punkContextFrame, dwFlags, ppunkTargetFrame) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(4, this, "ptr", pszTargetName, "ptr", punkContextFrame, "uint", dwFlags, "ptr*", ppunkTargetFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkChildFrame 
     * @returns {HRESULT} 
     */
    OnChildFrameActivate(pUnkChildFrame) {
        result := ComCall(5, this, "ptr", pUnkChildFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkChildFrame 
     * @returns {HRESULT} 
     */
    OnChildFrameDeactivate(pUnkChildFrame) {
        result := ComCall(6, this, "ptr", pUnkChildFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {IBindCtx} pbc 
     * @param {IBindStatusCallback} pibsc 
     * @param {PWSTR} pszTargetName 
     * @param {PWSTR} pszUrl 
     * @param {PWSTR} pszLocation 
     * @returns {HRESULT} 
     */
    NavigateHack(grfHLNF, pbc, pibsc, pszTargetName, pszUrl, pszLocation) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszLocation := pszLocation is String ? StrPtr(pszLocation) : pszLocation

        result := ComCall(7, this, "uint", grfHLNF, "ptr", pbc, "ptr", pibsc, "ptr", pszTargetName, "ptr", pszUrl, "ptr", pszLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwID 
     * @param {Pointer<IUnknown>} ppunkBrowser 
     * @returns {HRESULT} 
     */
    FindBrowserByIndex(dwID, ppunkBrowser) {
        result := ComCall(8, this, "uint", dwID, "ptr*", ppunkBrowser, "HRESULT")
        return result
    }
}
