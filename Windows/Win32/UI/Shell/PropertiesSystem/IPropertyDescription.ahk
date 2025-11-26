#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enumerate and retrieve individual property description details.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Do not implement this interface. There is only one implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> in the system; it is provided by the Shell. 
 * 
 * To obtain this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescription">PSGetPropertyDescription</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionbyname">PSGetPropertyDescriptionByName</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescriptionlist-getat">IPropertyDescriptionList::GetAt</a>.
 * 
 * Only one property description exists for each property in the system.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertydescription
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
     * @returns {PROPERTYKEY} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getpropertykey
     */
    GetPropertyKey() {
        pkey := PROPERTYKEY()
        result := ComCall(3, this, "ptr", pkey, "HRESULT")
        return pkey
    }

    /**
     * Gets the case-sensitive name by which a property is known to the system, regardless of its localized name.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to the property's canonical name as a null-terminated Unicode string.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getcanonicalname
     */
    GetCanonicalName() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets the variant type of the property.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a> that indicates the property type. If the property is multi-valued, the value pointed to is a <b>VT_VECTOR</b> mask (<b>VT_VECTOR</b> ORed to the <b>VARTYPE</b>. The following are the possible variant types.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getpropertytype
     */
    GetPropertyType() {
        result := ComCall(5, this, "ushort*", &pvartype := 0, "HRESULT")
        return pvartype
    }

    /**
     * Gets the display name of the property as it is shown in any UI.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Contains the address of a pointer to the property's name as a null-terminated Unicode string.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getdisplayname
     */
    GetDisplayName() {
        result := ComCall(6, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets the text used in edit controls hosted in various dialog boxes.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated Unicode buffer that holds the invitation text.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-geteditinvitation
     */
    GetEditInvitation() {
        result := ComCall(7, this, "ptr*", &ppszInvite := 0, "HRESULT")
        return ppszInvite
    }

    /**
     * Gets a set of flags that describe the uses and capabilities of the property.
     * @param {Integer} mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PROPDESC_TYPE_FLAGS</a></b>
     * 
     * A mask that specifies which type flags to retrieve. A combination of values found in the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PROPDESC_TYPE_FLAGS</a> constants. To retrieve all type flags, pass <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PDTF_MASK_ALL</a>
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PROPDESC_TYPE_FLAGS</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that consists of bitwise <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_type_flags">PROPDESC_TYPE_FLAGS</a> values.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-gettypeflags
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getviewflags
     */
    GetViewFlags() {
        result := ComCall(9, this, "int*", &ppdvFlags := 0, "HRESULT")
        return ppdvFlags
    }

    /**
     * Gets the default column width of the property in a list view.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to the column width value, in characters.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getdefaultcolumnwidth
     */
    GetDefaultColumnWidth() {
        result := ComCall(10, this, "uint*", &pcxChars := 0, "HRESULT")
        return pcxChars
    }

    /**
     * Gets the current data type used to display the property.
     * @returns {Integer} Type: <b>PROPDESC_DISPLAYTYPE*</b>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getdisplaytype
     */
    GetDisplayType() {
        result := ComCall(11, this, "int*", &pdisplaytype := 0, "HRESULT")
        return pdisplaytype
    }

    /**
     * Gets the column state flag, which describes how the property should be treated by interfaces or APIs that use this flag.
     * @returns {Integer} Type: <b>SHCOLSTATEF</b>
     * 
     * When this method returns, contains a pointer to the column state flag. See <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ne-shtypes-shcolstate">SHCOLSTATE</a> for valid values.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getcolumnstate
     */
    GetColumnState() {
        result := ComCall(12, this, "uint*", &pcsFlags := 0, "HRESULT")
        return pcsFlags
    }

    /**
     * Gets the grouping method to be used when a view is grouped by a property, and retrieves the grouping type.
     * @returns {Integer} Type: <b>PROPDESC_GROUPING_RANGE*</b>
     * 
     * Receives a pointer to a flag value that indicates the grouping type. The possible values are:
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getgroupingrange
     */
    GetGroupingRange() {
        result := ComCall(13, this, "int*", &pgr := 0, "HRESULT")
        return pgr
    }

    /**
     * Gets the relative description type for a property description.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_relativedescription_type">PROPDESC_RELATIVEDESCRIPTION_TYPE</a>*</b>
     * 
     * When this method returns, contains a pointer to the relative description type value. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_relativedescription_type">PROPDESC_RELATIVEDESCRIPTION_TYPE</a> for valid values.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getrelativedescriptiontype
     */
    GetRelativeDescriptionType() {
        result := ComCall(14, this, "int*", &prdt := 0, "HRESULT")
        return prdt
    }

    /**
     * Compares two property values in the manner specified by the property description. Returns two display strings that describe how the two properties compare.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getrelativedescription
     */
    GetRelativeDescription(propvar1, propvar2, ppszDesc1, ppszDesc2) {
        ppszDesc1Marshal := ppszDesc1 is VarRef ? "ptr*" : "ptr"
        ppszDesc2Marshal := ppszDesc2 is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "ptr", propvar1, "ptr", propvar2, ppszDesc1Marshal, ppszDesc1, ppszDesc2Marshal, ppszDesc2, "HRESULT")
        return result
    }

    /**
     * Gets the current sort description flags for the property, which indicate the particular wordings of sort offerings.
     * @returns {Integer} Type: <b>PROPDESC_SORTDESCRIPTION*</b>
     * 
     * When this method returns, contains a pointer to the value of one or more of the following flags that indicate the sort types available to the user. Note that the strings shown are English versions only. Localized strings are used for other locales.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getsortdescription
     */
    GetSortDescription() {
        result := ComCall(16, this, "int*", &psd := 0, "HRESULT")
        return psd
    }

    /**
     * Gets the localized display string that describes the current sort order.
     * @param {BOOL} fDescending Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if <i>ppszDescription</i> should reference the string "Z on top"; <b>FALSE</b> to reference the string "A on top".
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to the sort description as a null-terminated Unicode string.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getsortdescriptionlabel
     */
    GetSortDescriptionLabel(fDescending) {
        result := ComCall(17, this, "int", fDescending, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * Gets a value that describes how the property values are displayed when multiple items are selected in the UI.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_aggregation_type">PROPDESC_AGGREGATION_TYPE</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that indicates the aggregation type. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_aggregation_type">PROPDESC_AGGREGATION_TYPE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getaggregationtype
     */
    GetAggregationType() {
        result := ComCall(18, this, "int*", &paggtype := 0, "HRESULT")
        return paggtype
    }

    /**
     * Gets the condition type and default condition operation to use when displaying the property in the query builder UI. This influences the list of predicate conditions (for example, equals, less than, and contains) that are shown for this property.
     * @param {Pointer<Integer>} pcontype Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_condition_type">PROPDESC_CONDITION_TYPE</a>*</b>
     * 
     * A pointer to a value that indicates the condition type.
     * @param {Pointer<Integer>} popDefault Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a>*</b>
     * 
     * When this method returns, contains a pointer to a value that indicates the default condition operation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getconditiontype
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-getenumtypelist
     */
    GetEnumTypeList(riid) {
        result := ComCall(20, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Coerces the value to the canonical value, according to the property description.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * On entry, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the original value. When this method returns, contains the canonical value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the failure code is not INPLACE_S_TRUNCATED or E_INVALIDARG, then coercion from the value's type to the property description's type was not possible, and the <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has been cleared.
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
     * The <i>ppropvar</i> parameter is invalid. The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has been cleared.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-coercetocanonicalvalue
     */
    CoerceToCanonicalValue(ppropvar) {
        result := ComCall(21, this, "ptr", ppropvar, "HRESULT")
        return result
    }

    /**
     * Gets a formatted, Unicode string representation of a property value.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {Integer} pdfFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> flags, which are either bitwise or multiple values, that indicate the property string format.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * The address of a pointer to a null-terminated Unicode string that contains the display text.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-formatfordisplay
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription-isvaluecanonical
     */
    IsValueCanonical(propvar) {
        result := ComCall(23, this, "ptr", propvar, "HRESULT")
        return result
    }
}
