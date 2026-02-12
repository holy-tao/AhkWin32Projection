#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get property descriptions, register and unregister property schemas, enumerate property descriptions, and format property values in a type-strict way.
 * @remarks
 * Many of the exported APIs (such as <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescription">PSGetPropertyDescription</a>) are simply wrappers around the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertysystem">IPropertySystem</a> methods. If your code calls a lot of these helper APIs in sequence, it may be worthwhile to instantiate a single <b>IPropertySystem</b> object, and call the methods directly, rather than calling the helper APIs. (To improve the performance, the helper APIs do obtain a cached instance of the <b>IPropertySystem</b> object.)
 * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nn-propsys-ipropertysystem
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertySystem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertySystem
     * @type {Guid}
     */
    static IID => Guid("{ca724e8a-c3e6-442b-88a4-6fb0db8035a3}")

    /**
     * The class identifier for PropertySystem
     * @type {Guid}
     */
    static CLSID => Guid("{b8967f85-58ae-4f46-9fb2-5d7904798f4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyDescription", "GetPropertyDescriptionByName", "GetPropertyDescriptionListFromString", "EnumeratePropertyDescriptions", "FormatForDisplay", "FormatForDisplayAlloc", "RegisterPropertySchema", "UnregisterPropertySchema", "RefreshPropertySchema"]

    /**
     * Gets an instance of the subsystem object that implements IPropertyDescription, to obtain the property description for a given PROPERTYKEY.
     * @remarks
     * It is recommended that you use the IID_PPV_ARGS macro, defined in objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, eliminating the possibility of a coding error.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the desired property key. See <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertysystem-getpropertydescription
     */
    GetPropertyDescription(propkey, riid) {
        result := ComCall(3, this, "ptr", propkey, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Gets an instance of the subsystem object that implements IPropertyDescription, to obtain the property description for a given canonical name.
     * @remarks
     * It is recommended that you use the IID_PPV_ARGS macro, defined in objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, eliminating the possibility of a coding error.
     * @param {PWSTR} pszCanonicalName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that identifies the property.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertysystem-getpropertydescriptionbyname
     */
    GetPropertyDescriptionByName(pszCanonicalName, riid) {
        pszCanonicalName := pszCanonicalName is String ? StrPtr(pszCanonicalName) : pszCanonicalName

        result := ComCall(4, this, "ptr", pszCanonicalName, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Gets an instance of the subsystem object that implements IPropertyDescriptionList, to obtain an ordered collection of property descriptions, based on the provided string.
     * @remarks
     * The property description list string ("proplist") syntax consists of a sequence of canonical property names, with flags associated with each property name. The string starts with "prop:". The syntax looks like this: <c>prop:[flags]propertyname[endflags];</c>
     * 
     * The flags are optional and can be any of those below. Note: These flags translate to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_view_flags">PROPDESC_VIEW_FLAGS</a> enum.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>-</td>
     * <td>Sort in reverse order (PDVF_REVERSESORT).</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Show by default in both the primary and secondary lists (PDVF_SHOWBYDEFAULT | PDVF_SHOWINPRIMARYLIST | PDVF_SHOWINSECONDARYLIST).</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Show in the primary and secondary lists (PDVF_SHOWINPRIMARYLIST | PDVF_SHOWINSECONDARYLIST).</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Show in secondary list (PDVF_SHOWINSECONDARYLIST).</td>
     * </tr>
     * <tr>
     * <td>^</td>
     * <td>Begin a new group (PDVF_BEGINNEWGROUP).</td>
     * </tr>
     * <tr>
     * <td>/</td>
     * <td>Right align (PDVF_RIGHTALIGN).</td>
     * </tr>
     * <tr>
     * <td>*</td>
     * <td>Hide if the value is not present.</td>
     * </tr>
     * <tr>
     * <td>|</td>
     * <td>Center align. (PDVF_CENTERALIGN).</td>
     * </tr>
     * <tr>
     * <td>~</td>
     * <td>Hide the label. (PDVF_HIDELABEL).</td>
     * </tr>
     * <tr>
     * <td>#</td>
     * <td>Fill area. (PDVF_FILLAREA).</td>
     * </tr>
     * <tr>
     * <td>?</td>
     * <td>Hide if unsupported by property handler (PDVF_HIDEIFUNSUPPORTED).</td>
     * </tr>
     * <tr>
     * <td>&lt;</td>
     * <td>Parse as link (PDVF_PARSEASLINK).</td>
     * </tr>
     * <tr>
     * <td>&amp;</td>
     * <td>Show as whole link (PDVF_SHOWASWHOLELINK).</td>
     * </tr>
     * </table>
     *  
     * 
     * From the dbfolder and file folder perspective:
     * 
     * <table class="clsStd">
     * <tr>
     * <td>0</td>
     * <td>Show as a column in defview, column chooser menu, and column chooser dialog.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Show in the column chooser menu and dialog.</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Show in the column chooser dialog.</td>
     * </tr>
     * <tr>
     * <td><b>NULL</b></td>
     * <td>Include in the search results, but hide in the UI.</td>
     * </tr>
     * </table>
     *  
     * 
     * The endflags are also optional and can be the following:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>EndFlag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>]</td>
     * <td>End column (used for extended tiles view).</td>
     * </tr>
     * </table>
     *  
     * 
     * It is recommended that you use the IID_PPV_ARGS macro, defined in objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, eliminating the possibility of a coding error.
     * 
     * For more information about property schemas, see 
     *             <a href="https://docs.microsoft.com/windows/desktop/properties/building-property-handlers-property-schemas">Property Schemas</a>.
     * @param {PWSTR} pszPropList Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that identifies the property list.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertysystem-getpropertydescriptionlistfromstring
     */
    GetPropertyDescriptionListFromString(pszPropList, riid) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        result := ComCall(5, this, "ptr", pszPropList, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Gets an instance of the subsystem object that implements IPropertyDescriptionList, to obtain either the entire or a partial list of property descriptions in the system.
     * @remarks
     * This method is not implemented where BUILDING_DOWNLEVEL_LIB is defined.
     * 
     * It is recommended that you use the IID_PPV_ARGS macro, defined in objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, eliminating the possibility of a coding error.
     * @param {Integer} filterOn Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_enumfilter">PROPDESC_ENUMFILTER</a></b>
     * 
     * The list to return. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_enumfilter">PROPDESC_ENUMFILTER</a>. Valid values for this method are 0 through 4.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertysystem-enumeratepropertydescriptions
     */
    EnumeratePropertyDescriptions(filterOn, riid) {
        result := ComCall(6, this, "int", filterOn, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Gets a formatted, Unicode string representation of a property value. (IPropertySystem.FormatForDisplay)
     * @remarks
     * You must initialize Component Object Model (COM) with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-formatfordisplay">IPropertySystem::FormatForDisplay</a>.
     * 
     * When it succeeds, this method gets a formatted Unicode string representation of a property value for a specified <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>, and one or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>. If the <b>PROPERTYKEY</b> is not recognized by the schema subsystem, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-formatfordisplay">IPropertySystem::FormatForDisplay</a> attempts to format the value according to its <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a>.
     * 
     * The purpose of this method is to convert data into a string suitable for display to the user. The value is formatted according to the current locale, the language of the user, the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>, and the property description specified by the property key. For information about how the property description schema influences the formatting of the value, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusstringformat/nl-gdiplusstringformat-stringformat">stringFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-booleanformat">booleanFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-numberformat">numberFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-nmdatetimeformata">NMDATETIMEFORMAT</a>,  and <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.  Typically, the <b>PROPDESC_FORMAT_FLAGS</b> are used to modify the format prescribed by the property description.
     * 
     * The output string may contain Unicode directional characters.  These nonspacing characters influence the Unicode bidirectional algorithm so that the values appear correctly when a left-to-right (LTR) language is drawn on a right-to-left (RTL) window, and vice versa.  These characters include the following: <c>"\x200e", "\x200f", "\x202a", "\x202b", "\x202c", "\x202d", "\x202e".</c>
     * 
     * The properties in the following table use special formats and are unaffected by the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> (examples cited are for strings with a current locale set to English; typically, output is localized except where noted).
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Property</th>
     * <th>Format</th>
     * </tr>
     * <tr>
     * <td>System.FileAttributes</td>
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
     * <td>System.Photo.ISOSpeed</td>
     * <td>For example, "ISO-400".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.ShutterSpeed</td>
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
     * <td>System.Photo.ExposureTime</td>
     * <td>For example,  "2 sec."or "1/125 sec." </td>
     * </tr>
     * <tr>
     * <td>System.Photo.Aperture</td>
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
     * <td>System.Photo.FNumber</td>
     * <td>For example, "f/5.6".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.SubjectDistance</td>
     * <td>For example, "15 m"or "250 mm".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.FocalLength</td>
     * <td>For example,  "50 mm".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.FlashEnergy</td>
     * <td>For example, "500 bpcs".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.ExposureBias</td>
     * <td>For example, "-2 step", " 0 step", or "+3 step".</td>
     * </tr>
     * <tr>
     * <td>System.Computer.DecoratedFreeSpace</td>
     * <td>For example, "105 MB free of 13.2 GB".</td>
     * </tr>
     * <tr>
     * <td>System.ItemType</td>
     * <td>For example, "Application" or "JPEG Image".</td>
     * </tr>
     * <tr>
     * <td>System.ControlPanel.Category</td>
     * <td>For example, "Appearance and Personalization".</td>
     * </tr>
     * <tr>
     * <td>System.ComputerName</td>
     * <td>For example, "LITWARE05 (this computer)" or "testbox07".</td>
     * </tr>
     * </table>
     *  
     * 
     * If the property key does not correspond to a property description in any of the registered property schemas, this method chooses a format based on the type of the value, as described in the following table.
     * 
     * <table class="clsStd">
     * <tr>
     * <th><b>Type of the value</b></th>
     * <th><b>Format</b></th>
     * </tr>
     * <tr>
     * <td>VT_BOOLEAN</td>
     * <td>Not supported.</td>
     * </tr>
     * <tr>
     * <td>VT_FILETIME</td>
     * <td>Date/time string as specified by <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> and the current locale. PDFF_SHORTTIME and PDFF_SHORTDATE are the default. For example, "11/13/2006 3:22 PM".</td>
     * </tr>
     * <tr>
     * <td>Numeric VARTYPE</td>
     * <td>Decimal string in the current locale. For example, "42".</td>
     * </tr>
     * <tr>
     * <td>VT_LPWSTR or other</td>
     * <td>String. Sequences of "\r", "\t", or "\n" are replaced with a single space.</td>
     * </tr>
     * <tr>
     * <td>VT_VECTOR | anything</td>
     * <td>Semicolon separated values—a semicolon is used regardless of locale.</td>
     * </tr>
     * </table>
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the requested <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">property key</a>.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure containing the type and value of the property.
     * @param {Integer} pdff Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * The format of the property string. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> for possible values.
     * @param {PWSTR} pszText Type: <b>LPWSTR</b>
     * 
     * Receives the formatted value as a null-terminated, Unicode string. The calling application must allocate memory for the buffer.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * 
     * The length of the buffer at  <i>pszText</i> in <b>WCHAR</b><b>s</b>, including the terminating <b>NULL</b>. The maximum size is 0x8000 (32K).
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
     * Formatted string is created.
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
     * Formatted string is not created. S_FALSE indicates that the empty string resulted from a VT_EMPTY.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory allocation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertysystem-formatfordisplay
     */
    FormatForDisplay(key, propvar, pdff, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(7, this, "ptr", key, "ptr", propvar, "int", pdff, "ptr", pszText, "uint", cchText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a string representation of a property value to an allocated memory buffer.
     * @remarks
     * You must initialize Component Object Model (COM) with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-formatfordisplayalloc">IPropertySystem::FormatForDisplayAlloc</a>.
     * 
     * On success, this method gets a formatted Unicode string representation of a property value for a specified <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>, and one or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>. If the <b>PROPERTYKEY</b> is not recognized by the schema subsystem, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-formatfordisplayalloc">IPropertySystem::FormatForDisplayAlloc</a> attempts to format the value according to its <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a>.
     * 
     * This method allocates memory for the buffer and returns a pointer to it at <i>ppszDisplay</i>. The calling application must use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the string specified by <i>ppszDisplay</i> when it is no longer needed.
     * 
     * The purpose of this method is to convert data into a string suitable for display to the user. The value is formatted according to the current locale, the language of the user, the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>, and the property description specified by the property key. For information about how the property description schema influences the formatting of the value, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusstringformat/nl-gdiplusstringformat-stringformat">stringFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-booleanformat">booleanFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-numberformat">numberFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-nmdatetimeformata">NMDATETIMEFORMAT</a>,  and <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.  Typically, the <b>PROPDESC_FORMAT_FLAGS</b> are used to modify the format prescribed by the property description.
     * 
     * The output string may contain Unicode directional characters.  These nonspacing characters influence the Unicode bidirectional algorithm so that the values appear correctly when a left to right (LTR) language is drawn on a right to left (RTL) window, and vice versa.  These characters include the following: <c>"\x200e", "\x200f", "\x202a", "\x202b", "\x202c", "\x202d", "\x202e".</c>
     * 
     * The following properties use special formats and are unaffected by the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> (examples cited are for strings with a current locale set to English; typically, output is localized except where noted).
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Property</th>
     * <th>Format</th>
     * </tr>
     * <tr>
     * <td>System.FileAttributes</td>
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
     * <td>System.Photo.ISOSpeed</td>
     * <td>For example, "ISO-400".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.ShutterSpeed</td>
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
     * <td>System.Photo.ExposureTime</td>
     * <td>For example, "2 sec."or "1/125 sec."</td>
     * </tr>
     * <tr>
     * <td>System.Photo.Aperture</td>
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
     * <td>System.Photo.FNumber</td>
     * <td>For example, "f/5.6".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.SubjectDistance</td>
     * <td>For example, "15 m"or "250 mm".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.FocalLength</td>
     * <td>For example, "50 mm".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.FlashEnergy</td>
     * <td>For example, "500 bpcs".</td>
     * </tr>
     * <tr>
     * <td>System.Photo.ExposureBias</td>
     * <td>For example, "-2 step", " 0 step", or "+3 step".</td>
     * </tr>
     * <tr>
     * <td>System.Computer.DecoratedFreeSpace</td>
     * <td>For example, "105 MB free of 13.2 GB".</td>
     * </tr>
     * <tr>
     * <td>System.ItemType</td>
     * <td>For example, "Application" or "JPEG Image".</td>
     * </tr>
     * <tr>
     * <td>System.ControlPanel.Category</td>
     * <td>For example, "Appearance and Personalization".</td>
     * </tr>
     * <tr>
     * <td>System.ComputerName</td>
     * <td>For example, "LITWARE05 (this computer)" or "testbox07".</td>
     * </tr>
     * </table>
     *  
     * 
     * If the property key does not correspond to a property description in any of the registered property schemas, then this method chooses a format based on the type of the value.
     * 
     * <table class="clsStd">
     * <tr>
     * <th><b>Type of the value</b></th>
     * <th><b>Format</b></th>
     * </tr>
     * <tr>
     * <td>VT_BOOLEAN</td>
     * <td>Not supported.</td>
     * </tr>
     * <tr>
     * <td>VT_FILETIME</td>
     * <td>Date/time string as specified by <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> and the current locale. PDFF_SHORTTIME and PDFF_SHORTDATE are the default. For example, "11/13/2006 3:22 PM".</td>
     * </tr>
     * <tr>
     * <td>Numeric VARTYPE</td>
     * <td>Decimal string in the current locale.  For example,  "42". </td>
     * </tr>
     * <tr>
     * <td>VT_LPWSTR or other</td>
     * <td>Converted to a string. Sequences of "\r", "\t", or "\n" are replaced with a single space.</td>
     * </tr>
     * <tr>
     * <td>VT_VECTOR | anything</td>
     * <td>Semicolon separated values—a semicolon is used regardless of locale.</td>
     * </tr>
     * </table>
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the desired <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {Integer} pdff Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * The format of the property string. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to the formatted value as a null-terminated, Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertysystem-formatfordisplayalloc
     */
    FormatForDisplayAlloc(key, propvar, pdff) {
        result := ComCall(8, this, "ptr", key, "ptr", propvar, "int", pdff, "ptr*", &ppszDisplay := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszDisplay
    }

    /**
     * Informs the schema subsystem of the addition of a property description schema file. (IPropertySystem.RegisterPropertySchema)
     * @remarks
     * This method informs the schema subsystem of the addition of a property description schema (.propdesc) file, using a file path to the .propdesc file on the local computer. Call this method only when the file has first been installed on the computer. Typically, a setup application calls this method after installing the .propdesc file, which should be stored in the install directory of the application under "Program Files". Multiple calls may be made to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-registerpropertyschema">IPropertySystem::RegisterPropertySchema</a> in order to batch-register multiple schema files.
     * 
     * If a failure is encountered that prevents a property description from getting loaded, the cause will be recorded in the application event log. This method fails with E_ACCESSDENIED if the calling context does not have proper privileges, which include write access to HKLM (HKEY_LOCAL_MACHINE). It is the responsibility of the calling application to obtain privileges via limited user account (LUA) mechanisms.
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * Pointer to the file path for the .propdesc file on the local machine.
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
     * Indicates schema is registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates calling context does not have proper privileges.
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
     * Indicates one or more of the property descriptions in the schema was not registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertysystem-registerpropertyschema
     */
    RegisterPropertySchema(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(9, this, "ptr", pszPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Informs the schema subsystem of the removal of a property description schema (.propdesc) file, using a file path to the .propdesc file on the local machine.
     * @remarks
     * Call this method when the file is being uninstalled from the machine. Typically, a setup application calls this method before or after uninstalling the .propdesc file. This method can be called after the file no longer exists.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-refreshpropertyschema">IPropertySystem::RefreshPropertySchema</a> in order for the newly-unregistered schema files to be unincorporated from the search index and the schema subsystem cache.
     * 
     * This method fails with E_ACCESSDENIED if the calling context does not have proper privileges, which include write access to the local machine. It is the caller's responsibility to obtain privileges via least-privileged user account (LUA) mechanisms.
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * Pointer to the file path for the .propdesc file on the local machine.
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
     * Indicates schema is unregistered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates calling context does not have proper privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertysystem-unregisterpropertyschema
     */
    UnregisterPropertySchema(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Not supported. (IPropertySystem.RefreshPropertySchema)
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
     * Indicates schema files reloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates calling context does not have proper privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/propsys/nf-propsys-ipropertysystem-refreshpropertyschema
     */
    RefreshPropertySchema() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
