#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that hold items from a data object.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iresultsfolder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IResultsFolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResultsFolder
     * @type {Guid}
     */
    static IID => Guid("{96e5ae6d-6ae1-4b1c-900c-c6480eaa8828}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddItem", "AddIDList", "RemoveItem", "RemoveIDList", "RemoveAll"]

    /**
     * Adds an item to a results folder.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iresultsfolder-additem
     */
    AddItem(psi) {
        result := ComCall(3, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Inserts a pointer to an item identifier list (PIDL) into a results folder.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A pointer to the IDList of the given object relative to the Desktop.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PITEMID_CHILD*</b>
     * 
     * A PIDL consisting of 0 or 1 <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structures, relative to a parent folder. This parameter maybe <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iresultsfolder-addidlist
     */
    AddIDList(pidl) {
        result := ComCall(4, this, "ptr", pidl, "ptr*", &ppidlAdded := 0, "HRESULT")
        return ppidlAdded
    }

    /**
     * Removes an item from a results folder.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iresultsfolder-removeitem
     */
    RemoveItem(psi) {
        result := ComCall(5, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Removes a pointer to an item identifier list (PIDL) from a results folder.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL relative to the Desktop.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iresultsfolder-removeidlist
     */
    RemoveIDList(pidl) {
        result := ComCall(6, this, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * Removes all items from a results folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iresultsfolder-removeall
     */
    RemoveAll() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
