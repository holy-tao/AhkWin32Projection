#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItem.ahk
#Include .\IEnumShellItems.ahk
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
     * Binds to an object by means of the specified handler.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on a bind context object.
     * @param {Pointer<Guid>} bhid Type: <b>REFGUID</b>
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the object type to retrieve.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this methods returns, contains the object specified in <i>riid</i> that is returned by the handler specified by <i>rbhid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemarray-bindtohandler
     */
    BindToHandler(pbc, bhid, riid) {
        result := ComCall(3, this, "ptr", pbc, "ptr", bhid, "ptr", riid, "ptr*", &ppvOut := 0, "HRESULT")
        return ppvOut
    }

    /**
     * Gets a property store.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the object type to retrieve.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains interface pointer requested in riid.  This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemarray-getpropertystore
     */
    GetPropertyStore(flags, riid) {
        result := ComCall(4, this, "int", flags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a property description list for the items in the shell item array.
     * @param {Pointer<PROPERTYKEY>} keyType Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure specifying which property list to retrieve.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the object type to retrieve.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface requested in riid.  This will typically be <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemarray-getpropertydescriptionlist
     */
    GetPropertyDescriptionList(keyType, riid) {
        result := ComCall(5, this, "ptr", keyType, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the attributes of the set of items contained in an IShellItemArray.
     * @param {Integer} AttribFlags Type: <b>SIATTRIBFLAGS</b>
     * @param {Integer} sfgaoMask Type: <b>SFGAOF</b>
     * 
     * A mask that specifies what particular attributes are being requested. A bitwise OR of one or more of the <a href="https://docs.microsoft.com/windows/desktop/shell/sfgao">SFGAO</a> values.
     * @returns {Integer} Type: <b>SFGAOF*</b>
     * 
     * A bitmap that, when this method returns successfully, contains the values of the requested attributes.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemarray-getattributes
     */
    GetAttributes(AttribFlags, sfgaoMask) {
        result := ComCall(6, this, "int", AttribFlags, "uint", sfgaoMask, "uint*", &psfgaoAttribs := 0, "HRESULT")
        return psfgaoAttribs
    }

    /**
     * Gets the number of items in the given IShellItem array.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * When this method returns, contains the number of items in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemarray-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &pdwNumItems := 0, "HRESULT")
        return pdwNumItems
    }

    /**
     * Gets the item at the given index in the IShellItemArray.
     * @param {Integer} dwIndex Type: <b>DWORD</b>
     * 
     * The index of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> requested in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * When this method returns, contains the requested <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> pointer.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemarray-getitemat
     */
    GetItemAt(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * Gets an enumerator of the items in the array.
     * @returns {IEnumShellItems} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a>**</b>
     * 
     * When this method returns, contains an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a> pointer that enumerates the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">shell items</a> that are in the array.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemarray-enumitems
     */
    EnumItems() {
        result := ComCall(9, this, "ptr*", &ppenumShellItems := 0, "HRESULT")
        return IEnumShellItems(ppenumShellItems)
    }
}
