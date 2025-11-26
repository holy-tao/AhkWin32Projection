#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * Exposes methods that are used to persist item identifier lists.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipersistidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPersistIDList extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistIDList
     * @type {Guid}
     */
    static IID => Guid("{1079acfc-29bd-11d3-8e0d-00c04f6837d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIDList", "GetIDList"]

    /**
     * Sets a persisted item identifier list.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * A pointer to the item identifier list to set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipersistidlist-setidlist
     */
    SetIDList(pidl) {
        result := ComCall(4, this, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * Gets an item identifier list.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>LPITEMIDLIST*</b>
     * 
     * The address of a pointer to the item identifier list to get.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipersistidlist-getidlist
     */
    GetIDList() {
        result := ComCall(5, this, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }
}
