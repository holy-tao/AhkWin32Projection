#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that manipulate Shell folder views.
 * @remarks
 * 
  * <b>IShellFolderView</b> is supported by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> object that is returned from <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderviewex">SHCreateShellFolderViewEx</a>.  This object contains a ListView control and some of the methods on <b>IShellFolderView</b> directly manipulate this ListView control.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-ishellfolderview
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolderView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFolderView
     * @type {Guid}
     */
    static IID => Guid("{37a378c0-f82d-11ce-ae65-08002b2e1262}")

    /**
     * The class identifier for ShellFolderView
     * @type {Guid}
     */
    static CLSID => Guid("{62112aa1-ebe4-11cf-a5fb-0020afe7292d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Rearrange", "GetArrangeParam", "ArrangeGrid", "AutoArrange", "GetAutoArrange", "AddObject", "GetObject", "RemoveObject", "GetObjectCount", "SetObjectCount", "UpdateObject", "RefreshObject", "SetRedraw", "GetSelectedCount", "GetSelectedObjects", "IsDropOnSource", "GetDragPoint", "GetDropPoint", "MoveIcons", "SetItemPos", "IsBkDropTarget", "SetClipboard", "SetPoints", "GetItemSpacing", "SetCallback", "Select", "QuerySupport", "SetAutomationObject"]

    /**
     * 
     * @param {LPARAM} lParamSort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-rearrange
     */
    Rearrange(lParamSort) {
        result := ComCall(3, this, "ptr", lParamSort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPARAM>} plParamSort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getarrangeparam
     */
    GetArrangeParam(plParamSort) {
        result := ComCall(4, this, "ptr", plParamSort, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-arrangegrid
     */
    ArrangeGrid() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-autoarrange
     */
    AutoArrange() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getautoarrange
     */
    GetAutoArrange() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<Integer>} puItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-addobject
     */
    AddObject(pidl, puItem) {
        puItemMarshal := puItem is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pidl, puItemMarshal, puItem, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidl 
     * @param {Integer} uItem 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(ppidl, uItem) {
        ppidlMarshal := ppidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, ppidlMarshal, ppidl, "uint", uItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<Integer>} puItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-removeobject
     */
    RemoveObject(pidl, puItem) {
        puItemMarshal := puItem is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", pidl, puItemMarshal, puItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobjectcount
     */
    GetObjectCount(puCount) {
        puCountMarshal := puCount is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, puCountMarshal, puCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uCount 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setobjectcount
     */
    SetObjectCount(uCount, dwFlags) {
        result := ComCall(12, this, "uint", uCount, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlOld 
     * @param {Pointer<ITEMIDLIST>} pidlNew 
     * @param {Pointer<Integer>} puItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-updateobject
     */
    UpdateObject(pidlOld, pidlNew, puItem) {
        puItemMarshal := puItem is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pidlOld, "ptr", pidlNew, puItemMarshal, puItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<Integer>} puItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-refreshobject
     */
    RefreshObject(pidl, puItem) {
        puItemMarshal := puItem is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", pidl, puItemMarshal, puItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bRedraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setredraw
     */
    SetRedraw(bRedraw) {
        result := ComCall(15, this, "int", bRedraw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puSelected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getselectedcount
     */
    GetSelectedCount(puSelected) {
        puSelectedMarshal := puSelected is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, puSelectedMarshal, puSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Pointer<ITEMIDLIST>>>} pppidl 
     * @param {Pointer<Integer>} puItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getselectedobjects
     */
    GetSelectedObjects(pppidl, puItems) {
        pppidlMarshal := pppidl is VarRef ? "ptr*" : "ptr"
        puItemsMarshal := puItems is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pppidlMarshal, pppidl, puItemsMarshal, puItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDropTarget} pDropTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-isdroponsource
     */
    IsDropOnSource(pDropTarget) {
        result := ComCall(18, this, "ptr", pDropTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getdragpoint
     */
    GetDragPoint(ppt) {
        result := ComCall(19, this, "ptr", ppt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getdroppoint
     */
    GetDropPoint(ppt) {
        result := ComCall(20, this, "ptr", ppt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-moveicons
     */
    MoveIcons(pDataObject) {
        result := ComCall(21, this, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setitempos
     */
    SetItemPos(pidl, ppt) {
        result := ComCall(22, this, "ptr", pidl, "ptr", ppt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDropTarget} pDropTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-isbkdroptarget
     */
    IsBkDropTarget(pDropTarget) {
        result := ComCall(23, this, "ptr", pDropTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bMove 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setclipboard
     */
    SetClipboard(bMove) {
        result := ComCall(24, this, "int", bMove, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setpoints
     */
    SetPoints(pDataObject) {
        result := ComCall(25, this, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMSPACING>} pSpacing 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getitemspacing
     */
    GetItemSpacing(pSpacing) {
        result := ComCall(26, this, "ptr", pSpacing, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellFolderViewCB} pNewCB 
     * @param {Pointer<IShellFolderViewCB>} ppOldCB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setcallback
     */
    SetCallback(pNewCB, ppOldCB) {
        result := ComCall(27, this, "ptr", pNewCB, "ptr*", ppOldCB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-select
     */
    Select(dwFlags) {
        result := ComCall(28, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSupport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-querysupport
     */
    QuerySupport(pdwSupport) {
        pdwSupportMarshal := pdwSupport is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, pdwSupportMarshal, pdwSupport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pdisp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setautomationobject
     */
    SetAutomationObject(pdisp) {
        result := ComCall(30, this, "ptr", pdisp, "HRESULT")
        return result
    }
}
