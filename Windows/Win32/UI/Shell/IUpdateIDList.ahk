#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to update the ITEMIDLIST of the child of an folder object.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Implement this interface for an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> implementation to update the provided child <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iupdateidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IUpdateIDList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateIDList
     * @type {Guid}
     */
    static IID => Guid("{6589b6d2-5f8d-4b9e-b7e0-23cdd9717d8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Update"]

    /**
     * 
     * @param {IBindCtx} pbc 
     * @param {Pointer<ITEMIDLIST>} pidlIn 
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidlOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iupdateidlist-update
     */
    Update(pbc, pidlIn, ppidlOut) {
        ppidlOutMarshal := ppidlOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pbc, "ptr", pidlIn, ppidlOutMarshal, ppidlOut, "HRESULT")
        return result
    }
}
