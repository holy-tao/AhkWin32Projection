#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDocHostUIHandler extends IUnknown{
    /**
     * The interface identifier for IDocHostUIHandler
     * @type {Guid}
     */
    static IID => Guid("{bd3f23c0-d43e-11cf-893b-00aa00bdce1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwID 
     * @param {Pointer<POINT>} ppt 
     * @param {Pointer<IUnknown>} pcmdtReserved 
     * @param {Pointer<IDispatch>} pdispReserved 
     * @returns {HRESULT} 
     */
    ShowContextMenu(dwID, ppt, pcmdtReserved, pdispReserved) {
        result := ComCall(3, this, "uint", dwID, "ptr", ppt, "ptr", pcmdtReserved, "ptr", pdispReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DOCHOSTUIINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetHostInfo(pInfo) {
        result := ComCall(4, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwID 
     * @param {Pointer<IOleInPlaceActiveObject>} pActiveObject 
     * @param {Pointer<IOleCommandTarget>} pCommandTarget 
     * @param {Pointer<IOleInPlaceFrame>} pFrame 
     * @param {Pointer<IOleInPlaceUIWindow>} pDoc 
     * @returns {HRESULT} 
     */
    ShowUI(dwID, pActiveObject, pCommandTarget, pFrame, pDoc) {
        result := ComCall(5, this, "uint", dwID, "ptr", pActiveObject, "ptr", pCommandTarget, "ptr", pFrame, "ptr", pDoc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HideUI() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateUI() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableModeless(fEnable) {
        result := ComCall(8, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     */
    OnDocWindowActivate(fActivate) {
        result := ComCall(9, this, "int", fActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     */
    OnFrameWindowActivate(fActivate) {
        result := ComCall(10, this, "int", fActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcBorder 
     * @param {Pointer<IOleInPlaceUIWindow>} pUIWindow 
     * @param {BOOL} fRameWindow 
     * @returns {HRESULT} 
     */
    ResizeBorder(prcBorder, pUIWindow, fRameWindow) {
        result := ComCall(11, this, "ptr", prcBorder, "ptr", pUIWindow, "int", fRameWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} lpMsg 
     * @param {Pointer<Guid>} pguidCmdGroup 
     * @param {Integer} nCmdID 
     * @returns {HRESULT} 
     */
    TranslateAccelerator(lpMsg, pguidCmdGroup, nCmdID) {
        result := ComCall(12, this, "ptr", lpMsg, "ptr", pguidCmdGroup, "uint", nCmdID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pchKey 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     */
    GetOptionKeyPath(pchKey, dw) {
        result := ComCall(13, this, "ptr", pchKey, "uint", dw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDropTarget>} pDropTarget 
     * @param {Pointer<IDropTarget>} ppDropTarget 
     * @returns {HRESULT} 
     */
    GetDropTarget(pDropTarget, ppDropTarget) {
        result := ComCall(14, this, "ptr", pDropTarget, "ptr", ppDropTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDispatch 
     * @returns {HRESULT} 
     */
    GetExternal(ppDispatch) {
        result := ComCall(15, this, "ptr", ppDispatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTranslate 
     * @param {PWSTR} pchURLIn 
     * @param {Pointer<PWSTR>} ppchURLOut 
     * @returns {HRESULT} 
     */
    TranslateUrl(dwTranslate, pchURLIn, ppchURLOut) {
        pchURLIn := pchURLIn is String ? StrPtr(pchURLIn) : pchURLIn

        result := ComCall(16, this, "uint", dwTranslate, "ptr", pchURLIn, "ptr", ppchURLOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} pDO 
     * @param {Pointer<IDataObject>} ppDORet 
     * @returns {HRESULT} 
     */
    FilterDataObject(pDO, ppDORet) {
        result := ComCall(17, this, "ptr", pDO, "ptr", ppDORet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
