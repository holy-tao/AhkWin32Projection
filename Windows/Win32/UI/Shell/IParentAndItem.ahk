#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get and set the parent and the parent's child ID. While IParentAndItem is typically implemented on IShellItems, it is not specific to IShellItem.
 * @remarks
 * 
 * The performance improvement using this interface can be noted in comparison with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistidlist">IPersistIDList</a>, an interface that uses absolute item identifier lists. Subsequent operations on objects that implement <b>IPersistIDList</b> may require <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> calls, and these calls may impact performance.  In the case of IShellItems and participating IShellFolders that implement <b>IParentAndItem</b>, the parent <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> may already be cached. By implementing <b>IParentAndItem</b> and then getting/setting the parent <b>IShellFolder</b> directly, the call to <b>IShellFolder::BindToObject</b> on the item identifier list to retrieve the <b>IShellFolder</b> interface is eliminated.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iparentanditem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IParentAndItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IParentAndItem
     * @type {Guid}
     */
    static IID => Guid("{b3a4b685-b685-4805-99d9-5dead2873236}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetParentAndItem", "GetParentAndItem"]

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlParent 
     * @param {IShellFolder} psf 
     * @param {Pointer<ITEMIDLIST>} pidlChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iparentanditem-setparentanditem
     */
    SetParentAndItem(pidlParent, psf, pidlChild) {
        result := ComCall(3, this, "ptr", pidlParent, "ptr", psf, "ptr", pidlChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidlParent 
     * @param {Pointer<IShellFolder>} ppsf 
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidlChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iparentanditem-getparentanditem
     */
    GetParentAndItem(ppidlParent, ppsf, ppidlChild) {
        ppidlParentMarshal := ppidlParent is VarRef ? "ptr*" : "ptr"
        ppidlChildMarshal := ppidlChild is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppidlParentMarshal, ppidlParent, "ptr*", ppsf, ppidlChildMarshal, ppidlChild, "HRESULT")
        return result
    }
}
