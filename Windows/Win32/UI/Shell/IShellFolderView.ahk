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
     * 
     * @param {LPARAM} lParamSort 
     * @returns {HRESULT} 
     */
    Rearrange(lParamSort) {
        result := ComCall(3, this, "ptr", lParamSort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LPARAM>} plParamSort 
     * @returns {HRESULT} 
     */
    GetArrangeParam(plParamSort) {
        result := ComCall(4, this, "ptr", plParamSort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ArrangeGrid() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AutoArrange() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetAutoArrange() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<UInt32>} puItem 
     * @returns {HRESULT} 
     */
    AddObject(pidl, puItem) {
        result := ComCall(8, this, "ptr", pidl, "uint*", puItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<ITEMIDLIST>} ppidl 
     * @param {Integer} uItem 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(ppidl, uItem) {
        result := ComCall(9, this, "ptr", ppidl, "uint", uItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<UInt32>} puItem 
     * @returns {HRESULT} 
     */
    RemoveObject(pidl, puItem) {
        result := ComCall(10, this, "ptr", pidl, "uint*", puItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puCount 
     * @returns {HRESULT} 
     */
    GetObjectCount(puCount) {
        result := ComCall(11, this, "uint*", puCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uCount 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetObjectCount(uCount, dwFlags) {
        result := ComCall(12, this, "uint", uCount, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlOld 
     * @param {Pointer<ITEMIDLIST>} pidlNew 
     * @param {Pointer<UInt32>} puItem 
     * @returns {HRESULT} 
     */
    UpdateObject(pidlOld, pidlNew, puItem) {
        result := ComCall(13, this, "ptr", pidlOld, "ptr", pidlNew, "uint*", puItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<UInt32>} puItem 
     * @returns {HRESULT} 
     */
    RefreshObject(pidl, puItem) {
        result := ComCall(14, this, "ptr", pidl, "uint*", puItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bRedraw 
     * @returns {HRESULT} 
     */
    SetRedraw(bRedraw) {
        result := ComCall(15, this, "int", bRedraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puSelected 
     * @returns {HRESULT} 
     */
    GetSelectedCount(puSelected) {
        result := ComCall(16, this, "uint*", puSelected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pppidl 
     * @param {Pointer<UInt32>} puItems 
     * @returns {HRESULT} 
     */
    GetSelectedObjects(pppidl, puItems) {
        result := ComCall(17, this, "ptr", pppidl, "uint*", puItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDropTarget>} pDropTarget 
     * @returns {HRESULT} 
     */
    IsDropOnSource(pDropTarget) {
        result := ComCall(18, this, "ptr", pDropTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     */
    GetDragPoint(ppt) {
        result := ComCall(19, this, "ptr", ppt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     */
    GetDropPoint(ppt) {
        result := ComCall(20, this, "ptr", ppt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} pDataObject 
     * @returns {HRESULT} 
     */
    MoveIcons(pDataObject) {
        result := ComCall(21, this, "ptr", pDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     */
    SetItemPos(pidl, ppt) {
        result := ComCall(22, this, "ptr", pidl, "ptr", ppt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDropTarget>} pDropTarget 
     * @returns {HRESULT} 
     */
    IsBkDropTarget(pDropTarget) {
        result := ComCall(23, this, "ptr", pDropTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bMove 
     * @returns {HRESULT} 
     */
    SetClipboard(bMove) {
        result := ComCall(24, this, "int", bMove, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} pDataObject 
     * @returns {HRESULT} 
     */
    SetPoints(pDataObject) {
        result := ComCall(25, this, "ptr", pDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMSPACING>} pSpacing 
     * @returns {HRESULT} 
     */
    GetItemSpacing(pSpacing) {
        result := ComCall(26, this, "ptr", pSpacing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellFolderViewCB>} pNewCB 
     * @param {Pointer<IShellFolderViewCB>} ppOldCB 
     * @returns {HRESULT} 
     */
    SetCallback(pNewCB, ppOldCB) {
        result := ComCall(27, this, "ptr", pNewCB, "ptr", ppOldCB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Select(dwFlags) {
        result := ComCall(28, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwSupport 
     * @returns {HRESULT} 
     */
    QuerySupport(pdwSupport) {
        result := ComCall(29, this, "uint*", pdwSupport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pdisp 
     * @returns {HRESULT} 
     */
    SetAutomationObject(pdisp) {
        result := ComCall(30, this, "ptr", pdisp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
