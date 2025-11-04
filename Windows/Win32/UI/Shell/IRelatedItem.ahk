#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that derive related items with specific relationships.
 * @remarks
 * 
  * Do not implement this interface directly. This is a base interface (other interfaces derive from it) for a set of interfaces that describes the relationship between two items, (For example <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idisplayitem">IDisplayItem</a>).  Do not query for this interface directly, for example, using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a>. Instead, use the derived interfaces.
  * 
  * An example derivation is the creation of an identity name handler. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iidentityname">IIdentityName</a>. Other interfaces that may derive from this interface include <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icurrentitem">ICurrentItem</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itransfermediumitem">ITransferMediumItem</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-irelateditem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IRelatedItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRelatedItem
     * @type {Guid}
     */
    static IID => Guid("{a73ce67a-8ab1-44f1-8d43-d2fcbf6b1cd0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemIDList", "GetItem"]

    /**
     * 
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irelateditem-getitemidlist
     */
    GetItemIDList(ppidl) {
        ppidlMarshal := ppidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppidlMarshal, ppidl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} ppsi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irelateditem-getitem
     */
    GetItem(ppsi) {
        result := ComCall(4, this, "ptr*", ppsi, "HRESULT")
        return result
    }
}
