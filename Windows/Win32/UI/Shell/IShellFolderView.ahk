#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\POINT.ahk
#Include .\ITEMSPACING.ahk
#Include .\IShellFolderViewCB.ahk
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
     * Rearrange may be altered or unavailable.
     * @param {LPARAM} lParamSort Type: <b>LPARAM</b>
     * 
     * Specifies how the rearrangement should be performed. 
     * 
     * 					
     * 
     * The lower sixteen bits of <i>lParamSort</i> define the sorting rule. Most applications set the sorting rule to the default value of zero, indicating that the items should be sorted by name. The system does not define any other sorting rules. Some folder objects might allow calling applications to use the lower sixteen bits of <i>lParamSort</i> to specify folder-specific sorting rules. The rules and their associated <i>lParamSort</i> values are defined by the folder.
     * 
     * When the system folder view object calls <b>IShellFolderView::Rearrange</b>, the lower sixteen bits of <i>lParamSort</i> are used to specify the column to be used for the arranging.
     * 
     * The upper sixteen bits of <i>lParamSort</i> are used for flags that modify the sorting rule. The system currently defines the following modifier flags.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-rearrange
     */
    Rearrange(lParamSort) {
        result := ComCall(3, this, "ptr", lParamSort, "HRESULT")
        return result
    }

    /**
     * Gets the arrangement parameter of the view, which is how the view has been sorted.
     * @returns {LPARAM} Type: <b>LPARAM*</b>
     * 
     * The lower sixteen bits of <i>plParamSort</i> define the sorting rule. Most applications set the sorting rule to the default value of zero, indicating that the items should be sorted by name. The system does not define any other sorting rules. Some folder objects might allow calling applications to use the lower sixteen bits of <i>plParamSort</i> to specify folder-specific sorting rules. The rules and their associated <i>plParamSort</i> values are defined by the folder.
     *     
     *     					
     * 
     * When the system folder view object calls <b>IShellFolderView::GetArrangeParam</b>, the lower sixteen bits of <i>plParamSort</i> are used to specify the column to be used for the arranging.
     * 
     * The upper sixteen bits of <i>plParamSort</i> are used for flags that modify the sorting rule. The system currently defines the following modifier flags.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-getarrangeparam
     */
    GetArrangeParam() {
        result := ComCall(4, this, "ptr*", &plParamSort := 0, "HRESULT")
        return plParamSort
    }

    /**
     * Arranges moved icons so that they align to an invisible grid.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-arrangegrid
     */
    ArrangeGrid() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * AutoArrange may be altered or unavailable.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, S_FALSE if the view is not in Auto Arrange mode, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-autoarrange
     */
    AutoArrange() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * GetAutoArrange may be altered or unavailable.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the folder is in Auto Arrange mode.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-getautoarrange
     */
    GetAutoArrange() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * AddObject may be altered or unavailable.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PUITEMID_CHILD</b>
     * 
     * A pointer to an ItemID that specifies the item to add to the view.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the index position of the added item.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-addobject
     */
    AddObject(pidl) {
        result := ComCall(8, this, "ptr", pidl, "uint*", &puItem := 0, "HRESULT")
        return puItem
    }

    /**
     * Gets an item from the view.
     * @param {Integer} uItem Type: <b>UINT</b>
     * 
     * The index of the item in the view to get.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PITEMID_CHILD*</b>
     * 
     * When this method returns, contains the address of a pointer to the item at the given index.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-getobject
     */
    GetObject(uItem) {
        result := ComCall(9, this, "ptr*", &ppidl := 0, "uint", uItem, "HRESULT")
        return ppidl
    }

    /**
     * RemoveObject may be altered or unavailable.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PUITEMID_CHILD</b>
     * 
     * A pointer to the item to remove from the view. This value can be <b>NULL</b>. When using the system folder view object (DefView) under Windows XP and Windows Vista, a <b>NULL</b> value results in the removal of all objects from the view.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the index position of the removed item.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-removeobject
     */
    RemoveObject(pidl) {
        result := ComCall(10, this, "ptr", pidl, "uint*", &puItem := 0, "HRESULT")
        return puItem
    }

    /**
     * Gets the number of items in the folder view.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the number of items displayed in the folder view.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-getobjectcount
     */
    GetObjectCount() {
        result := ComCall(11, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * SetObjectCount is no longer available.
     * @param {Integer} uCount Type: <b>UINT</b>
     * 
     * The number of items to set the ListView control to.
     * @param {Integer} dwFlags Type: <b>UINT</b>
     * 
     * Flags that control the behavior of the ListView control when the number of items is set. Includes the following:
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. Starting with Windows Vista, calls to <b>SetObjectCount</b> always return E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-setobjectcount
     */
    SetObjectCount(uCount, dwFlags) {
        result := ComCall(12, this, "uint", uCount, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * UpdateObject may be altered or unavailable.
     * @param {Pointer<ITEMIDLIST>} pidlOld Type: <b>PUITEMID_CHILD</b>
     * 
     * The original item.
     * @param {Pointer<ITEMIDLIST>} pidlNew Type: <b>PUITEMID_CHILD</b>
     * 
     * The new item.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the index of the item that was replaced. You can use this value to call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobject">IShellFolderView::GetObject</a> on later to get back the PITEMID_CHILD that you just added.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-updateobject
     */
    UpdateObject(pidlOld, pidlNew) {
        result := ComCall(13, this, "ptr", pidlOld, "ptr", pidlNew, "uint*", &puItem := 0, "HRESULT")
        return puItem
    }

    /**
     * RefreshObject may be altered or unavailable.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PUITEMID_CHILD</b>
     * 
     * The item to be redrawn.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the index of the item that was redrawn. You can use this value to call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobject">IShellFolderView::GetObject</a> to retrieve the PITEMID_CHILD that you just redrew.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-refreshobject
     */
    RefreshObject(pidl) {
        result := ComCall(14, this, "ptr", pidl, "uint*", &puItem := 0, "HRESULT")
        return puItem
    }

    /**
     * Allows a view to be redrawn or prevents it from being redrawn.
     * @param {BOOL} bRedraw Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the content can be redrawn after a change; <b>FALSE</b> if the content cannot be redrawn after a change.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-setredraw
     */
    SetRedraw(bRedraw) {
        result := ComCall(15, this, "int", bRedraw, "HRESULT")
        return result
    }

    /**
     * Gets the number of items in the view that are selected.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the number of selected items in the view.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-getselectedcount
     */
    GetSelectedCount() {
        result := ComCall(16, this, "uint*", &puSelected := 0, "HRESULT")
        return puSelected
    }

    /**
     * Gets an array of the objects in the view that are selected and the number of those objects.
     * @param {Pointer<Pointer<Pointer<ITEMIDLIST>>>} pppidl Type: <b>PCUITEMID_CHILD**</b>
     * 
     * The address of a pointer that, when this method returns successfully, points to an array of the currently selected items in the view. The calling application is expected to free the array at <i>pppidl</i> using <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>. The calling application must not free the individual items contained in the array.
     * @param {Pointer<Integer>} puItems Type: <b>UINT*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the number of items in the <i>pppidl</i> array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-getselectedobjects
     */
    GetSelectedObjects(pppidl, puItems) {
        pppidlMarshal := pppidl is VarRef ? "ptr*" : "ptr"
        puItemsMarshal := puItems is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pppidlMarshal, pppidl, puItemsMarshal, puItems, "HRESULT")
        return result
    }

    /**
     * Checks whether the destination of the current drag-and-drop or cut-and-paste operation is the same as the source.
     * @param {IDropTarget} pDropTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a>*</b>
     * 
     * A pointer to a destination drop target object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if the destination is the same as the source.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-isdroponsource
     */
    IsDropOnSource(pDropTarget) {
        result := ComCall(18, this, "ptr", pDropTarget, "HRESULT")
        return result
    }

    /**
     * Gets the point at which the current drag-and-drop operation was initiated.
     * @returns {POINT} Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to a structure that, when this method returns successfully, receives the coordinates from which the current drag-and-drop operation was initiated.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-getdragpoint
     */
    GetDragPoint() {
        ppt := POINT()
        result := ComCall(19, this, "ptr", ppt, "HRESULT")
        return ppt
    }

    /**
     * Gets the point at which the current drag-and-drop operation was terminated.
     * @returns {POINT} Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to a structure that, when this method returns successfully, receives the coordinates at which the current drag-and-drop operation was terminated.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-getdroppoint
     */
    GetDropPoint() {
        ppt := POINT()
        result := ComCall(20, this, "ptr", ppt, "HRESULT")
        return ppt
    }

    /**
     * This method is not implemented.
     * @param {IDataObject} pDataObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method is not implemented.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-moveicons
     */
    MoveIcons(pDataObject) {
        result := ComCall(21, this, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * Sets the position of the given item.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A PIDL that corresponds to the item for which the position is being set.
     * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to a structure that contains the new coordinates of the item relative to the ListView contained in the view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-setitempos
     */
    SetItemPos(pidl, ppt) {
        result := ComCall(22, this, "ptr", pidl, "ptr", ppt, "HRESULT")
        return result
    }

    /**
     * IsBkDropTarget may be altered or unavailable.
     * @param {IDropTarget} pDropTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a>*</b>
     * 
     * A pointer to the target of the drag-and-drop operation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the target of the drag-and-drop operation is to the background of the view, S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-isbkdroptarget
     */
    IsBkDropTarget(pDropTarget) {
        result := ComCall(23, this, "ptr", pDropTarget, "HRESULT")
        return result
    }

    /**
     * SetClipboard may be altered or unavailable.
     * @param {BOOL} bMove Type: <b>BOOL</b>
     * 
     * Must be <b>TRUE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-setclipboard
     */
    SetClipboard(bMove) {
        result := ComCall(24, this, "int", bMove, "HRESULT")
        return result
    }

    /**
     * SetPoints may be altered or unavailable.
     * @param {IDataObject} pDataObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to the data object. This data object contains the points of location of the current selection. These points are given in coordinates relative to the ListView control that the view contains. These points can be used for positioning the object at the end of a drag-and-drop operation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-setpoints
     */
    SetPoints(pDataObject) {
        result := ComCall(25, this, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * Gets the spacing for small and large view modes only.
     * @returns {ITEMSPACING} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-itemspacing">ITEMSPACING</a>*</b>
     * 
     * A pointer to a structure that, when this method returns successfully, receives the information that describes the view mode spacing.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-getitemspacing
     */
    GetItemSpacing() {
        pSpacing := ITEMSPACING()
        result := ComCall(26, this, "ptr", pSpacing, "HRESULT")
        return pSpacing
    }

    /**
     * IShellFolderView::SetCallback may be altered or unavailable.
     * @param {IShellFolderViewCB} pNewCB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishellfolderviewcb">IShellFolderViewCB</a>*</b>
     * 
     * A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishellfolderviewcb">IShellFolderViewCB</a> callback object.
     * @returns {IShellFolderViewCB} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishellfolderviewcb">IShellFolderViewCB</a>**</b>
     * 
     * The address of an interface pointer that, when this method returns successfully, points to the original <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishellfolderviewcb">IShellFolderViewCB</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-setcallback
     */
    SetCallback(pNewCB) {
        result := ComCall(27, this, "ptr", pNewCB, "ptr*", &ppOldCB := 0, "HRESULT")
        return IShellFolderViewCB(ppOldCB)
    }

    /**
     * IShellFolderView::Select may be altered or unavailable.
     * @param {Integer} dwFlags Type: <b>UINT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-select
     */
    Select(dwFlags) {
        result := ComCall(28, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * QuerySupport may be altered or unavailable.
     * @param {Pointer<Integer>} pdwSupport Type: <b>UINT*</b>
     * 
     * Reserved. Must be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method is not implemented.
     * 
     * Always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-querysupport
     */
    QuerySupport(pdwSupport) {
        pdwSupportMarshal := pdwSupport is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, pdwSupportMarshal, pdwSupport, "HRESULT")
        return result
    }

    /**
     * Replaces the internal automation object of the IShellView.
     * @param {IDispatch} pdisp Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>*</b>
     * 
     * A pointer to the new automation object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishellfolderview-setautomationobject
     */
    SetAutomationObject(pdisp) {
        result := ComCall(30, this, "ptr", pdisp, "HRESULT")
        return result
    }
}
