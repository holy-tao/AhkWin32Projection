#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create and manipulate Shell item arrays.
 * @remarks
 * 
  * A shell item array may be created using one of the following functions:
  *                 
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateshellitemarray">SHCreateShellItemArray</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateshellitemarrayfromdataobject">SHCreateShellItemArrayFromDataObject</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateshellitemarrayfromidlists">SHCreateShellItemArrayFromIDLists</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateshellitemarrayfromshellitem">SHCreateShellItemArrayFromShellItem</a>
  * </li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellitemarray
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellItemArray extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellItemArray
     * @type {Guid}
     */
    static IID => Guid("{b63ea76d-1f85-456f-a19c-48159efa858b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindToHandler", "GetPropertyStore", "GetPropertyDescriptionList", "GetAttributes", "GetCount", "GetItemAt", "EnumItems"]

    /**
     * 
     * @param {IBindCtx} pbc 
     * @param {Pointer<Guid>} bhid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-bindtohandler
     */
    BindToHandler(pbc, bhid, riid, ppvOut) {
        result := ComCall(3, this, "ptr", pbc, "ptr", bhid, "ptr", riid, "ptr*", ppvOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getpropertystore
     */
    GetPropertyStore(flags, riid, ppv) {
        result := ComCall(4, this, "int", flags, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} keyType 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getpropertydescriptionlist
     */
    GetPropertyDescriptionList(keyType, riid, ppv) {
        result := ComCall(5, this, "ptr", keyType, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AttribFlags 
     * @param {Integer} sfgaoMask 
     * @param {Pointer<Integer>} psfgaoAttribs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getattributes
     */
    GetAttributes(AttribFlags, sfgaoMask, psfgaoAttribs) {
        psfgaoAttribsMarshal := psfgaoAttribs is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "int", AttribFlags, "uint", sfgaoMask, psfgaoAttribsMarshal, psfgaoAttribs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwNumItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getcount
     */
    GetCount(pdwNumItems) {
        pdwNumItemsMarshal := pdwNumItems is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwNumItemsMarshal, pdwNumItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IShellItem>} ppsi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getitemat
     */
    GetItemAt(dwIndex, ppsi) {
        result := ComCall(8, this, "uint", dwIndex, "ptr*", ppsi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumShellItems>} ppenumShellItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-enumitems
     */
    EnumItems(ppenumShellItems) {
        result := ComCall(9, this, "ptr*", ppenumShellItems, "HRESULT")
        return result
    }
}
