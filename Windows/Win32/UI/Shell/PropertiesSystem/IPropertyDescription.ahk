#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enumerate and retrieve individual property description details. (IPropertyDescription)
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Do not implement this interface. There is only one implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> in the system; it is provided by the Shell. 
 * 
 * To obtain this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescription">PSGetPropertyDescription</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionbyname">PSGetPropertyDescriptionByName</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescriptionlist-getat">IPropertyDescriptionList::GetAt</a>.
 * 
 * Only one property description exists for each property in the system.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertydescription
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyDescription extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyDescription
     * @type {Guid}
     */
    static IID => Guid("{6f79d558-3e96-4549-a1d1-7d75d2288814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyKey", "GetCanonicalName", "GetPropertyType", "GetDisplayName", "GetEditInvitation", "GetTypeFlags", "GetViewFlags", "GetDefaultColumnWidth", "GetDisplayType", "GetColumnState", "GetGroupingRange", "GetRelativeDescriptionType", "GetRelativeDescription", "GetSortDescription", "GetSortDescriptionLabel", "GetAggregationType", "GetConditionType", "GetEnumTypeList", "CoerceToCanonicalValue", "FormatForDisplay", "IsValueCanonical"]

    /**
     * Gets a structure that acts as a property's unique identifier.
     * @remarks
     * The information retrieved by this method comes from the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-propertydescription">propertyDescription</a> element in the property's .propdesc file.
     * @returns {PROPERTYKEY} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getpropertykey
     */
    GetPropertyKey() {
        pkey := PROPERTYKEY()
        result := ComCall(3, this, "ptr", pkey, "HRESULT")
        return pkey
    }

    /**
     * Gets the case-sensitive name by which a property is known to the system, regardless of its localized name.
     * @remarks
     * The information retrieved by this method comes from the <i>name</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-propertydescription">propertyDescription</a> element in the property's .propdesc file.
     * 
     * It is the responsibility of the calling application to use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the string referred to by <i>ppszName</i> when it is no longer needed.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to the property's canonical name as a null-terminated Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getcanonicalname
     */
    GetCanonicalName() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets the variant type of the property.
     * @remarks
     * The information retrieved by this method comes from the <i>type</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a> that indicates the property type. If the property is multi-valued, the value pointed to is a <b>VT_VECTOR</b> mask (<b>VT_VECTOR</b> ORed to the <b>VARTYPE</b>. The following are the possible variant types.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getpropertytype
     */
    GetPropertyType() {
        result := ComCall(5, this, "ushort*", &pvartype := 0, "HRESULT")
        return pvartype
    }

    /**
     * Gets the display name of the property as it is shown in any UI.
     * @remarks
     * The information retrieved by this method comes from the <i>singularLabel</i> and <i>pluralLabel</i> attributes of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-labelinfo">labelInfo</a> element in the property's .propdesc file.
     * 
     * It is the responsibility of the calling application to use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the string referred to by <i>ppszDisplayName</i> when it is no longer needed.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Contains the address of a pointer to the property's name as a null-terminated Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getdisplayname
     */
    GetDisplayName() {
        result := ComCall(6, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets the text used in edit controls hosted in various dialog boxes.
     * @remarks
     * The information retrieved by this method comes from the <i>invitationText</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-labelinfo">labelInfo</a> element in the property's .propdesc file.
     * 
     * It is the responsibility of the calling application to use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the string referred to by <i>pszInvite</i> when it is no longer needed.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated Unicode buffer that holds the invitation text.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-geteditinvitation
     */
    GetEditInvitation() {
        result := ComCall(7, this, "ptr*", &ppszInvite := 0, "HRESULT")
        return ppszInvite
    }

    /**
     * Gets a set of flags that describe the uses and capabilities of the property.
     * @remarks
     * If the property description instance comes from <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescription">PSGetPropertyDescription</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionbyname">PSGetPropertyDescriptionByName</a>, these flags come from the .propdesc file that defines the property description.
     * 
     * If the instance comes from <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresourcecollection-getat">GetAt</a>, the type flags come from the .propdesc file and may be influenced by the specific proplist. This means that flags obtained from one property description instance may be slightly different from another instance (both referring to the same property).
     * 
     * For additional information on type flags, see the <i>canGroupBy</i>, <i>canStackBy</i>, <i>isInnate</i>, <i>multipleValues</i>, <i>isGroup</i>, <i>isTreeProperty</i>, <i>isViewable</i>, <i>isQueryable</i>, and <i>includeInFullTextQuery</i> attributes of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @param {Integer} mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PROPDESC_TYPE_FLAGS</a></b>
     * 
     * A mask that specifies which type flags to retrieve. A combination of values found in the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PROPDESC_TYPE_FLAGS</a> constants. To retrieve all type flags, pass <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PDTF_MASK_ALL</a>
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PROPDESC_TYPE_FLAGS</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that consists of bitwise <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PROPDESC_TYPE_FLAGS</a> values.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-gettypeflags
     */
    GetTypeFlags(mask) {
        result := ComCall(8, this, "uint", mask, "uint*", &ppdtFlags := 0, "HRESULT")
        return ppdtFlags
    }

    /**
     * Gets the current set of flags governing the property's view.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_view_flags">PROPDESC_VIEW_FLAGS</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that includes one or more of the following flags. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_view_flags">PROPDESC_VIEW_FLAGS</a> for valid values.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getviewflags
     */
    GetViewFlags() {
        result := ComCall(9, this, "int*", &ppdvFlags := 0, "HRESULT")
        return ppdvFlags
    }

    /**
     * Gets the default column width of the property in a list view.
     * @remarks
     * The values retrieved by this method are originally set through the <i>defaultColumnWidth</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a> element in the property's .propdesc file.
     * 
     * If no value is set in the .propdesc file or if the method fails, the value pointed to by <i>pcxChars</i> is 20 characters.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to the column width value, in characters.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getdefaultcolumnwidth
     */
    GetDefaultColumnWidth() {
        result := ComCall(10, this, "uint*", &pcxChars := 0, "HRESULT")
        return pcxChars
    }

    /**
     * Gets the current data type used to display the property.
     * @remarks
     * The value retrieved by this method is originally set through the <i>displayType</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a> element in the property's .propdesc file.
     * @returns {Integer} Type: <b>PROPDESC_DISPLAYTYPE*</b>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getdisplaytype
     */
    GetDisplayType() {
        result := ComCall(11, this, "int*", &pdisplaytype := 0, "HRESULT")
        return pdisplaytype
    }

    /**
     * Gets the column state flag, which describes how the property should be treated by interfaces or APIs that use this flag.
     * @remarks
     * The value retrieved by this method is originally set through the <i>displayType</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a> element in the property's .propdesc file.
     * @returns {Integer} Type: <b>SHCOLSTATEF</b>
     * 
     * When this method returns, contains a pointer to the column state flag. See <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ne-shtypes-shcolstate">SHCOLSTATE</a> for valid values.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getcolumnstate
     */
    GetColumnState() {
        result := ComCall(12, this, "uint*", &pcsFlags := 0, "HRESULT")
        return pcsFlags
    }

    /**
     * Gets the grouping method to be used when a view is grouped by a property, and retrieves the grouping type.
     * @remarks
     * The information retrieved by this method comes from the <i>groupingRange</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @returns {Integer} Type: <b>PROPDESC_GROUPING_RANGE*</b>
     * 
     * Receives a pointer to a flag value that indicates the grouping type. The possible values are:
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getgroupingrange
     */
    GetGroupingRange() {
        result := ComCall(13, this, "int*", &pgr := 0, "HRESULT")
        return pgr
    }

    /**
     * Gets the relative description type for a property description.
     * @remarks
     * The information retrieved by this method comes from the <i>relativeDescriptionType</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a> element in the property's .propdesc file.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_relativedescription_type">PROPDESC_RELATIVEDESCRIPTION_TYPE</a>*</b>
     * 
     * When this method returns, contains a pointer to the relative description type value. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_relativedescription_type">PROPDESC_RELATIVEDESCRIPTION_TYPE</a> for valid values.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getrelativedescriptiontype
     */
    GetRelativeDescriptionType() {
        result := ComCall(14, this, "int*", &prdt := 0, "HRESULT")
        return prdt
    }

    /**
     * Compares two property values in the manner specified by the property description. Returns two display strings that describe how the two properties compare.
     * @remarks
     * This method is influenced by the <i>relativeDescriptionType</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a> element in the property's .propdesc file.
     * 
     * It is the responsibility of the calling application to release <i>ppszDesc1</i> and <i>ppszDesc2</i> through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when they are no longer needed.
     * @param {Pointer<PROPVARIANT>} propvar1 Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the first property.
     * @param {Pointer<PROPVARIANT>} propvar2 Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the second property.
     * @param {Pointer<PWSTR>} ppszDesc1 Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to the description string that compares the first property with the second property. The string is null-terminated.
     * @param {Pointer<PWSTR>} ppszDesc2 Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to the description string that compares the second property with the first property. The string is null-terminated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getrelativedescription
     */
    GetRelativeDescription(propvar1, propvar2, ppszDesc1, ppszDesc2) {
        ppszDesc1Marshal := ppszDesc1 is VarRef ? "ptr*" : "ptr"
        ppszDesc2Marshal := ppszDesc2 is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "ptr", propvar1, "ptr", propvar2, ppszDesc1Marshal, ppszDesc1, ppszDesc2Marshal, ppszDesc2, "HRESULT")
        return result
    }

    /**
     * Gets the current sort description flags for the property, which indicate the particular wordings of sort offerings.
     * @remarks
     * The settings retrieved by this method are set through the <i>sortDescription</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-labelinfo">labelInfo</a> element in the property's .propdesc file.
     * @returns {Integer} Type: <b>PROPDESC_SORTDESCRIPTION*</b>
     * 
     * When this method returns, contains a pointer to the value of one or more of the following flags that indicate the sort types available to the user. Note that the strings shown are English versions only. Localized strings are used for other locales.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getsortdescription
     */
    GetSortDescription() {
        result := ComCall(16, this, "int*", &psd := 0, "HRESULT")
        return psd
    }

    /**
     * Gets the localized display string that describes the current sort order.
     * @remarks
     * The string retrieved by this method is determined by flags set in the <i>sortDescription</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-labelinfo">labelInfo</a> element in the property's .propdesc file.
     * 
     * It is the responsibility of the calling application to release <i>ppszDescription</i> when it is no longer needed.
     * @param {BOOL} fDescending Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if <i>ppszDescription</i> should reference the string "Z on top"; <b>FALSE</b> to reference the string "A on top".
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to the sort description as a null-terminated Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getsortdescriptionlabel
     */
    GetSortDescriptionLabel(fDescending) {
        result := ComCall(17, this, "int", fDescending, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * Gets a value that describes how the property values are displayed when multiple items are selected in the UI.
     * @remarks
     * The information retrieved by this method comes from the <i>aggregationType</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_aggregation_type">PROPDESC_AGGREGATION_TYPE</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that indicates the aggregation type. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_aggregation_type">PROPDESC_AGGREGATION_TYPE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getaggregationtype
     */
    GetAggregationType() {
        result := ComCall(18, this, "int*", &paggtype := 0, "HRESULT")
        return paggtype
    }

    /**
     * Gets the condition type and default condition operation to use when displaying the property in the query builder UI. This influences the list of predicate conditions (for example, equals, less than, and contains) that are shown for this property.
     * @remarks
     * For more information, see the <i>conditionType</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * @param {Pointer<Integer>} pcontype Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_condition_type">PROPDESC_CONDITION_TYPE</a>*</b>
     * 
     * A pointer to a value that indicates the condition type.
     * @param {Pointer<Integer>} popDefault Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that indicates the default condition operation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getconditiontype
     */
    GetConditionType(pcontype, popDefault) {
        pcontypeMarshal := pcontype is VarRef ? "int*" : "ptr"
        popDefaultMarshal := popDefault is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pcontypeMarshal, pcontype, popDefaultMarshal, popDefault, "HRESULT")
        return result
    }

    /**
     * Gets an instance of an IPropertyEnumTypeList, which can be used to enumerate the possible values for a property.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through ppv, typically IID_IShellItem.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in riid. This is typically [IPropertyEnumTypeList](nn-propsys-ipropertyenumtypelist.md).
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getenumtypelist
     */
    GetEnumTypeList(riid) {
        result := ComCall(20, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Coerces the value to the canonical value, according to the property description.
     * @remarks
     * For more information, see the <i>type</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element in the property's .propdesc file.
     * 
     * Most property descriptions specify the type that their values are expected to use.  For example, the property description for <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-title">System.Title</a> specifies that System.Title values should use <c>VT_LPWSTR</c>. This method coerces values to this type, and coerces the result into a canonical form.
     * 
     * It is important to note that if this method fails, it will have already called the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-imimeallocator-propvariantclear">PropVariantClear</a> on the input <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. Only if this method succeeds is the calling application responsible for calling the <b>PropVariantClear</b> on <i>ppropvar</i> when the structure is no longer needed.
     * 
     * The coercion performed by this method is also performed by the property system during  <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getvalue">IPropertyStore::GetValue</a>  and <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-setvalue">IPropertyStore::SetValue</a> calls. Applications may depend on the property system to perform the coercions, or may use this method to perform the coercion at a time of the application's choosing.
     * 
     * The coercion is performed in four steps, as follows:
     *                 
     * 
     * <ol>
     * <li>The following values are converted to <c>VT_EMPTY</c>.
     *                         <ul>
     * <li>Values of type <c>VT_NULL</c>.</li>
     * <li>Values of type <c>VT_LPWSTR, VT_BSTR</code>, or <code>VT_LPSTR</c> whose pointer is <b>NULL</b>.</li>
     * <li>Values of type <c>VT_LPWSTR, VT_BSTR</code>, or <code>VT_LPSTR</c> that are empty or consist entirely of spaces.</li>
     * <li>Values of type <c>VT_FILETIME</c> prior to midnight 1601/01/02.</li>
     * </ul>
     * </li>
     * <li>If the value is not of type <c>VT_EMPTY</c> after Step 1, it is converted to the type specified by the property description.  The type of a property description can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescription-getpropertytype">IPropertyDescription::GetPropertyType</a>. See <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> for information about how the property schema influences the type of a property description. Conversions are performed as follows:
     *                         <ul>
     * <li>Values of type <c>VT_LPWSTR, VT_BSTR</code>, or <code>VT_LPSTR</code> are converted to <code>VT_VECTOR | VT_LPWSTR</c> using <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-initpropvariantfromstringasvector">InitPropVariantFromStringAsVector</a>.</li>
     * <li>All other conversions are performed using <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a>
     * </li>
     * </ul>
     * </li>
     * <li>After Steps 2 and 3, the value is coerced into a canonical form based on its type. The canonical forms are summarized in the following table.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value Type</th>
     * <th>Canonical Form</th>
     * </tr>
     * <tr>
     * <td><c>VT_EMPTY</c></td>
     * <td>Always canonical.</td>
     * </tr>
     * <tr>
     * <td><c>VT_LPWSTR</c></td>
     * <td>
     * <ul>
     * <li>No leading or trailing spaces. The string is non-empty. The string is non-<b>NULL</b>. For example, <c>L"Alice"</c>.</li>
     * <li>If this is a tree property (that is, if the typeInfo element's <c>isTreeProperty</code> attribute is <b>TRUE</b>), then it must not have leading or trailing forward slashes (/), must not have spaces between the text and the forward slashes, and must not have two consecutive forward slashes(/). For example, <code>L"Friend/Bob"</c></li>
     * <li>Coercion removes unnecessary characters and will result in <c>VT_EMPTY</c> if there was no content.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td><c>VT_VECTOR | VT_LPWSTR</c></td>
     * <td>
     * <ul>
     * <li>Each string in the vector must adhere to the rules for <c>VT_LPWSTR</c> listed above. In addition, the vector must have no duplicates and have no null pointers.</li>
     * <li>If this is a tree property, then no value can be the ancestor of another value. For example, <c>L"Friend"</c> is an ancestor of L"Friend/Bob".</li>
     * <li>If there is no content, coercion removes duplicate and ancestor characters and will result in <c>VT_EMPTY</c>.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>If applicable, the value is checked against the property description type enumeration.  The following checks apply.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Enumeration Type</th>
     * <th>Value Type</th>
     * <th>Canonical Form</th>
     * </tr>
     * <tr>
     * <td>Discrete or Ranged</td>
     * <td><c>VT_EMPTY</c></td>
     * <td>Always canonical</td>
     * </tr>
     * <tr>
     * <td>Discrete</td>
     * <td><c>VT_LPWSTR</c></td>
     * <td>The string matches one of the enumerated strings allowed for the property. Comparisons are case-insensitive. If not, convert the value to <c>VT_EMPTY</c>.</td>
     * </tr>
     * <tr>
     * <td>Discrete</td>
     * <td>Numeric</td>
     * <td>The number matches one of the enumerated values allowed for the property. If not, convert the value to <c>VT_EMPTY</c>.</td>
     * </tr>
     * <tr>
     * <td>Discrete</td>
     * <td><c>VT_VECTOR | VT_LPWSTR</c></td>
     * <td>Each string in the vector matches one of the enumerated strings allowed for the property. Comparisons are case-insensitive. If not, remove that string from the vector. If the resulting vector is empty, convert the value to <c>VT_EMPTY</c>.</td>
     * </tr>
     * <tr>
     * <td>Discrete</td>
     * <td><c>VT_VECTOR |</c> Numeric</td>
     * <td>Each number in the vector matches one of the enumerated values allowed for the property. If not, remove that number from the vector. If the resulting vector is empty, convert the value to <c>VT_EMPTY</c>.</td>
     * </tr>
     * <tr>
     * <td>Ranged</td>
     * <td><c>VT_LPWSTR</c></td>
     * <td>The string exists in the range allowed for the property. Comparisons are case-sensitive. If not, convert the value to <c>VT_EMPTY</c>.</td>
     * </tr>
     * <tr>
     * <td>Ranged</td>
     * <td>Numeric</td>
     * <td>The number exists in the range allowed for the property. If not, convert the value to VT_EMPTY.</td>
     * </tr>
     * <tr>
     * <td>Ranged</td>
     * <td><c>VT_VECTOR | VT_LPWSTR</c></td>
     * <td>Each string in the vector exists in the range allowed for the property.  Comparisons are case-sensitive. If not, remove that string from the vector. If the resulting vector is empty, convert the value to <c>VT_EMPTY</c>.</td>
     * </tr>
     * <tr>
     * <td>Ranged</td>
     * <td><c>VT_VECTOR</c> | Numeric</td>
     * <td>Each number in the vector exists in the range allowed for the property. If not, remove that number from the vector. If the resulting vector is empty, convert the value to VT_EMPTY.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * </ol>
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * On entry, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the original value. When this method returns, contains the canonical value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the failure code is not INPLACE_S_TRUNCATED or E_INVALIDARG, then coercion from the value's type to the property description's type was not possible, and the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has been cleared.
     * 
     *                     
     * 
     * Possible results include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded. The property value specified by <i>ppropvar</i> is now in a canonical form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>INPLACE_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property value specified by <i>ppropvar</i> is now in a truncated, canonical form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppropvar</i> parameter is invalid. The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has been cleared.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-coercetocanonicalvalue
     */
    CoerceToCanonicalValue(ppropvar) {
        result := ComCall(21, this, "ptr", ppropvar, "HRESULT")
        return result
    }

    /**
     * Gets a formatted, Unicode string representation of a property value. (IPropertyDescription.FormatForDisplay)
     * @remarks
     * You must initialize Component Object Model (COM) with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescription-formatfordisplay">IPropertyDescription::FormatForDisplay</a>.
     * 
     * On success, this method gets a formatted Unicode string representation of a property value for a specified <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>, and one or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>.
     * 
     * The purpose of this method is to convert data into a string suitable for display to the user. The value is formatted according to the current locale, the language of the user, the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>, and the property description specified by the property key. For information about how the property description schema influences the formatting of the value, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusstringformat/nl-gdiplusstringformat-stringformat">stringFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-booleanformat">booleanFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-numberformat">numberFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-nmdatetimeformata">NMDATETIMEFORMAT</a>,  and <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>. Typically, the <b>PROPDESC_FORMAT_FLAGS</b> are used to modify the format prescribed by the property description.
     * 
     * The output string can contain Unicode directional characters. These nonspacing characters influence the Unicode bidirectional algorithm so that the values appear correctly when a left-to-right (LTR) language is drawn onto a right-to-left (RTL) window, and vice versa. These characters include the following: <c>"\x200e", "\x200f", "\x202a", "\x202b", "\x202c", "\x202d", "\x202e".</c>
     * 
     * The following properties use special formats and are unaffected by the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> (examples cited are for strings with a current locale set to English; typically, output is localized except where noted).
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Property</th>
     * <th>Format</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-fileattributes">System.FileAttributes</a>
     * </td>
     * <td>The following file attributes are converted to letters and appended to create a string (for example, a value of 0x1801 (FILE_ATTRIBUTE_READONLY | FILE_ATTRIBUTE_COMPRESSED | FILE_ATTRIBUTE_OFFLINE) is converted to "RCO"):
     *                             
     *                             <ul>
     * <li>FILE_ATTRIBUTE_READONLY (0x00000001) - 'R'</li>
     * <li>FILE_ATTRIBUTE_SYSTEM (0x00000004) - 'S'</li>
     * <li>FILE_ATTRIBUTE_ARCHIVE (0x00000020) -'A'</li>
     * <li>FILE_ATTRIBUTE_COMPRESSED (0x00000800) - 'C'</li>
     * <li>FILE_ATTRIBUTE_ENCRYPTED (0x00004000) - 'E'</li>
     * <li>FILE_ATTRIBUTE_OFFLINE (0x00001000) - 'O'</li>
     * <li>FILE_ATTRIBUTE_NOT_CONTENT_INDEXED (0x00002000) - 'I'</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-isospeed">System.Photo.ISOSpeed</a>
     * </td>
     * <td>For example, "ISO-400".</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-shutterspeed">System.Photo.ShutterSpeed</a>
     * </td>
     * <td>
     * The APEX value is converted to an exposure time using this formula:
     * 
     * <c>Exposure_time = 2^(-APEX_value)</c>
     * 
     * For example, "2 sec."or "1/125 sec.".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-exposuretime">System.Photo.ExposureTime</a>
     * </td>
     * <td>For example,  "2 sec."or "1/125 sec." </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-aperture">System.Photo.Aperture</a>
     * </td>
     * <td>
     * The APEX value is converted to an F number using this formula:
     * 
     * <c>F_Number = 2^(APEX_Value / 2)</c>
     * 
     * For example, "f/5.6".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-fnumber">System.Photo.FNumber</a>
     * </td>
     * <td>For example,  "f/5.6".</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-subjectdistance">System.Photo.SubjectDistance</a>
     * </td>
     * <td>For example, "15 m"or "250 mm".</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-focallength">System.Photo.FocalLength</a>
     * </td>
     * <td>For example,  "50 mm".</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-flashenergy">System.Photo.FlashEnergy</a>
     * </td>
     * <td>For example,  "500 bpcs".</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-exposurebias">System.Photo.ExposureBias</a>
     * </td>
     * <td>For example, "-2 step", " 0 step", or "+3 step".</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-computer-decoratedfreespace">System.Computer.DecoratedFreeSpace</a>
     * </td>
     * <td>For example, "105 MB free of 13.2 GB".</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-itemtype">System.ItemType</a>
     * </td>
     * <td>For example, "Application" or "JPEG Image".</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-computername">System.ComputerName</a>
     * </td>
     * <td>For example, "LITWARE05 (this computer)" or "testbox07".</td>
     * </tr>
     * </table>
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {Integer} pdfFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> flags, which are either bitwise or multiple values, that indicate the property string format.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * The address of a pointer to a null-terminated Unicode string that contains the display text.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-formatfordisplay
     */
    FormatForDisplay(propvar, pdfFlags) {
        result := ComCall(22, this, "ptr", propvar, "int", pdfFlags, "ptr*", &ppszDisplay := 0, "HRESULT")
        return ppszDisplay
    }

    /**
     * Gets a value that indicates whether a property is canonical according to the definition of the property description.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value is canonical.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value is not canonical.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-isvaluecanonical
     */
    IsValueCanonical(propvar) {
        result := ComCall(23, this, "ptr", propvar, "HRESULT")
        return result
    }
}
