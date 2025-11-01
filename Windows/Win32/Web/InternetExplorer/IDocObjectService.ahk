#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IDocObjectService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDocObjectService
     * @type {Guid}
     */
    static IID => Guid("{3050f801-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FireBeforeNavigate2", "FireNavigateComplete2", "FireDownloadBegin", "FireDownloadComplete", "FireDocumentComplete", "UpdateDesktopComponent", "GetPendingUrl", "ActiveElementChanged", "GetUrlSearchComponent", "IsErrorUrl"]

    /**
     * 
     * @param {IDispatch} pDispatch 
     * @param {PWSTR} lpszUrl 
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpszFrameName 
     * @param {Pointer<Integer>} pPostData 
     * @param {Integer} cbPostData 
     * @param {PWSTR} lpszHeaders 
     * @param {BOOL} fPlayNavSound 
     * @param {Pointer<BOOL>} pfCancel 
     * @returns {HRESULT} 
     */
    FireBeforeNavigate2(pDispatch, lpszUrl, dwFlags, lpszFrameName, pPostData, cbPostData, lpszHeaders, fPlayNavSound, pfCancel) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszFrameName := lpszFrameName is String ? StrPtr(lpszFrameName) : lpszFrameName
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        result := ComCall(3, this, "ptr", pDispatch, "ptr", lpszUrl, "uint", dwFlags, "ptr", lpszFrameName, "char*", pPostData, "uint", cbPostData, "ptr", lpszHeaders, "int", fPlayNavSound, "ptr", pfCancel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLWindow2} pHTMLWindow2 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    FireNavigateComplete2(pHTMLWindow2, dwFlags) {
        result := ComCall(4, this, "ptr", pHTMLWindow2, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDownloadBegin() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDownloadComplete() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLWindow2} pHTMLWindow 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    FireDocumentComplete(pHTMLWindow, dwFlags) {
        result := ComCall(7, this, "ptr", pHTMLWindow, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLWindow2} pHTMLWindow 
     * @returns {HRESULT} 
     */
    UpdateDesktopComponent(pHTMLWindow) {
        result := ComCall(8, this, "ptr", pHTMLWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPendingUrl 
     * @returns {HRESULT} 
     */
    GetPendingUrl(pbstrPendingUrl) {
        result := ComCall(9, this, "ptr", pbstrPendingUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pHTMLElement 
     * @returns {HRESULT} 
     */
    ActiveElementChanged(pHTMLElement) {
        result := ComCall(10, this, "ptr", pHTMLElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSearch 
     * @returns {HRESULT} 
     */
    GetUrlSearchComponent(pbstrSearch) {
        result := ComCall(11, this, "ptr", pbstrSearch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUrl 
     * @param {Pointer<BOOL>} pfIsError 
     * @returns {HRESULT} 
     */
    IsErrorUrl(lpszUrl, pfIsError) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        result := ComCall(12, this, "ptr", lpszUrl, "ptr", pfIsError, "HRESULT")
        return result
    }
}
