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
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iresultsfolder-additem
     */
    AddItem(psi) {
        result := ComCall(3, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {Pointer<ITEMIDLIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iresultsfolder-addidlist
     */
    AddIDList(pidl) {
        result := ComCall(4, this, "ptr", pidl, "ptr*", &ppidlAdded := 0, "HRESULT")
        return ppidlAdded
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iresultsfolder-removeitem
     */
    RemoveItem(psi) {
        result := ComCall(5, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iresultsfolder-removeidlist
     */
    RemoveIDList(pidl) {
        result := ComCall(6, this, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iresultsfolder-removeall
     */
    RemoveAll() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
