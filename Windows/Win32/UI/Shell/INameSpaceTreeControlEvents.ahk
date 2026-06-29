#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IShellItemArray.ahk" { IShellItemArray }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import ".\IContextMenu.ahk" { IContextMenu }

/**
 * Exposes methods for handling INameSpaceTreeControl events.
 * @remarks
 * This interface is implemented by a client of namespace control (CLSID_NameSpaceTreeControl) to be advised of namespace control events so that the client may process these events and if not, allow the namespace control to process them.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreecontrolevents
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INameSpaceTreeControlEvents extends IUnknown {
    /**
     * The interface identifier for INameSpaceTreeControlEvents
     * @type {Guid}
     */
    static IID := Guid("{93d77985-b3d8-4484-8318-672cdda002ce}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INameSpaceTreeControlEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnItemClick              : IntPtr
        OnPropertyItemCommit     : IntPtr
        OnItemStateChanging      : IntPtr
        OnItemStateChanged       : IntPtr
        OnSelectionChanged       : IntPtr
        OnKeyboardInput          : IntPtr
        OnBeforeExpand           : IntPtr
        OnAfterExpand            : IntPtr
        OnBeginLabelEdit         : IntPtr
        OnEndLabelEdit           : IntPtr
        OnGetToolTip             : IntPtr
        OnBeforeItemDelete       : IntPtr
        OnItemAdded              : IntPtr
        OnItemDeleted            : IntPtr
        OnBeforeContextMenu      : IntPtr
        OnAfterContextMenu       : IntPtr
        OnBeforeStateImageChange : IntPtr
        OnGetDefaultIconIndex    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INameSpaceTreeControlEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the user clicks a button on the mouse.
     * @remarks
     * If this method fails, the event is processed by both <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrol">INameSpaceTreeControl</a> and TreeView. If it returns S_OK, then only <b>INameSpaceTreeControl</b> will process the event.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that was clicked.
     * @param {Integer} nstceHitTest Type: <b>NSTCEHITTEST</b>
     * @param {Integer} nstceClickType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a></b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemclick
     */
    OnItemClick(psi, nstceHitTest, nstceClickType) {
        result := ComCall(3, this, "ptr", psi, "uint", nstceHitTest, "uint", nstceClickType, "HRESULT")
        return result
    }

    /**
     * Not implemented. (INameSpaceTreeControlEvents.OnPropertyItemCommit)
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Not used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onpropertyitemcommit
     */
    OnPropertyItemCommit(psi) {
        result := ComCall(4, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Called before the state of an item changes.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item for which the state is going to change.
     * @param {Integer} nstcisMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a> enumeration that indicate which pieces of information the calling application wants to set.
     * @param {Integer} nstcisState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a> enumeration that indicate the values that are to be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemstatechanging
     */
    OnItemStateChanging(psi, nstcisMask, nstcisState) {
        result := ComCall(5, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisState, "HRESULT")
        return result
    }

    /**
     * Not implemented. (INameSpaceTreeControlEvents.OnItemStateChanged)
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the shell item for which the state has changed.
     * @param {Integer} nstcisMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a> enumeration that indicates what pieces of information the caller wants to set.
     * @param {Integer} nstcisState Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a> enumeration that indicates the values that are to be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemstatechanged
     */
    OnItemStateChanged(psi, nstcisMask, nstcisState) {
        result := ComCall(6, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisState, "HRESULT")
        return result
    }

    /**
     * Called when the selection changes.
     * @param {IShellItemArray} psiaSelection Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> objects that contains the new selection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onselectionchanged
     */
    OnSelectionChanged(psiaSelection) {
        result := ComCall(7, this, "ptr", psiaSelection, "HRESULT")
        return result
    }

    /**
     * Called when the user presses a key on the keyboard.
     * @remarks
     * This method receives its message directly from WndProc. When this returns S_OK, the message was not consumed and the namespace tree control is allowed to process the message. Otherwise this message was handled, with no further action required.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message value.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Specifies the WParam parameters of the message.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Specifies the LParam parameters of the message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onkeyboardinput
     */
    OnKeyboardInput(uMsg, _wParam, _lParam) {
        result := ComCall(8, this, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * Called before an IShellItem is expanded.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that is to be expanded.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforeexpand
     */
    OnBeforeExpand(psi) {
        result := ComCall(9, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Called after an IShellItem is expanded.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that was expanded.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onafterexpand
     */
    OnAfterExpand(psi) {
        result := ComCall(10, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Called before the IShellItem goes into edit mode.
     * @remarks
     * If this method fails, the transition to edit mode is not canceled.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> for which the text is to be edited.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeginlabeledit
     */
    OnBeginLabelEdit(psi) {
        result := ComCall(11, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Called after the IShellItem leaves edit mode.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> for which the text was edited.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onendlabeledit
     */
    OnEndLabelEdit(psi) {
        result := ComCall(12, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Enables you to provide a tooltip.
     * @remarks
     * If this method returns S_OK, the client provides its own tooltip. Otherwise the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrol">INameSpaceTreeControl</a> will extract one.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that contains the tooltip.
     * @param {PWSTR} pszTip Type: <b>LPWSTR</b>
     * 
     * When this method returns, contains the text of the tooltip.
     * @param {Integer} cchTip Type: <b>int</b>
     * 
     * The size of the tooltip in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-ongettooltip
     */
    OnGetToolTip(psi, pszTip, cchTip) {
        pszTip := pszTip is String ? StrPtr(pszTip) : pszTip

        result := ComCall(13, this, "ptr", psi, "ptr", pszTip, "int", cchTip, "HRESULT")
        return result
    }

    /**
     * Called before an IShellItem and all of its children are deleted.
     * @remarks
     * If this method fails, the given <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> and its children are still deleted.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that is to be deleted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforeitemdelete
     */
    OnBeforeItemDelete(psi) {
        result := ComCall(14, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Called after an IShellItem has been added.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that was added.
     * @param {BOOL} fIsRoot Type: <b>BOOL</b>
     * 
     * Specifies whether the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that was added is a root.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemadded
     */
    OnItemAdded(psi, fIsRoot) {
        result := ComCall(15, this, "ptr", psi, BOOL, fIsRoot, "HRESULT")
        return result
    }

    /**
     * Called after an IShellItem has been deleted.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that was deleted.
     * @param {BOOL} fIsRoot Type: <b>BOOL</b>
     * 
     * Specifies whether the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that was deleted is a root.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemdeleted
     */
    OnItemDeleted(psi, fIsRoot) {
        result := ComCall(16, this, "ptr", psi, BOOL, fIsRoot, "HRESULT")
        return result
    }

    /**
     * Called before a context menu is displayed; allows client to add additional menu entries.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> from which the context menu is generated. This value can be <b>NULL</b>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the IID of the context menu.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this methods returns, contains the address of a pointer to the interface specified by <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforecontextmenu
     */
    OnBeforeContextMenu(psi, riid) {
        result := ComCall(17, this, "ptr", psi, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Called after a context menu is displayed.
     * @remarks
     * This method allows client to completely replace the context menu. This method will allow the client to use the context menu returned by <i>ppv</i> and not necessarily the one specified in <i>pcmIn</i>.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> from which the context menu is generated. This value can be <b>NULL</b> only if the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCS2_SHOWNULLSPACEMENU</a> flag is set.
     * @param {IContextMenu} pcmIn Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a>*</b>
     * 
     * A pointer to the context menu.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the IID of the context menu.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the interface specified in <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onaftercontextmenu
     */
    OnAfterContextMenu(psi, pcmIn, riid) {
        result := ComCall(18, this, "ptr", psi, "ptr", pcmIn, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Called before the state icon of the given IShellItem is changed.
     * @remarks
     * If this method returns S_OK, the client has processed the event and no further action is required of the namespace control. Otherwise the event will need to be processed, in this case the default action is to go to the next image in the list.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> in which the state image is changing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforestateimagechange
     */
    OnBeforeStateImageChange(psi) {
        result := ComCall(19, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Pointer<Integer>} piDefaultIcon 
     * @param {Pointer<Integer>} piOpenIcon 
     * @returns {HRESULT} 
     */
    OnGetDefaultIconIndex(psi, piDefaultIcon, piOpenIcon) {
        piDefaultIconMarshal := piDefaultIcon is VarRef ? "int*" : "ptr"
        piOpenIconMarshal := piOpenIcon is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "ptr", psi, piDefaultIconMarshal, piDefaultIcon, piOpenIconMarshal, piOpenIcon, "HRESULT")
        return result
    }

    Query(iid) {
        if (INameSpaceTreeControlEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnItemClick := CallbackCreate(GetMethod(implObj, "OnItemClick"), flags, 4)
        this.vtbl.OnPropertyItemCommit := CallbackCreate(GetMethod(implObj, "OnPropertyItemCommit"), flags, 2)
        this.vtbl.OnItemStateChanging := CallbackCreate(GetMethod(implObj, "OnItemStateChanging"), flags, 4)
        this.vtbl.OnItemStateChanged := CallbackCreate(GetMethod(implObj, "OnItemStateChanged"), flags, 4)
        this.vtbl.OnSelectionChanged := CallbackCreate(GetMethod(implObj, "OnSelectionChanged"), flags, 2)
        this.vtbl.OnKeyboardInput := CallbackCreate(GetMethod(implObj, "OnKeyboardInput"), flags, 4)
        this.vtbl.OnBeforeExpand := CallbackCreate(GetMethod(implObj, "OnBeforeExpand"), flags, 2)
        this.vtbl.OnAfterExpand := CallbackCreate(GetMethod(implObj, "OnAfterExpand"), flags, 2)
        this.vtbl.OnBeginLabelEdit := CallbackCreate(GetMethod(implObj, "OnBeginLabelEdit"), flags, 2)
        this.vtbl.OnEndLabelEdit := CallbackCreate(GetMethod(implObj, "OnEndLabelEdit"), flags, 2)
        this.vtbl.OnGetToolTip := CallbackCreate(GetMethod(implObj, "OnGetToolTip"), flags, 4)
        this.vtbl.OnBeforeItemDelete := CallbackCreate(GetMethod(implObj, "OnBeforeItemDelete"), flags, 2)
        this.vtbl.OnItemAdded := CallbackCreate(GetMethod(implObj, "OnItemAdded"), flags, 3)
        this.vtbl.OnItemDeleted := CallbackCreate(GetMethod(implObj, "OnItemDeleted"), flags, 3)
        this.vtbl.OnBeforeContextMenu := CallbackCreate(GetMethod(implObj, "OnBeforeContextMenu"), flags, 4)
        this.vtbl.OnAfterContextMenu := CallbackCreate(GetMethod(implObj, "OnAfterContextMenu"), flags, 5)
        this.vtbl.OnBeforeStateImageChange := CallbackCreate(GetMethod(implObj, "OnBeforeStateImageChange"), flags, 2)
        this.vtbl.OnGetDefaultIconIndex := CallbackCreate(GetMethod(implObj, "OnGetDefaultIconIndex"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnItemClick)
        CallbackFree(this.vtbl.OnPropertyItemCommit)
        CallbackFree(this.vtbl.OnItemStateChanging)
        CallbackFree(this.vtbl.OnItemStateChanged)
        CallbackFree(this.vtbl.OnSelectionChanged)
        CallbackFree(this.vtbl.OnKeyboardInput)
        CallbackFree(this.vtbl.OnBeforeExpand)
        CallbackFree(this.vtbl.OnAfterExpand)
        CallbackFree(this.vtbl.OnBeginLabelEdit)
        CallbackFree(this.vtbl.OnEndLabelEdit)
        CallbackFree(this.vtbl.OnGetToolTip)
        CallbackFree(this.vtbl.OnBeforeItemDelete)
        CallbackFree(this.vtbl.OnItemAdded)
        CallbackFree(this.vtbl.OnItemDeleted)
        CallbackFree(this.vtbl.OnBeforeContextMenu)
        CallbackFree(this.vtbl.OnAfterContextMenu)
        CallbackFree(this.vtbl.OnBeforeStateImageChange)
        CallbackFree(this.vtbl.OnGetDefaultIconIndex)
    }
}
