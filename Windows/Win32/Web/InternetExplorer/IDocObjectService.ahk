#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IDocObjectService extends IUnknown{
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
     * 
     * @param {Pointer<IDispatch>} pDispatch 
     * @param {PWSTR} lpszUrl 
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpszFrameName 
     * @param {Pointer<Byte>} pPostData 
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

        result := ComCall(3, this, "ptr", pDispatch, "ptr", lpszUrl, "uint", dwFlags, "ptr", lpszFrameName, "char*", pPostData, "uint", cbPostData, "ptr", lpszHeaders, "int", fPlayNavSound, "ptr", pfCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} pHTMLWindow2 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    FireNavigateComplete2(pHTMLWindow2, dwFlags) {
        result := ComCall(4, this, "ptr", pHTMLWindow2, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDownloadBegin() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FireDownloadComplete() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} pHTMLWindow 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    FireDocumentComplete(pHTMLWindow, dwFlags) {
        result := ComCall(7, this, "ptr", pHTMLWindow, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} pHTMLWindow 
     * @returns {HRESULT} 
     */
    UpdateDesktopComponent(pHTMLWindow) {
        result := ComCall(8, this, "ptr", pHTMLWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPendingUrl 
     * @returns {HRESULT} 
     */
    GetPendingUrl(pbstrPendingUrl) {
        result := ComCall(9, this, "ptr", pbstrPendingUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} pHTMLElement 
     * @returns {HRESULT} 
     */
    ActiveElementChanged(pHTMLElement) {
        result := ComCall(10, this, "ptr", pHTMLElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSearch 
     * @returns {HRESULT} 
     */
    GetUrlSearchComponent(pbstrSearch) {
        result := ComCall(11, this, "ptr", pbstrSearch, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(12, this, "ptr", lpszUrl, "ptr", pfIsError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
