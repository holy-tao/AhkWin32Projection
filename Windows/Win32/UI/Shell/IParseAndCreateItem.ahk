#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IParseAndCreateItem interface
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iparseandcreateitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IParseAndCreateItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IParseAndCreateItem
     * @type {Guid}
     */
    static IID => Guid("{67efed0e-e827-4408-b493-78f3982b685c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetItem", "GetItem"]

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iparseandcreateitem-setitem
     */
    SetItem(psi) {
        result := ComCall(3, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iparseandcreateitem-getitem
     */
    GetItem(riid, ppv) {
        result := ComCall(4, this, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }
}
