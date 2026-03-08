#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItem.ahk
#Include .\IEnumShellItems.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create and manipulate Shell item arrays.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitemarray
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-bindtohandler
     */
    BindToHandler(pbc, bhid, riid) {
        result := ComCall(3, this, "ptr", pbc, "ptr", bhid, "ptr", riid, "ptr*", &ppvOut := 0, "HRESULT")
        return ppvOut
    }

    /**
     * Gets a property store.
     * @remarks
     * This method is used to obtain a read-only property store that aggregates properties gathered from all the items in the shell item array.
     * 
     * If there is more than one item in the shell item array, then the resulting property store will aggregate the values from each item according to a set of rules determined by each property.   Values read from the property store will be coerced to a canonical form prior to aggregation as discussed at <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescription-coercetocanonicalvalue">CoerceToCanonicalValue</a>.  The output from a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb761473(v=vs.85)">IPropertyStore::GetValue</a> is computed as follows:
     * 
     * <ul>
     * <li>Single valued properties follow the rule specified by the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">aggregation type</a> string in the property description schema.</li>
     * <li>
     * <ul>
     * <li>If the aggregation type is "DateRange" and the property type is a filetime, returns a VT_VECTOR | VT_FILETIME of two values, or a VT_FILETIME value if the values were identical.</li>
     * <li>If the aggregation type is "First", returns the first non-empty value.</li>
     * <li>If the aggregation type is "Sum", returns the sum.</li>
     * <li>If the aggregation type is "Average", returns the average of all non-empty values.</li>
     * <li>If the aggregation type is "Minimum", returns the minimum value.</li>
     * <li>If the aggregation type is "Union" and the property type is a string, returns a VT_VECTOR | VT_LPWSTR containing the union of values.  The order of the values is unspecified.</li>
     * <li>If the aggregation type is unspecified, incompatible, or "Default", either returns a single value if it is identical for all items in the array, or a special value used to indicate that the values differ between some of the items.  The special value is a VT_VECTOR | VT_LPWSTR containing two strings: "Multiple" and "Values".  Calling applications should check for this special value by checking for VT_VECTOR | VT_LPWSTR if <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescription-gettypeflags">GetTypeFlags</a> indicates the property is single-valued.</li>
     * </ul>
     * </li>
     * <li>Multi-valued string properties return an intersection of their strings.  The order is unspecified.</li>
     * </ul>
     * Calls to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystorecapabilities-ispropertywritable">IsPropertyWritable</a> will return S_FALSE only if all the items have property handlers that implement <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a> and all the property stores indicate they do not support writing the property.
     * 
     * Calling applications may achieve other aggregation behaviors by accessing the individual shell items and their property stores directly.  See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb761472(v=vs.85)">IPropertyStore::GetCount</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb761471(v=vs.85)">IPropertyStore::GetAt</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore">GetPropertyStore</a>.
     * 
     * Writing to an array of shell items is supported via the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> API.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the object type to retrieve.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains interface pointer requested in riid.  This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getpropertystore
     */
    GetPropertyStore(flags, riid) {
        result := ComCall(4, this, "int", flags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a property description list for the items in the shell item array.
     * @remarks
     * This function is used to determine a list of properties that are applicable to a set of shell items.  The type of list is specified by a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.  Supported list types include but are not limited to:
     * 
     * 
     * <ul>
     * <li>PKEY_PropList_PreviewDetails </li>
     * <li>PKEY_PropList_PreviewTitle </li>
     * <li>PKEY_PropList_FullDetails </li>
     * <li>PKEY_PropList_TileInfo</li>
     * <li>PKEY_PropList_ExtendedTileInfo </li>
     * <li>PKEY_PropList_InfoTip </li>
     * <li>PKEY_PropList_QuickTip </li>
     * <li>PKEY_PropList_FileOperationPrompt</li>
     * <li>PKEY_PropList_ConflictPrompt</li>
     * <li>PKEY_PropList_SetDefaultsFor</li>
     * <li>PKEY_PropList_NonPersonal</li>
     * <li>PKEY_NewMenuPreferredTypes</li>
     * <li>PKEY_NewMenuAllowedTypes</li>
     * </ul>
     * If the shell item array contains more than one item, then this method will obtain an intersection of the properties that would be returned for each item individually.
     * @param {Pointer<PROPERTYKEY>} keyType Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure specifying which property list to retrieve.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the object type to retrieve.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface requested in riid.  This will typically be <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getpropertydescriptionlist
     */
    GetPropertyDescriptionList(keyType, riid) {
        result := ComCall(5, this, "ptr", keyType, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the attributes of the set of items contained in an IShellItemArray.
     * @remarks
     * The Shell item array caches individual attributes after they have been determined.
     * 
     * As this method passes through the array gathering attribute information, it normally stops looking at a particular attribute after that value is irrevocably set. For instance, if the SIATTRIBFLAGS_AND flag is set, after an attribute is found not to be set on an item (a value of 0), there is no need to continue examining that attribute value on other items because the result of the AND operation will always be 0. Therefore, the final set of attributes is commonly calculated by looking at only the first few items in the array, which is all that is needed to obtain the final value. If you have a need to examine all items in the array, set the SIATTRIBFLAGS_ALLITEMS flag. However, be aware that this can slow the method's return considerably, so do not do so without cause.
     * @param {Integer} AttribFlags Type: <b>SIATTRIBFLAGS</b>
     * @param {Integer} sfgaoMask Type: <b>SFGAOF</b>
     * 
     * A mask that specifies what particular attributes are being requested. A bitwise OR of one or more of the <a href="https://docs.microsoft.com/windows/desktop/shell/sfgao">SFGAO</a> values.
     * @returns {Integer} Type: <b>SFGAOF*</b>
     * 
     * A bitmap that, when this method returns successfully, contains the values of the requested attributes.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getattributes
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &pdwNumItems := 0, "HRESULT")
        return pdwNumItems
    }

    /**
     * Gets the item at the given index in the IShellItemArray.
     * @remarks
     * This function returns E_FAIL if the requested index is out of bounds of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>.
     * @param {Integer} dwIndex Type: <b>DWORD</b>
     * 
     * The index of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> requested in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * When this method returns, contains the requested <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-getitemat
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemarray-enumitems
     */
    EnumItems() {
        result := ComCall(9, this, "ptr*", &ppenumShellItems := 0, "HRESULT")
        return IEnumShellItems(ppenumShellItems)
    }
}
