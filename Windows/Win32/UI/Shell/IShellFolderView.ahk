#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\IShellFolderViewCB.ahk" { IShellFolderViewCB }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\ITEMSPACING.ahk" { ITEMSPACING }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Ole\IDropTarget.ahk" { IDropTarget }

/**
 * Exposes methods that manipulate Shell folder views.
 * @remarks
 * <b>IShellFolderView</b> is supported by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> object that is returned from <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderviewex">SHCreateShellFolderViewEx</a>.  This object contains a ListView control and some of the methods on <b>IShellFolderView</b> directly manipulate this ListView control.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-ishellfolderview
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellFolderView extends IUnknown {
    /**
     * The interface identifier for IShellFolderView
     * @type {Guid}
     */
    static IID := Guid("{37a378c0-f82d-11ce-ae65-08002b2e1262}")

    /**
     * The class identifier for ShellFolderView
     * @type {Guid}
     */
    static CLSID := Guid("{62112aa1-ebe4-11cf-a5fb-0020afe7292d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellFolderView interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Rearrange           : IntPtr
        GetArrangeParam     : IntPtr
        ArrangeGrid         : IntPtr
        AutoArrange         : IntPtr
        GetAutoArrange      : IntPtr
        AddObject           : IntPtr
        GetObject           : IntPtr
        RemoveObject        : IntPtr
        GetObjectCount      : IntPtr
        SetObjectCount      : IntPtr
        UpdateObject        : IntPtr
        RefreshObject       : IntPtr
        SetRedraw           : IntPtr
        GetSelectedCount    : IntPtr
        GetSelectedObjects  : IntPtr
        IsDropOnSource      : IntPtr
        GetDragPoint        : IntPtr
        GetDropPoint        : IntPtr
        MoveIcons           : IntPtr
        SetItemPos          : IntPtr
        IsBkDropTarget      : IntPtr
        SetClipboard        : IntPtr
        SetPoints           : IntPtr
        GetItemSpacing      : IntPtr
        SetCallback         : IntPtr
        Select              : IntPtr
        QuerySupport        : IntPtr
        SetAutomationObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellFolderView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Rearrange may be altered or unavailable.
     * @remarks
     * <h3><a id="Note_to_Calling_Applications"></a><a id="note_to_calling_applications"></a><a id="NOTE_TO_CALLING_APPLICATIONS"></a>Note to Calling Applications</h3>
     * Do not set the <b>SHCIDS_ALLFIELDS</b> flag in <i>lParamSort</i> if the folder object does not support <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder2">IShellFolder2</a>. Doing so might have unpredictable results. If you use the <b>SHCIDS_ALLFIELDS</b> flag, the lower sixteen bits of <i>lParamSort</i> must be set to zero.
     * 
     * <h3><a id="Note_to_Implementers"></a><a id="note_to_implementers"></a><a id="NOTE_TO_IMPLEMENTERS"></a>Note to Implementers</h3>
     * To extract the sorting rule, use a bitwise AND operator (&amp;) to combine <i>lParamSort</i> with SHCIDS_COLUMNMASK (0X0000FFFF). This operation masks off the upper sixteen bits of <i>lParamSort</i>, including the <b>SHCIDS_ALLFIELDS</b> value.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-rearrange
     */
    Rearrange(lParamSort) {
        result := ComCall(3, this, LPARAM, lParamSort, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getarrangeparam
     */
    GetArrangeParam() {
        result := ComCall(4, this, LPARAM.Ptr, &plParamSort := 0, "HRESULT")
        return plParamSort
    }

    /**
     * Arranges moved icons so that they align to an invisible grid.
     * @remarks
     * This method has the same effect as selecting <b>View | Arrange Icons By | Align to Grid</b> in Windows Explorer on Windows XP, and also the same as right-clicking the desktop and selecting <b>Arrange Icons By | Align to Grid</b> on Windows XP or Windows Vista.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-arrangegrid
     */
    ArrangeGrid() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * AutoArrange may be altered or unavailable.
     * @remarks
     * This method has the same effect as selecting <b>View | Arrange Icons By | Auto Arrange</b> in Windows Explorer on Windows XP, and also the same as right-clicking the desktop and selecting <b>Arrange Icons By | Auto Arrange</b> on Windows XP or Windows Vista.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, S_FALSE if the view is not in Auto Arrange mode, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-autoarrange
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
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getautoarrange
     */
    GetAutoArrange() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * AddObject may be altered or unavailable.
     * @remarks
     * If you immediately call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobject">IShellFolderView::GetObject</a> with this index, you will get a copy of the ITEMID_CHILD that you added.  However, the index position of an item may change over time, so code cannot trust that any specific index always returns the same ITEMID_CHILD.
     * 
     * Items added through this method can be removed from the view by the data source at any time.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PUITEMID_CHILD</b>
     * 
     * A pointer to an ItemID that specifies the item to add to the view.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the index position of the added item.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-addobject
     */
    AddObject(pidl) {
        result := ComCall(8, this, ITEMIDLIST.Ptr, pidl, "uint*", &puItem := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobject
     */
    GetObject(uItem) {
        result := ComCall(9, this, "ptr*", &ppidl := 0, "uint", uItem, "HRESULT")
        return ppidl
    }

    /**
     * RemoveObject may be altered or unavailable.
     * @remarks
     * Items removed through this method can be readded to the view by the data source at any time.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PUITEMID_CHILD</b>
     * 
     * A pointer to the item to remove from the view. This value can be <b>NULL</b>. When using the system folder view object (DefView) under Windows XP and Windows Vista, a <b>NULL</b> value results in the removal of all objects from the view.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the index position of the removed item.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-removeobject
     */
    RemoveObject(pidl) {
        result := ComCall(10, this, ITEMIDLIST.Ptr, pidl, "uint*", &puItem := 0, "HRESULT")
        return puItem
    }

    /**
     * Gets the number of items in the folder view.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the number of items displayed in the folder view.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobjectcount
     */
    GetObjectCount() {
        result := ComCall(11, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * SetObjectCount is no longer available.
     * @remarks
     * This method sends LVM_SETITEMCOUNT to the ListView control that the view contains, with WPARAM equal to <i>uCount</i> and LPARAM equal to <i>dwFlags</i>.
     * @param {Integer} uCount Type: <b>UINT</b>
     * 
     * The number of items to set the ListView control to.
     * @param {Integer} dwFlags Type: <b>UINT</b>
     * 
     * Flags that control the behavior of the ListView control when the number of items is set. Includes the following:
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. Starting with Windows Vista, calls to <b>SetObjectCount</b> always return E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setobjectcount
     */
    SetObjectCount(uCount, dwFlags) {
        result := ComCall(12, this, "uint", uCount, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * UpdateObject may be altered or unavailable.
     * @remarks
     * If you immediately call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobject">IShellFolderView::GetObject</a> with the index returned by <i>puItem</i>, you will get a copy of the ITEMID_CHILD that you added.  However, the index position of an item may change over time, so code cannot trust that any specific index always returns the same ITEMID_CHILD.
     * 
     * Changes made through this method can be discarded in the view by the data source at any time.
     * @param {Pointer<ITEMIDLIST>} pidlOld Type: <b>PUITEMID_CHILD</b>
     * 
     * The original item.
     * @param {Pointer<ITEMIDLIST>} pidlNew Type: <b>PUITEMID_CHILD</b>
     * 
     * The new item.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the index of the item that was replaced. You can use this value to call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobject">IShellFolderView::GetObject</a> on later to get back the PITEMID_CHILD that you just added.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-updateobject
     */
    UpdateObject(pidlOld, pidlNew) {
        result := ComCall(13, this, ITEMIDLIST.Ptr, pidlOld, ITEMIDLIST.Ptr, pidlNew, "uint*", &puItem := 0, "HRESULT")
        return puItem
    }

    /**
     * RefreshObject may be altered or unavailable.
     * @remarks
     * If you immediately call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobject">IShellFolderView::GetObject</a> with the index returned by <i>puItem</i>, you will get a copy of the ITEMID_CHILD that you redrew.  However, the index position of an item may change over time, so code cannot trust that any specific index always returns the same ITEMID_CHILD.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PUITEMID_CHILD</b>
     * 
     * The item to be redrawn.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the index of the item that was redrawn. You can use this value to call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishellfolderview-getobject">IShellFolderView::GetObject</a> to retrieve the PITEMID_CHILD that you just redrew.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-refreshobject
     */
    RefreshObject(pidl) {
        result := ComCall(14, this, ITEMIDLIST.Ptr, pidl, "uint*", &puItem := 0, "HRESULT")
        return puItem
    }

    /**
     * Allows a view to be redrawn or prevents it from being redrawn.
     * @remarks
     * This method sends the <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-setredraw">WM_SETREDRAW</a> message to the ListView object that the view contains.
     * @param {BOOL} bRedraw Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the content can be redrawn after a change; <b>FALSE</b> if the content cannot be redrawn after a change.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setredraw
     */
    SetRedraw(bRedraw) {
        result := ComCall(15, this, BOOL, bRedraw, "HRESULT")
        return result
    }

    /**
     * Gets the number of items in the view that are selected.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the number of selected items in the view.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getselectedcount
     */
    GetSelectedCount() {
        result := ComCall(16, this, "uint*", &puSelected := 0, "HRESULT")
        return puSelected
    }

    /**
     * Gets an array of the objects in the view that are selected and the number of those objects.
     * @remarks
     * This method provides constant pointers to internal data structures. The calling application is expected to act on them immediately and not cache them.
     * @param {Pointer<Pointer<Pointer<ITEMIDLIST>>>} pppidl Type: <b>PCUITEMID_CHILD**</b>
     * 
     * The address of a pointer that, when this method returns successfully, points to an array of the currently selected items in the view. The calling application is expected to free the array at <i>pppidl</i> using <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>. The calling application must not free the individual items contained in the array.
     * @param {Pointer<Integer>} puItems Type: <b>UINT*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the number of items in the <i>pppidl</i> array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getselectedobjects
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
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-isdroponsource
     */
    IsDropOnSource(pDropTarget) {
        result := ComCall(18, this, "ptr", pDropTarget, "HRESULT")
        return result
    }

    /**
     * Gets the point at which the current drag-and-drop operation was initiated.
     * @returns {POINT} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * A pointer to a structure that, when this method returns successfully, receives the coordinates from which the current drag-and-drop operation was initiated.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getdragpoint
     */
    GetDragPoint() {
        ppt := POINT()
        result := ComCall(19, this, POINT.Ptr, ppt, "HRESULT")
        return ppt
    }

    /**
     * Gets the point at which the current drag-and-drop operation was terminated.
     * @returns {POINT} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * A pointer to a structure that, when this method returns successfully, receives the coordinates at which the current drag-and-drop operation was terminated.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getdroppoint
     */
    GetDropPoint() {
        ppt := POINT()
        result := ComCall(20, this, POINT.Ptr, ppt, "HRESULT")
        return ppt
    }

    /**
     * This method is not implemented. (IShellFolderView.MoveIcons)
     * @param {IDataObject} pDataObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method is not implemented.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-moveicons
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
     * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * A pointer to a structure that contains the new coordinates of the item relative to the ListView contained in the view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setitempos
     */
    SetItemPos(pidl, ppt) {
        result := ComCall(22, this, ITEMIDLIST.Ptr, pidl, POINT.Ptr, ppt, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-isbkdroptarget
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setclipboard
     */
    SetClipboard(bMove) {
        result := ComCall(24, this, BOOL, bMove, "HRESULT")
        return result
    }

    /**
     * SetPoints may be altered or unavailable.
     * @remarks
     * This call is not needed if the drag-and-drop operation was originated by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>.
     * @param {IDataObject} pDataObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to the data object. This data object contains the points of location of the current selection. These points are given in coordinates relative to the ListView control that the view contains. These points can be used for positioning the object at the end of a drag-and-drop operation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setpoints
     */
    SetPoints(pDataObject) {
        result := ComCall(25, this, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * Gets the spacing for small and large view modes only.
     * @remarks
     * This method sends an <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-getitemspacing">LVM_GETITEMSPACING</a> message to get the view mode spacing.
     * 
     * This method retrieves mode spacing for only the large and small view modes.
     * 
     * In Windows Vista and later, this method stores the small view mode spacing in both pairs of values returned in the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-itemspacing">ITEMSPACING</a> structure.
     * @returns {ITEMSPACING} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-itemspacing">ITEMSPACING</a>*</b>
     * 
     * A pointer to a structure that, when this method returns successfully, receives the information that describes the view mode spacing.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-getitemspacing
     */
    GetItemSpacing() {
        pSpacing := ITEMSPACING()
        result := ComCall(26, this, ITEMSPACING.Ptr, pSpacing, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setcallback
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-select
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
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-querysupport
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderview-setautomationobject
     */
    SetAutomationObject(pdisp) {
        result := ComCall(30, this, "ptr", pdisp, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellFolderView.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Rearrange := CallbackCreate(GetMethod(implObj, "Rearrange"), flags, 2)
        this.vtbl.GetArrangeParam := CallbackCreate(GetMethod(implObj, "GetArrangeParam"), flags, 2)
        this.vtbl.ArrangeGrid := CallbackCreate(GetMethod(implObj, "ArrangeGrid"), flags, 1)
        this.vtbl.AutoArrange := CallbackCreate(GetMethod(implObj, "AutoArrange"), flags, 1)
        this.vtbl.GetAutoArrange := CallbackCreate(GetMethod(implObj, "GetAutoArrange"), flags, 1)
        this.vtbl.AddObject := CallbackCreate(GetMethod(implObj, "AddObject"), flags, 3)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 3)
        this.vtbl.RemoveObject := CallbackCreate(GetMethod(implObj, "RemoveObject"), flags, 3)
        this.vtbl.GetObjectCount := CallbackCreate(GetMethod(implObj, "GetObjectCount"), flags, 2)
        this.vtbl.SetObjectCount := CallbackCreate(GetMethod(implObj, "SetObjectCount"), flags, 3)
        this.vtbl.UpdateObject := CallbackCreate(GetMethod(implObj, "UpdateObject"), flags, 4)
        this.vtbl.RefreshObject := CallbackCreate(GetMethod(implObj, "RefreshObject"), flags, 3)
        this.vtbl.SetRedraw := CallbackCreate(GetMethod(implObj, "SetRedraw"), flags, 2)
        this.vtbl.GetSelectedCount := CallbackCreate(GetMethod(implObj, "GetSelectedCount"), flags, 2)
        this.vtbl.GetSelectedObjects := CallbackCreate(GetMethod(implObj, "GetSelectedObjects"), flags, 3)
        this.vtbl.IsDropOnSource := CallbackCreate(GetMethod(implObj, "IsDropOnSource"), flags, 2)
        this.vtbl.GetDragPoint := CallbackCreate(GetMethod(implObj, "GetDragPoint"), flags, 2)
        this.vtbl.GetDropPoint := CallbackCreate(GetMethod(implObj, "GetDropPoint"), flags, 2)
        this.vtbl.MoveIcons := CallbackCreate(GetMethod(implObj, "MoveIcons"), flags, 2)
        this.vtbl.SetItemPos := CallbackCreate(GetMethod(implObj, "SetItemPos"), flags, 3)
        this.vtbl.IsBkDropTarget := CallbackCreate(GetMethod(implObj, "IsBkDropTarget"), flags, 2)
        this.vtbl.SetClipboard := CallbackCreate(GetMethod(implObj, "SetClipboard"), flags, 2)
        this.vtbl.SetPoints := CallbackCreate(GetMethod(implObj, "SetPoints"), flags, 2)
        this.vtbl.GetItemSpacing := CallbackCreate(GetMethod(implObj, "GetItemSpacing"), flags, 2)
        this.vtbl.SetCallback := CallbackCreate(GetMethod(implObj, "SetCallback"), flags, 3)
        this.vtbl.Select := CallbackCreate(GetMethod(implObj, "Select"), flags, 2)
        this.vtbl.QuerySupport := CallbackCreate(GetMethod(implObj, "QuerySupport"), flags, 2)
        this.vtbl.SetAutomationObject := CallbackCreate(GetMethod(implObj, "SetAutomationObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Rearrange)
        CallbackFree(this.vtbl.GetArrangeParam)
        CallbackFree(this.vtbl.ArrangeGrid)
        CallbackFree(this.vtbl.AutoArrange)
        CallbackFree(this.vtbl.GetAutoArrange)
        CallbackFree(this.vtbl.AddObject)
        CallbackFree(this.vtbl.GetObject)
        CallbackFree(this.vtbl.RemoveObject)
        CallbackFree(this.vtbl.GetObjectCount)
        CallbackFree(this.vtbl.SetObjectCount)
        CallbackFree(this.vtbl.UpdateObject)
        CallbackFree(this.vtbl.RefreshObject)
        CallbackFree(this.vtbl.SetRedraw)
        CallbackFree(this.vtbl.GetSelectedCount)
        CallbackFree(this.vtbl.GetSelectedObjects)
        CallbackFree(this.vtbl.IsDropOnSource)
        CallbackFree(this.vtbl.GetDragPoint)
        CallbackFree(this.vtbl.GetDropPoint)
        CallbackFree(this.vtbl.MoveIcons)
        CallbackFree(this.vtbl.SetItemPos)
        CallbackFree(this.vtbl.IsBkDropTarget)
        CallbackFree(this.vtbl.SetClipboard)
        CallbackFree(this.vtbl.SetPoints)
        CallbackFree(this.vtbl.GetItemSpacing)
        CallbackFree(this.vtbl.SetCallback)
        CallbackFree(this.vtbl.Select)
        CallbackFree(this.vtbl.QuerySupport)
        CallbackFree(this.vtbl.SetAutomationObject)
    }
}
