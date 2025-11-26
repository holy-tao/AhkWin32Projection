#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for handling INameSpaceTreeControl events.
 * @remarks
 * 
 * This interface is implemented by a client of namespace control (CLSID_NameSpaceTreeControl) to be advised of namespace control events so that the client may process these events and if not, allow the namespace control to process them.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-inamespacetreecontrolevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INameSpaceTreeControlEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INameSpaceTreeControlEvents
     * @type {Guid}
     */
    static IID => Guid("{93d77985-b3d8-4484-8318-672cdda002ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnItemClick", "OnPropertyItemCommit", "OnItemStateChanging", "OnItemStateChanged", "OnSelectionChanged", "OnKeyboardInput", "OnBeforeExpand", "OnAfterExpand", "OnBeginLabelEdit", "OnEndLabelEdit", "OnGetToolTip", "OnBeforeItemDelete", "OnItemAdded", "OnItemDeleted", "OnBeforeContextMenu", "OnAfterContextMenu", "OnBeforeStateImageChange", "OnGetDefaultIconIndex"]

    /**
     * Called when the user clicks a button on the mouse.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that was clicked.
     * @param {Integer} nstceHitTest Type: <b>NSTCEHITTEST</b>
     * @param {Integer} nstceClickType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a></b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemclick
     */
    OnItemClick(psi, nstceHitTest, nstceClickType) {
        result := ComCall(3, this, "ptr", psi, "uint", nstceHitTest, "uint", nstceClickType, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Not used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onpropertyitemcommit
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemstatechanging
     */
    OnItemStateChanging(psi, nstcisMask, nstcisState) {
        result := ComCall(5, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisState, "HRESULT")
        return result
    }

    /**
     * Not implemented.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemstatechanged
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onselectionchanged
     */
    OnSelectionChanged(psiaSelection) {
        result := ComCall(7, this, "ptr", psiaSelection, "HRESULT")
        return result
    }

    /**
     * Called when the user presses a key on the keyboard.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message value.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Specifies the WParam parameters of the message.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Specifies the LParam parameters of the message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onkeyboardinput
     */
    OnKeyboardInput(uMsg, wParam, lParam) {
        result := ComCall(8, this, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * Called before an IShellItem is expanded.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that is to be expanded.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforeexpand
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onafterexpand
     */
    OnAfterExpand(psi) {
        result := ComCall(10, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Called before the IShellItem goes into edit mode.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> for which the text is to be edited.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeginlabeledit
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onendlabeledit
     */
    OnEndLabelEdit(psi) {
        result := ComCall(12, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Enables you to provide a tooltip.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-ongettooltip
     */
    OnGetToolTip(psi, pszTip, cchTip) {
        pszTip := pszTip is String ? StrPtr(pszTip) : pszTip

        result := ComCall(13, this, "ptr", psi, "ptr", pszTip, "int", cchTip, "HRESULT")
        return result
    }

    /**
     * Called before an IShellItem and all of its children are deleted.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that is to be deleted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforeitemdelete
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemadded
     */
    OnItemAdded(psi, fIsRoot) {
        result := ComCall(15, this, "ptr", psi, "int", fIsRoot, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onitemdeleted
     */
    OnItemDeleted(psi, fIsRoot) {
        result := ComCall(16, this, "ptr", psi, "int", fIsRoot, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforecontextmenu
     */
    OnBeforeContextMenu(psi, riid) {
        result := ComCall(17, this, "ptr", psi, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Called after a context menu is displayed.
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onaftercontextmenu
     */
    OnAfterContextMenu(psi, pcmIn, riid) {
        result := ComCall(18, this, "ptr", psi, "ptr", pcmIn, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Called before the state icon of the given IShellItem is changed.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> in which the state image is changing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolevents-onbeforestateimagechange
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
}
