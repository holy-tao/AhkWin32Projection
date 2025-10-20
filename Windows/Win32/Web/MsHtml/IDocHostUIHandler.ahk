#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDocHostUIHandler extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContextMenu", "GetHostInfo", "ShowUI", "HideUI", "UpdateUI", "EnableModeless", "OnDocWindowActivate", "OnFrameWindowActivate", "ResizeBorder", "TranslateAccelerator", "GetOptionKeyPath", "GetDropTarget", "GetExternal", "TranslateUrl", "FilterDataObject"]

    /**
     * 
     * @param {Integer} dwID 
     * @param {Pointer<POINT>} ppt 
     * @param {IUnknown} pcmdtReserved 
     * @param {IDispatch} pdispReserved 
     * @returns {HRESULT} 
     */
    ShowContextMenu(dwID, ppt, pcmdtReserved, pdispReserved) {
        result := ComCall(3, this, "uint", dwID, "ptr", ppt, "ptr", pcmdtReserved, "ptr", pdispReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DOCHOSTUIINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetHostInfo(pInfo) {
        result := ComCall(4, this, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwID 
     * @param {IOleInPlaceActiveObject} pActiveObject 
     * @param {IOleCommandTarget} pCommandTarget 
     * @param {IOleInPlaceFrame} pFrame 
     * @param {IOleInPlaceUIWindow} pDoc 
     * @returns {HRESULT} 
     */
    ShowUI(dwID, pActiveObject, pCommandTarget, pFrame, pDoc) {
        result := ComCall(5, this, "uint", dwID, "ptr", pActiveObject, "ptr", pCommandTarget, "ptr", pFrame, "ptr", pDoc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HideUI() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateUI() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableModeless(fEnable) {
        result := ComCall(8, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     */
    OnDocWindowActivate(fActivate) {
        result := ComCall(9, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     */
    OnFrameWindowActivate(fActivate) {
        result := ComCall(10, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcBorder 
     * @param {IOleInPlaceUIWindow} pUIWindow 
     * @param {BOOL} fRameWindow 
     * @returns {HRESULT} 
     */
    ResizeBorder(prcBorder, pUIWindow, fRameWindow) {
        result := ComCall(11, this, "ptr", prcBorder, "ptr", pUIWindow, "int", fRameWindow, "HRESULT")
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
        result := ComCall(12, this, "ptr", lpMsg, "ptr", pguidCmdGroup, "uint", nCmdID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pchKey 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     */
    GetOptionKeyPath(pchKey, dw) {
        result := ComCall(13, this, "ptr", pchKey, "uint", dw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDropTarget} pDropTarget 
     * @param {Pointer<IDropTarget>} ppDropTarget 
     * @returns {HRESULT} 
     */
    GetDropTarget(pDropTarget, ppDropTarget) {
        result := ComCall(14, this, "ptr", pDropTarget, "ptr*", ppDropTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDispatch 
     * @returns {HRESULT} 
     */
    GetExternal(ppDispatch) {
        result := ComCall(15, this, "ptr*", ppDispatch, "HRESULT")
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

        result := ComCall(16, this, "uint", dwTranslate, "ptr", pchURLIn, "ptr", ppchURLOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pDO 
     * @param {Pointer<IDataObject>} ppDORet 
     * @returns {HRESULT} 
     */
    FilterDataObject(pDO, ppDORet) {
        result := ComCall(17, this, "ptr", pDO, "ptr*", ppDORet, "HRESULT")
        return result
    }
}
