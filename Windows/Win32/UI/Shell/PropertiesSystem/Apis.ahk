#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PropertiesSystem {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PKEY_PIDSTR_MAX => 10
;@endregion Constants

;@region Methods
    /**
     * Gets a formatted, Unicode string representation of a property value stored in a PROPVARIANT structure. The caller is responsible for allocating the output buffer.
     * @remarks
     * This function calls the schema subsystem's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-formatfordisplay">IPropertySystem::FormatForDisplay</a>. That call provides a Unicode string representation of a property value, with additional formatting based on one or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>. If the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> is not recognized by the schema subsystem, <b>IPropertySystem::FormatForDisplay</b> attempts to format the value according to the value's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a>.
     * 
     * You must initialize Component Object Model (COM) with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before you call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psformatpropertyvalue">PSFormatPropertyValue</a>.
     * 
     * The purpose of this function is to convert data into a string suitable for display to the user. The value is formatted according to the current locale, the language of the user, the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>, and the property description specified by the property key. For information on how the property description schema influences the formatting of the value, see the following topics:
     *                 
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusstringformat/nl-gdiplusstringformat-stringformat">stringFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-booleanformat">booleanFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-numberformat">numberFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-nmdatetimeformata">NMDATETIMEFORMAT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>
     * </li>
     * </ul>
     *  
     *             
     *                 Typically, the <b>PROPDESC_FORMAT_FLAGS</b> are used to modify the format prescribed by the property description.
     *             
     * 
     * The output string can contain Unicode directional characters. These nonspacing characters influence the Unicode bidirectional algorithm so that the values appear correctly when a left-to-right (LTR) language is drawn on a right-to-left (RTL) window, or an RTL is drawn on a LTR window. These characters include the following: <c>"\x200e", "\x200f", "\x202a", "\x202b", "\x202c", "\x202d", "\x202e".</c>
     * 
     * The following properties use special formats and are unaffected by the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>. Note that examples cited are for strings with a current locale set to English; typically, output is localized except where noted.
     * 
     *                 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Property</th>
     * <th>Format</th>
     * </tr>
     * <tr>
     * <td>System.FileAttributes</td>
     * <td>The following file attributes are converted to letters and appended to create a string (for example, a value of 0x1801 is converted to "RCO"):</td>
     * </tr>
     * <tr>
     * <td> </td>
     * <td>FILE_ATTRIBUTE_READONLY- 'R'</td>
     * </tr>
     * <tr>
     * <td> </td>
     * <td>FILE_ATTRIBUTE_SYSTEM - 'S'</td>
     * </tr>
     * <tr>
     * <td> </td>
     * <td>FILE_ATTRIBUTE_ARCHIVE -'A'</td>
     * </tr>
     * <tr>
     * <td> </td>
     * <td>FILE_ATTRIBUTE_COMPRESSED - 'C'</td>
     * </tr>
     * <tr>
     * <td> </td>
     * <td>FILE_ATTRIBUTE_ENCRYPTED - 'E'</td>
     * </tr>
     * <tr>
     * <td> </td>
     * <td>FILE_ATTRIBUTE_OFFLINE - 'O'</td>
     * </tr>
     * <tr>
     * <td> </td>
     * <td>FILE_ATTRIBUTE_NOT_CONTENT_INDEXED - 'I'</td>
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
     * <td>For example, "2 sec."or "1/125 sec." </td>
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
     * If the property key does not correspond to a property description in any of the registered property schemas, then this function chooses a format based on the type of the value.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Type of the value</th>
     * <th>Format</th>
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
     * <td>Decimal string in the current locale. For example, "42". </td>
     * </tr>
     * <tr>
     * <td>VT_LPWSTR or other</td>
     * <td>Converted to a string. Sequences of "\r", "\t", or "\n" are replaced with a single space.</td>
     * </tr>
     * <tr>
     * <td>VT_VECTOR | anything</td>
     * <td>Semicolon separated values. A semicolon is used regardless of locale.</td>
     * </tr>
     * </table>
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> that names the property whose value is being retrieved.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {Integer} pdfFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * A flag that specifies the format to apply to the property string. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> for possible values.
     * @param {Pointer<Char>} pwszText Type: <b>LPWSTR</b>
     * 
     * When the function returns, contains a pointer to the formatted value as a null-terminated, Unicode string. The calling application is responsible for allocating memory for the buffer before it calls <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psformatfordisplay">PSFormatForDisplay</a>.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * 
     * Specifies the length of the buffer at <i>pwszText</i> in <b>WCHAR</b><b>s</b>, including the terminating null character.
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
     * The formatted string was successfully created.
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
     * The formatted string was not created. S_FALSE indicates that an empty string resulted from a VT_EMPTY.
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
     * Indicates allocation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psformatfordisplay
     * @since windows6.0.6000
     */
    static PSFormatForDisplay(propkey, propvar, pdfFlags, pwszText, cchText) {
        pwszText := pwszText is String? StrPtr(pwszText) : pwszText

        result := DllCall("PROPSYS.dll\PSFormatForDisplay", "ptr", propkey, "ptr", propvar, "int", pdfFlags, "ptr", pwszText, "uint", cchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a formatted, Unicode string representation of a property value stored in a PROPVARIANT structure. This function allocates memory for the output string.
     * @remarks
     * This function calls the schema subsystem's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-formatfordisplayalloc">IPropertySystem::FormatForDisplayAlloc</a>. That call provides a Unicode string representation of a property value, with additional formatting based on one or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>. If the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> is not recognized by the schema subsystem, <b>IPropertySystem::FormatForDisplayAlloc</b> attempts to format the value according to the value's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a>.
     * 
     * You must initialize Component Object Model (COM) with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before you call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psformatfordisplayalloc">PSFormatForDisplayAlloc</a>.
     * 
     * The function allocates memory through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and returns a pointer to that memory through the <i>ppszDisplay</i> parameter. The calling application must use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release that resource when it is no longer needed.
     * 
     * The purpose of this function is to convert data into a string suitable for display to the user. The value is formatted according to the current locale, the language of the user, the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>, and the property description specified by the property key. For information on how the property description schema influences the formatting of the value, see the following topics:
     *                 
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusstringformat/nl-gdiplusstringformat-stringformat">stringFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-booleanformat">booleanFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-numberformat">numberFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-nmdatetimeformata">NMDATETIMEFORMAT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>
     * </li>
     * </ul>
     *  
     *             
     *                 Typically, the <b>PROPDESC_FORMAT_FLAGS</b> are used to modify the format prescribed by the property description.
     *             
     * 
     * The output string can contain Unicode directional characters. These nonspacing characters influence the Unicode bidirectional algorithm so that the values appear correctly when a left-to-right (LTR) language is drawn on a right-to-left (RTL) window, or an RTL is drawn on a LTR window. These characters include the following: <c>"\x200e", "\x200f", "\x202a", "\x202b", "\x202c", "\x202d", "\x202e".</c>
     * 
     * The following properties use special formats and are unaffected by the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>. Note that examples cited are for strings with a current locale set to English; typically, output is localized except where noted.
     * 
     *                 
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
     * <td>For example, "2 sec."or "1/125 sec." </td>
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
     * If the property key does not correspond to a property description in any of the registered property schemas, then this function chooses a format based on the type of the value.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Type of the value</th>
     * <th>Format</th>
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
     * <td>Decimal string in the current locale. For example, "42". </td>
     * </tr>
     * <tr>
     * <td>VT_LPWSTR or other</td>
     * <td>Converted to a string. Sequences of "\r", "\t", or "\n" are replaced with a single space.</td>
     * </tr>
     * <tr>
     * <td>VT_VECTOR | anything</td>
     * <td>Semicolon separated values. A semicolon is used regardless of locale.</td>
     * </tr>
     * </table>
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> that names the property whose value is being retrieved.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {Integer} pdff Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * One or more flags that specify the format to apply to the property string. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> for possible values.
     * @param {Pointer<Char>} ppszDisplay Type: <b>PWSTR*</b>
     * 
     * When the function returns, contains a pointer to a null-terminated, Unicode string representation of the requested property value.
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
     * The formatted string was successfully created. <b>S_OK</b> together with an empty return string indicates that there was an empty input string or a non-empty value that was formatted as an empty string.
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
     * The formatted string was not created. S_FALSE together with an empty return string indicates that the empty string resulted from a VT_EMPTY.
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
     * Indicates allocation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psformatfordisplayalloc
     * @since windows6.0.6000
     */
    static PSFormatForDisplayAlloc(key, propvar, pdff, ppszDisplay) {
        result := DllCall("PROPSYS.dll\PSFormatForDisplayAlloc", "ptr", key, "ptr", propvar, "int", pdff, "ptr", ppszDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a formatted, Unicode string representation of a property value stored in a property store. This function allocates memory for the output string.
     * @remarks
     * This function uses the <i>ppd</i> parameter to call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescription-formatfordisplay">IPropertyDescription::FormatForDisplay</a>. That call provides a Unicode string representation of a property value, with additional formatting based on one or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>.
     * 
     * You must initialize Component Object Model (COM) with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before you call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psformatpropertyvalue">PSFormatPropertyValue</a>.
     * 
     * The function allocates memory and returns a pointer to that memory in <i>ppszDisplay</i>. The calling application must use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the string specified by <i>ppszDisplay</i> when it is no longer needed.
     * 
     * The purpose of this function is to convert data into a string suitable for display to the user. The value is formatted according to the current locale, the language of the user, the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>, and the property description specified by the property key. For information on how the property description schema influences the formatting of the value, see the following topics:
     *                 
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusstringformat/nl-gdiplusstringformat-stringformat">stringFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-booleanformat">booleanFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-numberformat">numberFormat</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-nmdatetimeformata">NMDATETIMEFORMAT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>
     * </li>
     * </ul>
     *  
     *             
     *                 Typically, the <b>PROPDESC_FORMAT_FLAGS</b> are used to modify the format prescribed by the property description.
     *             
     * 
     * The output string can contain Unicode directional characters. These nonspacing characters influence the Unicode bidirectional algorithm so that the values appear correctly when a left-to-right (LTR) language is drawn on a right-to-left (RTL) window, or an RTL is drawn on a LTR window. These characters include the following: <c>"\x200e", "\x200f", "\x202a", "\x202b", "\x202c", "\x202d", "\x202e".</c>
     * 
     * The following properties use special formats and are unaffected by the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>. Note that examples cited are for strings with a current locale set to English; typically, output is localized except where noted.
     * 
     *                 
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
     * <td>For example, "2 sec."or "1/125 sec." </td>
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
     * If the property key does not correspond to a property description in any of the registered property schemas, then this function chooses a format based on the type of the value.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Type of the value</th>
     * <th>Format</th>
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
     * <td>Decimal string in the current locale. For example, "42". </td>
     * </tr>
     * <tr>
     * <td>VT_LPWSTR or other</td>
     * <td>Converted to a string. Sequences of "\r", "\t", or "\n" are replaced with a single space.</td>
     * </tr>
     * <tr>
     * <td>VT_VECTOR | anything</td>
     * <td>Semicolon separated values. A semicolon is used regardless of locale.</td>
     * </tr>
     * </table>
     * @param {Pointer<IPropertyStore>} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>, which represents the property store from which the property value is taken.
     * @param {Pointer<IPropertyDescription>} ppd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>, which represents the property whose value is being retrieved.
     * @param {Integer} pdff Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> that specify the format to apply to the property string. See <b>PROPDESC_FORMAT_FLAGS</b> for possible values.
     * @param {Pointer<Char>} ppszDisplay Type: <b>LPWSTR*</b>
     * 
     * When the function returns, contains a pointer to the formatted value as a null-terminated, Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psformatpropertyvalue
     * @since windows6.0.6000
     */
    static PSFormatPropertyValue(pps, ppd, pdff, ppszDisplay) {
        result := DllCall("PROPSYS.dll\PSFormatPropertyValue", "ptr", pps, "ptr", ppd, "int", pdff, "ptr", ppszDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets an instance of a property description interface for a specified property.
     * @remarks
     * We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iid_ppv_args">IID_PPV_ARGS</a> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error in <i>riid</i> that could lead to unexpected results.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that specifies the property.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>.
     * @param {Pointer<Char>} ppszImageRes Type: <b>void**</b>
     * 
     * When this function returns successfully, contains the interface pointer requested in <i>riid</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetimagereferenceforvalue
     * @since windows6.1
     */
    static PSGetImageReferenceForValue(propkey, propvar, ppszImageRes) {
        result := DllCall("PROPSYS.dll\PSGetImageReferenceForValue", "ptr", propkey, "ptr", propvar, "ptr", ppszImageRes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a string that identifies a property from that property's key.
     * @remarks
     * The string format retrieved is <c>"{propkey.fmtid} propkey.pid"</code>. For example, the output string for <code>PKEY_Title</code> is <code>"{F29F85E0-4FF9-1068-AB91-08002B27B3D9} 2"</c>.
     * @param {Pointer<PROPERTYKEY>} pkey Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that identifies a property.
     * @param {Pointer<Char>} psz Type: <b>LPWSTR</b>
     * 
     * Pointer to a buffer that receives the output string. The buffer should be large enough to contain PKEYSTR_MAX <b>WCHAR</b><b>s</b>.
     * @param {Integer} cch Type: <b>UINT</b>
     * 
     * The length of the buffer pointed to by <i>psz</i>, in <b>WCHAR</b><b>s</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psstringfrompropertykey
     * @since windows5.1.2600
     */
    static PSStringFromPropertyKey(pkey, psz, cch) {
        psz := psz is String? StrPtr(psz) : psz

        result := DllCall("PROPSYS.dll\PSStringFromPropertyKey", "ptr", pkey, "ptr", psz, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a string to a PROPERTYKEY structure.
     * @remarks
     * The string to be converted must be formatted as <c>"{fmtid} pid"</code>. For instance, the string that corresponds to <code>PKEY_Title</code> is: <code>"{F29F85E0-4FF9-1068-AB91-08002B27B3D9} 2"</c>. <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psstringfrompropertykey">PSStringFromPropertyKey</a> outputs strings in this format.
     * 
     * This function succeeds for any valid property key string, even if the property does not exist in the property schema.
     * @param {Pointer<Char>} pszString Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode string to be converted.
     * @param {Pointer<PROPERTYKEY>} pkey Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * When this function returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertykeyfromstring
     * @since windows5.1.2600
     */
    static PSPropertyKeyFromString(pszString, pkey) {
        pszString := pszString is String? StrPtr(pszString) : pszString

        result := DllCall("PROPSYS.dll\PSPropertyKeyFromString", "ptr", pszString, "ptr", pkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an in-memory property store.
     * @remarks
     * This function creates an in-memory property store object that implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-inamedpropertystore">INamedPropertyStore</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecache">IPropertyStoreCache</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a>, <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipersistserializedpropstorage">IPersistSerializedPropStorage</a>.
     * 
     * The memory property store does not correspond to a file and is designed for use as a cache. <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-commit">IPropertyStore::Commit</a> is a no-op, and the data stored in the object persists only as long as the object does.
     * 
     * The memory property store is thread safe. It aggregates the free-threaded marshaller and uses critical sections to protect its data members.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the requested interface ID.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains a pointer to the desired interface, typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipersistserializedpropstorage">IPersistSerializedPropStorage</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pscreatememorypropertystore
     * @since windows5.1.2600
     */
    static PSCreateMemoryPropertyStore(riid, ppv) {
        result := DllCall("PROPSYS.dll\PSCreateMemoryPropertyStore", "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a read-only, delayed-binding property store that contains multiple property stores.
     * @remarks
     * This function creates a Component Object Model (COM) object that implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>, 
     *  <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-inamedpropertystore">INamedPropertyStore</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iobjectprovider">IObjectProvider</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a>.
     * 
     * Applications must call this object from only one thread at a time.
     * 
     * You must initialize COM with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before you call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatedelayedmultiplexpropertystore">PSCreateDelayedMultiplexPropertyStore</a>. COM must remain initialized for the lifetime of this object.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatedelayedmultiplexpropertystore">PSCreateDelayedMultiplexPropertyStore</a> is designed as an alternative to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatemultiplexpropertystore">PSCreateMultiplexPropertyStore</a>, which requires that the array of property stores be initialized before it creates the multiplex property store.
     * 
     * The delayed binding mechanism is designed as a performance enhancement for calls to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getvalue">IPropertyStore::GetValue</a> on a multiplex property store. When asked for the value of a property, the delayed multiplex property store checks each of the property stores for the value. After the value is found, there is no need to create and initialize subsequent stores. The delayed multiplex property store stops searching for a value when one of the property stores returns a success code and a non-VT_EMPTY value.
     * 
     * When the delayed multiplex property store needs to access a particular property store, it first checks to see if it has already obtained an interface to that property store. If not, it calls <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-idelayedpropertystorefactory-getdelayedpropertystore">IDelayedPropertyStoreFactory::GetDelayedPropertyStore</a> with the appropriate property store ID to obtain the property store. It always uses the property store IDs in the order in which they are provided by the application. It is possible that not all IDs will be used.
     * 
     * If the call to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-idelayedpropertystorefactory">IDelayedPropertyStoreFactory</a> fails with E_NOTIMPL or E_ACCESSDENIED for a particular property store ID, or if the application specified <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GPS_BESTEFFORT</a>, then the failure is ignored and the delayed multiplex property store moves on to the next property store.
     * 
     * In some cases, it might be beneficial to use <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatedelayedmultiplexpropertystore">PSCreateDelayedMultiplexPropertyStore</a> in place of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatemultiplexpropertystore">PSCreateMultiplexPropertyStore</a>. For example, if an application needs to multiplex two property stores and the first property store is not memory-intensive to initialize and provides PKEY_Size information. Often, calling applications ask for a multiplex property store and then ask for only PKEY_Size before they release the object. In such a case, the application could avoid the cost of initializing the second property store by calling <b>PSCreateDelayedMultiplexPropertyStore</b> and implementing <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-idelayedpropertystorefactory">IDelayedPropertyStoreFactory</a>.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> values. These values specify details of the created property store object.
     * @param {Pointer<IDelayedPropertyStoreFactory>} pdpsf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-idelayedpropertystorefactory">IDelayedPropertyStoreFactory</a>*</b>
     * 
     * Interface pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-idelayedpropertystorefactory">IDelayedPropertyStoreFactory</a>.
     * @param {Pointer<UInt32>} rgStoreIds Type: <b>const DWORD*</b>
     * 
     * Pointer to an array of property store IDs. This array does not need to be initialized.
     * @param {Integer} cStores Type: <b>DWORD</b>
     * 
     * The number of elements in the array pointed to by <i>rgStoreIds</i>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the requested IID of the interface that will represent the created property store.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pscreatedelayedmultiplexpropertystore
     * @since windows5.1.2600
     */
    static PSCreateDelayedMultiplexPropertyStore(flags, pdpsf, rgStoreIds, cStores, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSCreateDelayedMultiplexPropertyStore", "int", flags, "ptr", pdpsf, "uint*", rgStoreIds, "uint", cStores, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a read-only property store that contains multiple property stores, each of which must support either IPropertyStore or IPropertySetStorage.
     * @remarks
     * This function creates a Component Object Model (COM) object that implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-inamedpropertystore">INamedPropertyStore</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iobjectprovider">IObjectProvider</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a>. The multiplex property store object aggregates the properties exposed from multiple property stores.
     * 
     * This object can be useful for aggregating the properties from multiple existing property store implementations in a Shell namespace extension, or for reusing an existing property store and providing additional read-only properties.
     * 
     * Applications must call this object from only one thread at a time.
     * 
     * You must initialize COM with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before you call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatedelayedmultiplexpropertystore">PSCreateDelayedMultiplexPropertyStore</a>. COM must remain initialized for the lifetime of this object.
     * 
     * Each of the objects in the array <i>prgpunkStores</i> must implement either <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>. If an object implements <b>IPropertySetStorage</b>, it is wrapped using <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatepropertystorefrompropertysetstorage">PSCreatePropertyStoreFromPropertySetStorage</a> for use in the multiplex property store.
     * 
     * The multiplex property store implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getvalue">IPropertyStore::GetValue</a> asks each of the provided property stores for the value. The multiplex property store stops searching when one of the property stores returns a success code and a non-VT_EMPTY value. Failure codes cause the search to end and are passed back to the calling application.
     * 
     * The multiplex property store implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystorecapabilities-ispropertywritable">IPropertyStoreCapabilities::IsPropertyWritable</a> delegates the call to the first store that implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a>. If multiple stores implement <b>IPropertyStoreCapabilities</b>, the subsequent ones are ignored. If no store implements <b>IPropertyStoreCapabilities</b>, this method returns <b>S_OK</b>.
     * @param {Pointer<IUnknown>} prgpunkStores Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Address of a pointer to an array of property stores that implement either <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>.
     * @param {Integer} cStores Type: <b>DWORD</b>
     * 
     * The number of elements in the array referenced in <i>prgpunkStores</i>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the requested IID.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pscreatemultiplexpropertystore
     * @since windows5.1.2600
     */
    static PSCreateMultiplexPropertyStore(prgpunkStores, cStores, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSCreateMultiplexPropertyStore", "ptr", prgpunkStores, "uint", cStores, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a container for a set of IPropertyChange objects. This container can be used with IFileOperation to apply a set of property changes to a set of files.
     * @remarks
     * This function creates a Component Object Model (COM) object that implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychangearray">IPropertyChangeArray</a>. This object is a container for a set of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a> interfaces and can be used with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> to apply a set of property changes to a set of files.
     * 
     * You must initialize COM with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before you call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatepropertychangearray">PSCreatePropertyChangeArray</a>. COM must remain initialized for the lifetime of this object. The property change array executes in a single-threaded apartment (STA).
     * 
     * A property change array can be initialized either by specifying simple changes by using the parameters, or by using various <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychangearray">IPropertyChangeArray</a> methods to insert or append additional changes.
     * 
     * The parameters are tied together by their index value. For instance, for property rgpropkey[0], the new value rgpropvar[0] is applied as specified by rgflags[0]. The <i>cChanges</i> parameter states how many of these sets there are. Therefore, the number of elements in each array should be the same: ARRAYSIZE(rgpropkey) = ARRAYSIZE(rgflags) = ARRAYSIZE(rgpropvar) = cChanges.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> applies all changes in the property change array to a file simultaneously to avoid opening the file multiple times.
     * @param {Pointer<PROPERTYKEY>} rgpropkey Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures that name the specific properties whose changes are being stored. If this value is <b>NULL</b>, <i>cChanges</i> must be 0.
     * @param {Pointer<Int32>} rgflags Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-pka_flags">PKA_FLAGS</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-pka_flags">PKA_FLAGS</a> values. If this value is <b>NULL</b>, <i>cChanges</i> must be 0.
     * @param {Pointer<PROPVARIANT>} rgpropvar Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures. If this value is <b>NULL</b>, <i>cChanges</i> must be 0.
     * @param {Integer} cChanges Type: <b>UINT</b>
     * 
     * Count of changes to be applied. This is the number of elements in each of the arrays <i>rgpropkey</i>, <i>rgflags</i>, and <i>rgpropvar</i>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the ID of the requested interface.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychangearray">IPropertyChangeArray</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pscreatepropertychangearray
     * @since windows5.1.2600
     */
    static PSCreatePropertyChangeArray(rgpropkey, rgflags, rgpropvar, cChanges, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSCreatePropertyChangeArray", "ptr", rgpropkey, "int*", rgflags, "ptr", rgpropvar, "uint", cChanges, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a simple property change.
     * @remarks
     * Property changes can be placed into an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychangearray">IPropertyChangeArray</a> which can then be used with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> to modify the properties on an item.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-pka_flags">PKA_FLAGS</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-pka_flags">PKA_FLAGS</a> flags.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to a specified IID.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a> interface pointer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pscreatesimplepropertychange
     * @since windows5.1.2600
     */
    static PSCreateSimplePropertyChange(flags, key, propvar, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSCreateSimplePropertyChange", "int", flags, "ptr", key, "ptr", propvar, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets an instance of a property description interface for a property specified by a PROPERTYKEY structure.
     * @remarks
     * We recommend that you use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the interface ID of the requested interface.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionaliasinfo">IPropertyDescriptionAliasInfo</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionsearchinfo">IPropertyDescriptionSearchInfo</a>.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
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
     * The interface was obtained.
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
     * The <i>ppv</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> does not exist in the schema subsystem cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetpropertydescription
     * @since windows5.1.2600
     */
    static PSGetPropertyDescription(propkey, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSGetPropertyDescription", "ptr", propkey, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets an instance of a property description interface for a specified property name.
     * @remarks
     * It is recommended that you use the IID_PPV_ARGS macro, defined in objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, eliminating the possibility of a coding error.
     * 
     * We recommend that <i>pszCanonicalName</i> point to the canonical name of a property, for example, <c>L"System.Keywords"</c>. The canonical name is case sensitive.
     * 
     * In addition to the new canonical names, callers can pass a legacy name for a property. The following table contains the complete list of supported legacy names and the canonical names they correspond to.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Property name</th>
     * <th>Maps to property</th>
     * </tr>
     * <tr>
     * <td>Access</td>
     * <td>System.DateAccessed</td>
     * </tr>
     * <tr>
     * <td>Album</td>
     * <td>System.Music.AlbumTitle</td>
     * </tr>
     * <tr>
     * <td>AllocSize</td>
     * <td>System.FileAllocationSize</td>
     * </tr>
     * <tr>
     * <td>Aperture</td>
     * <td>System.Photo.Aperture</td>
     * </tr>
     * <tr>
     * <td>Artist</td>
     * <td>System.Music.Artist</td>
     * </tr>
     * <tr>
     * <td>Attrib</td>
     * <td>System.FileAttributes</td>
     * </tr>
     * <tr>
     * <td>Attributes</td>
     * <td>System.FileAttributes</td>
     * </tr>
     * <tr>
     * <td>AttributesDescription</td>
     * <td>System.FileAttributesDisplay</td>
     * </tr>
     * <tr>
     * <td>Audio Format</td>
     * <td>System.Audio.Format</td>
     * </tr>
     * <tr>
     * <td>Audio Sample Size</td>
     * <td>System.Audio.SampleSize</td>
     * </tr>
     * <tr>
     * <td>BitDepth</td>
     * <td>System.Image.BitDepth</td>
     * </tr>
     * <tr>
     * <td>Bitrate</td>
     * <td>System.Audio.EncodingBitrate</td>
     * </tr>
     * <tr>
     * <td>CameraModel</td>
     * <td>System.Photo.CameraModel</td>
     * </tr>
     * <tr>
     * <td>Capacity</td>
     * <td>System.Capacity</td>
     * </tr>
     * <tr>
     * <td>Channels</td>
     * <td>System.Audio.ChannelCount</td>
     * </tr>
     * <tr>
     * <td>ColorSpace</td>
     * <td>System.Image.ColorSpace</td>
     * </tr>
     * <tr>
     * <td>Company</td>
     * <td>System.Company</td>
     * </tr>
     * <tr>
     * <td>Compression</td>
     * <td>System.Video.Compression</td>
     * </tr>
     * <tr>
     * <td>Compression</td>
     * <td>System.Video.Compression</td>
     * </tr>
     * <tr>
     * <td>Copyright</td>
     * <td>System.Copyright</td>
     * </tr>
     * <tr>
     * <td>Copyright</td>
     * <td>System.Copyright</td>
     * </tr>
     * <tr>
     * <td>Copyright</td>
     * <td>System.Image.Copyright</td>
     * </tr>
     * <tr>
     * <td>Create</td>
     * <td>System.DateCreated</td>
     * </tr>
     * <tr>
     * <td>CSCStatus</td>
     * <td>System.OfflineStatus</td>
     * </tr>
     * <tr>
     * <td>Data Rate</td>
     * <td>System.Video.EncodingBitrate</td>
     * </tr>
     * <tr>
     * <td>DateDeleted</td>
     * <td>System.Recycle.DateDeleted</td>
     * </tr>
     * <tr>
     * <td>DeletedFrom</td>
     * <td>System.Recycle.DeletedFrom</td>
     * </tr>
     * <tr>
     * <td>Dimensions</td>
     * <td>System.Image.Dimensions</td>
     * </tr>
     * <tr>
     * <td>Directory</td>
     * <td>System.ItemFolderNameDisplay</td>
     * </tr>
     * <tr>
     * <td>Distance</td>
     * <td>System.Photo.SubjectDistance</td>
     * </tr>
     * <tr>
     * <td>DocAppName</td>
     * <td>System.ApplicationName</td>
     * </tr>
     * <tr>
     * <td>DocAuthor</td>
     * <td>System.Author</td>
     * </tr>
     * <tr>
     * <td>DocByteCount</td>
     * <td>System.Document.ByteCount</td>
     * </tr>
     * <tr>
     * <td>DocCategory</td>
     * <td>System.Category</td>
     * </tr>
     * <tr>
     * <td>DocCharCount</td>
     * <td>System.Document.CharacterCount</td>
     * </tr>
     * <tr>
     * <td>DocComments</td>
     * <td>System.Comment</td>
     * </tr>
     * <tr>
     * <td>DocCompany</td>
     * <td>System.Company</td>
     * </tr>
     * <tr>
     * <td>DocCreatedTm</td>
     * <td>System.Document.DateCreated</td>
     * </tr>
     * <tr>
     * <td>DocEditTime</td>
     * <td>System.Document.TotalEditingTime</td>
     * </tr>
     * <tr>
     * <td>DocHiddenCount</td>
     * <td>System.Document.HiddenSlideCount</td>
     * </tr>
     * <tr>
     * <td>DocKeywords</td>
     * <td>System.Keywords</td>
     * </tr>
     * <tr>
     * <td>DocLastAuthor</td>
     * <td>System.Document.LastAuthor</td>
     * </tr>
     * <tr>
     * <td>DocLastPrinted</td>
     * <td>System.Document.DatePrinted</td>
     * </tr>
     * <tr>
     * <td>DocLastSavedTm</td>
     * <td>System.Document.DateSaved</td>
     * </tr>
     * <tr>
     * <td>DocLineCount</td>
     * <td>System.Document.LineCount</td>
     * </tr>
     * <tr>
     * <td>DocManager</td>
     * <td>System.Document.Manager</td>
     * </tr>
     * <tr>
     * <td>DocNoteCount</td>
     * <td>System.Document.NoteCount</td>
     * </tr>
     * <tr>
     * <td>DocPageCount</td>
     * <td>System.Document.PageCount</td>
     * </tr>
     * <tr>
     * <td>DocParaCount</td>
     * <td>System.Document.ParagraphCount</td>
     * </tr>
     * <tr>
     * <td>DocPresentationTarget</td>
     * <td>System.Document.PresentationFormat</td>
     * </tr>
     * <tr>
     * <td>DocRevNumber</td>
     * <td>System.Document.RevisionNumber</td>
     * </tr>
     * <tr>
     * <td>DocSlideCount</td>
     * <td>System.Document.SlideCount</td>
     * </tr>
     * <tr>
     * <td>DocSubject</td>
     * <td>System.Subject</td>
     * </tr>
     * <tr>
     * <td>DocTemplate</td>
     * <td>System.Document.Template</td>
     * </tr>
     * <tr>
     * <td>DocTitle</td>
     * <td>System.Title</td>
     * </tr>
     * <tr>
     * <td>DocWordCount</td>
     * <td>System.Document.WordCount</td>
     * </tr>
     * <tr>
     * <td>DRM Description</td>
     * <td>System.DRM.Description</td>
     * </tr>
     * <tr>
     * <td>Duration</td>
     * <td>System.Media.Duration</td>
     * </tr>
     * <tr>
     * <td>EquipMake</td>
     * <td>System.Photo.CameraManufacturer</td>
     * </tr>
     * <tr>
     * <td>ExposureBias</td>
     * <td>System.Photo.ExposureBias</td>
     * </tr>
     * <tr>
     * <td>ExposureProg</td>
     * <td>System.Photo.ExposureProgram</td>
     * </tr>
     * <tr>
     * <td>ExposureTime</td>
     * <td>System.Photo.ExposureTime</td>
     * </tr>
     * <tr>
     * <td>FaxCallerID</td>
     * <td>System.Fax.CallerID</td>
     * </tr>
     * <tr>
     * <td>FaxCSID</td>
     * <td>System.Fax.CSID</td>
     * </tr>
     * <tr>
     * <td>FaxRecipientName</td>
     * <td>System.Fax.RecipientName</td>
     * </tr>
     * <tr>
     * <td>FaxRecipientNumber</td>
     * <td>System.Fax.RecipientNumber</td>
     * </tr>
     * <tr>
     * <td>FaxRouting</td>
     * <td>System.Fax.Routing</td>
     * </tr>
     * <tr>
     * <td>FaxSenderName</td>
     * <td>System.Fax.SenderName</td>
     * </tr>
     * <tr>
     * <td>FaxTime</td>
     * <td>System.Fax.Time</td>
     * </tr>
     * <tr>
     * <td>FaxTSID</td>
     * <td>System.Fax.TSID</td>
     * </tr>
     * <tr>
     * <td>FileDescription</td>
     * <td>System.FileDescription</td>
     * </tr>
     * <tr>
     * <td>FileSystem</td>
     * <td>System.Volume.FileSystem</td>
     * </tr>
     * <tr>
     * <td>FileType</td>
     * <td>System.Image.FileType</td>
     * </tr>
     * <tr>
     * <td>FileVersion</td>
     * <td>System.FileVersion</td>
     * </tr>
     * <tr>
     * <td>Flash</td>
     * <td>System.Photo.Flash</td>
     * </tr>
     * <tr>
     * <td>FlashEnergy</td>
     * <td>System.Photo.FlashEnergy</td>
     * </tr>
     * <tr>
     * <td>FNumber</td>
     * <td>System.Photo.FNumber</td>
     * </tr>
     * <tr>
     * <td>FocalLength</td>
     * <td>System.Photo.FocalLength</td>
     * </tr>
     * <tr>
     * <td>Frame Rate</td>
     * <td>System.Video.FrameRate</td>
     * </tr>
     * <tr>
     * <td>FrameCount</td>
     * <td>System.Media.FrameCount</td>
     * </tr>
     * <tr>
     * <td>FreeSpace</td>
     * <td>System.FreeSpace</td>
     * </tr>
     * <tr>
     * <td>Genre</td>
     * <td>System.Music.Genre</td>
     * </tr>
     * <tr>
     * <td>ImageX</td>
     * <td>System.Image.HorizontalSize</td>
     * </tr>
     * <tr>
     * <td>ImageY</td>
     * <td>System.Image.VerticalSize</td>
     * </tr>
     * <tr>
     * <td>ISOSpeed</td>
     * <td>System.Photo.ISOSpeed</td>
     * </tr>
     * <tr>
     * <td>LightSource</td>
     * <td>System.Photo.LightSource</td>
     * </tr>
     * <tr>
     * <td>LinksUpToDate</td>
     * <td>System.Document.LinksDirty</td>
     * </tr>
     * <tr>
     * <td>LinkTarget</td>
     * <td>System.Link.TargetParsingPath</td>
     * </tr>
     * <tr>
     * <td>Lyrics</td>
     * <td>System.Music.Lyrics</td>
     * </tr>
     * <tr>
     * <td>Manager</td>
     * <td>System.Document.Manager</td>
     * </tr>
     * <tr>
     * <td>MeteringMode</td>
     * <td>System.Photo.MeteringMode</td>
     * </tr>
     * <tr>
     * <td>MMClipCount</td>
     * <td>System.Document.MultimediaClipCount</td>
     * </tr>
     * <tr>
     * <td>Name</td>
     * <td>System.ItemNameDisplay</td>
     * </tr>
     * <tr>
     * <td>Owner</td>
     * <td>System.FileOwner</td>
     * </tr>
     * <tr>
     * <td>Play Count</td>
     * <td>System.DRM.PlayCount</td>
     * </tr>
     * <tr>
     * <td>Play Expires</td>
     * <td>System.DRM.DatePlayExpires</td>
     * </tr>
     * <tr>
     * <td>Play Starts</td>
     * <td>System.DRM.DatePlayStarts</td>
     * </tr>
     * <tr>
     * <td>PresentationTarget</td>
     * <td>System.Document.PresentationFormat</td>
     * </tr>
     * <tr>
     * <td>ProductName</td>
     * <td>System.Software.ProductName</td>
     * </tr>
     * <tr>
     * <td>ProductVersion</td>
     * <td>System.Software.ProductVersion</td>
     * </tr>
     * <tr>
     * <td>Project</td>
     * <td>System.Media.Project</td>
     * </tr>
     * <tr>
     * <td>Protected</td>
     * <td>System.DRM.IsProtected</td>
     * </tr>
     * <tr>
     * <td>Rank</td>
     * <td>System.Search.Rank</td>
     * </tr>
     * <tr>
     * <td>Rating</td>
     * <td>System.Rating</td>
     * </tr>
     * <tr>
     * <td>ResolutionX</td>
     * <td>System.Image.HorizontalResolution</td>
     * </tr>
     * <tr>
     * <td>ResolutionY</td>
     * <td>System.Image.VerticalResolution</td>
     * </tr>
     * <tr>
     * <td>Sample Rate</td>
     * <td>System.Audio.SampleRate</td>
     * </tr>
     * <tr>
     * <td>Scale</td>
     * <td>System.Document.Scale</td>
     * </tr>
     * <tr>
     * <td>ShutterSpeed</td>
     * <td>System.Photo.ShutterSpeed</td>
     * </tr>
     * <tr>
     * <td>Size</td>
     * <td>System.Size</td>
     * </tr>
     * <tr>
     * <td>Software</td>
     * <td>System.SoftwareUsed</td>
     * </tr>
     * <tr>
     * <td>Status</td>
     * <td>System.Media.Status</td>
     * </tr>
     * <tr>
     * <td>Status</td>
     * <td>System.Status</td>
     * </tr>
     * <tr>
     * <td>Stream Name</td>
     * <td>System.Video.StreamName</td>
     * </tr>
     * <tr>
     * <td>SyncCopyIn</td>
     * <td>System.Sync.CopyIn</td>
     * </tr>
     * <tr>
     * <td>Track</td>
     * <td>System.Music.TrackNumber</td>
     * </tr>
     * <tr>
     * <td>Type</td>
     * <td>System.ItemTypeText</td>
     * </tr>
     * <tr>
     * <td>Video Sample Size</td>
     * <td>System.Video.SampleSize</td>
     * </tr>
     * <tr>
     * <td>WhenTaken</td>
     * <td>System.Photo.DateTaken</td>
     * </tr>
     * <tr>
     * <td>Write</td>
     * <td>System.DateModified</td>
     * </tr>
     * <tr>
     * <td>Year</td>
     * <td>System.Media.Year</td>
     * </tr>
     * </table>
     * @param {Pointer<Char>} pszCanonicalName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that identifies the property.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the interface ID of the requested property.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionaliasinfo">IPropertyDescriptionAliasInfo</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionsearchinfo">IPropertyDescriptionSearchInfo</a>.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
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
     * The interface was obtained.
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
     * The <i>pszCanonicalName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The canonical name does not exist in the schema subsystem cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetpropertydescriptionbyname
     * @since windows5.1.2600
     */
    static PSGetPropertyDescriptionByName(pszCanonicalName, riid, ppv) {
        pszCanonicalName := pszCanonicalName is String? StrPtr(pszCanonicalName) : pszCanonicalName

        result := DllCall("PROPSYS.dll\PSGetPropertyDescriptionByName", "ptr", pszCanonicalName, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the class identifier (CLSID) of a per-computer, registered file property handler.
     * @remarks
     * For information on how to register your handler, see <a href="https://docs.microsoft.com/windows/desktop/properties/building-property-handlers-property-handlers">Initializing Property Handlers</a>.
     * 
     * This function returns only those handlers registered under <b>HKEY_LOCAL_MACHINE</b>.
     * 
     * Most calling applications should not need to call this method or use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to create a property handler directly. Instead, calling applications should use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore">IShellItem2::GetPropertyStore</a> to create a property store for a Shell item on Windows Vista. <b>IShellItem2::GetPropertyStore</b> provides the largest set of available properties for a Shell item, and the most options for customizing exactly which properties to return.
     * 
     * If no property handler is registered for the specified file, this function returns an error code. When this happens, it might still be possible to read certain file system properties from the property store returned from <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore">IShellItem2::GetPropertyStore</a>.
     * 
     * Applications that need to create a property handler from code and that must run both on Windows Vista and on Windows XP can call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetitempropertyhandler">PSGetItemPropertyHandler</a> to create a property store for a Shell item through the Microsoft Windows Desktop Search (WDS) redistributable.
     * @param {Pointer<Char>} pszFilePath Type: <b>PCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode buffer that contains the absolute path of the file whose property handler CLSID is requested.
     * @param {Pointer<Guid>} pclsid Type: <b>CLSID*</b>
     * 
     * When this function returns, contains the requested property handler CLSID.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pslookuppropertyhandlerclsid
     * @since windows5.1.2600
     */
    static PSLookupPropertyHandlerCLSID(pszFilePath, pclsid) {
        pszFilePath := pszFilePath is String? StrPtr(pszFilePath) : pszFilePath

        result := DllCall("PROPSYS.dll\PSLookupPropertyHandlerCLSID", "ptr", pszFilePath, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a property handler for a Shell item. (PSGetItemPropertyHandler)
     * @remarks
     * This function is supported in Windows XP and Windows Vista. For applications supported only on Windows Vista or later, it is recommended that you use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore">IShellItem2::GetPropertyStore</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetitempropertyhandler">PSGetItemPropertyHandler</a>. That method provides a richer set of properties in the property store that is returned.
     * 
     * This function is approximately equivalent to passing the GPS_HANDLERPROPERTIESONLY flag to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore">IShellItem2::GetPropertyStore</a>.
     * 
     * You must initialize Component Object Model (COM) with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before you call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetitempropertyhandler">PSGetItemPropertyHandler</a>. COM must remain initialized for the lifetime of this object.
     * @param {Pointer<IUnknown>} punkItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a Shell item that supports <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * 
     *                     
     * 
     * <b>Windows XP:</b> Use <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellitem">SHCreateShellItem</a> to create the Shell item.
     * 
     * <b>Windows Vista:</b> Use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromidlist">SHCreateItemFromIDList</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromparsingname">SHCreateItemFromParsingName</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromrelativename">SHCreateItemFromRelativeName</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateiteminknownfolder">SHCreateItemInKnownFolder</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemwithparent">SHCreateItemWithParent</a> to create the Shell item.
     * @param {Integer} fReadWrite Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to retrieve a read/write property handler. <b>FALSE</b> to retrieve a read-only property handler.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the IID of the interface the handler object should return. This should be <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or an interface derived from <b>IPropertyStore</b>.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetitempropertyhandler
     * @since windows5.1.2600
     */
    static PSGetItemPropertyHandler(punkItem, fReadWrite, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSGetItemPropertyHandler", "ptr", punkItem, "int", fReadWrite, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a property handler for a Shell item. (PSGetItemPropertyHandlerWithCreateObject)
     * @remarks
     * This function is supported in Windows XP as part of the Microsoft Windows Desktop Search (WDS) redistributable which includes <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> and supporting interfaces. For applications supported only on Windows Vista or later, we recommend that you use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystorewithcreateobject">IShellItem2::GetPropertyStoreWithCreateObject</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetitempropertyhandlerwithcreateobject">PSGetItemPropertyHandlerWithCreateObject</a> because <b>IShellItem2::GetPropertyStoreWithCreateObject</b> provides a richer set of properties in the property store that is returned.
     * 
     * This function is approximately equivalent to passing the GPS_HANDLERPROPERTIESONLY flag to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystorewithcreateobject">IShellItem2::GetPropertyStoreWithCreateObject</a>.
     * 
     * The <i>punkCreateObject</i> parameter enables the creation of a property store in a different context than that of the caller. For instance, the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-icreateobject">ICreateObject</a> implementation can cause the property store to be created in another process. This parameter is used only for property handlers that support it and that are registered under `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\PropertySystem\PropertyHandlers`.
     * 
     * You must initialize Component Object Model (COM) with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> before you call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetitempropertyhandlerwithcreateobject">PSGetItemPropertyHandlerWithCreateObject</a>. COM must remain initialized for the lifetime of this object.
     * @param {Pointer<IUnknown>} punkItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a Shell item that supports <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * 
     *                     
     * 
     * <b>Windows XP:</b> Use <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellitem">SHCreateShellItem</a> to create the Shell item.
     * 
     * <b>Windows Vista:</b> Use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromidlist">SHCreateItemFromIDList</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromparsingname">SHCreateItemFromParsingName</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromrelativename">SHCreateItemFromRelativeName</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateiteminknownfolder">SHCreateItemInKnownFolder</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemwithparent">SHCreateItemWithParent</a> to create the Shell item.
     * @param {Integer} fReadWrite Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to retrieve a read/write property handler. <b>FALSE</b> to retrieve a read-only property handler.
     * @param {Pointer<IUnknown>} punkCreateObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a class factory object that supports <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-icreateobject">ICreateObject</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a>.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetitempropertyhandlerwithcreateobject
     * @since windows5.1.2600
     */
    static PSGetItemPropertyHandlerWithCreateObject(punkItem, fReadWrite, punkCreateObject, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSGetItemPropertyHandlerWithCreateObject", "ptr", punkItem, "int", fReadWrite, "ptr", punkCreateObject, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a property value from a property store.
     * @remarks
     * This helper function is used to read a property value from a store. If the calling code already has a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure, it might be simpler to call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getvalue">IPropertyStore::GetValue</a> directly.
     * @param {Pointer<IPropertyStore>} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface, which represents the property store from which to get the value.
     * @param {Pointer<IPropertyDescription>} ppd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>*</b>
     * 
     * Pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface, which represents the property in the property store.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to an uninitialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. When this function returns, points to the requested property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetpropertyvalue
     * @since windows5.1.2600
     */
    static PSGetPropertyValue(pps, ppd, ppropvar) {
        result := DllCall("PROPSYS.dll\PSGetPropertyValue", "ptr", pps, "ptr", ppd, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the value of a property in a property store.
     * @remarks
     * This helper function is used to write a property value to a store. If the calling code already has a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure, it might be simpler to call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-setvalue">IPropertyStore::SetValue</a> directly.
     * @param {Pointer<IPropertyStore>} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface, which represents the property store that contains the property.
     * @param {Pointer<IPropertyDescription>} ppd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>*</b>
     * 
     * Pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface, which identifies the individual property.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the new value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pssetpropertyvalue
     * @since windows5.1.2600
     */
    static PSSetPropertyValue(pps, ppd, propvar) {
        result := DllCall("PROPSYS.dll\PSSetPropertyValue", "ptr", pps, "ptr", ppd, "ptr", propvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Informs the schema subsystem of the addition of a property description schema file. (PSRegisterPropertySchema)
     * @remarks
     * This function is a wrapper API for the schema subsystem's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-registerpropertyschema">IPropertySystem::RegisterPropertySchema</a>. Call this function only when the file is first installed on the computer. Typically, a setup application calls this function after it installs the .propdesc file, which should be stored in the install directory of the application under Program Files. Multiple calls can be made to <b>IPropertySystem::RegisterPropertySchema</b> in order to register multiple schema files.
     * 
     * When registering property schema files, remember that they can be read by processes running as different users. Therefore, it is important to place a schema file in a location that grants read access to all users on the machine. Similarly, use the absolute path to the file in this function's <i>pszPath</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  Because schemas are specific to the machine and cannot be registered for each individual user, registering a file path under user profiles is not supported on Windows Vista.</div>
     * <div> </div>
     * If a full or partial failure is encountered that prevents a property description from being loaded, the cause is recorded in the application event log. This function fails with E_ACCESSDENIED if the calling context does not have proper privileges, which includes write access to HKEY_LOCAL_MACHINE. It is the responsibility of the calling application to obtain privileges through User Account Control (UAC) mechanisms.
     * @param {Pointer<Char>} pszPath Type: <b>PCWSTR</b>
     * 
     * Pointer to the full file path, as a Unicode string, to the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-entry">property description schema</a> (.propdesc) file on the local machine. This can be either a fully-specified full path, or a full path that includes environment variables such as <c>%PROGRAMFILES%</c>.
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
     * All property descriptions in the schema were registered.
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
     * The calling context does not have proper privileges.
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
     * One or more property descriptions in the schema failed to register. The specific failures are logged in the application event log.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psregisterpropertyschema
     * @since windows5.1.2600
     */
    static PSRegisterPropertySchema(pszPath) {
        pszPath := pszPath is String? StrPtr(pszPath) : pszPath

        result := DllCall("PROPSYS.dll\PSRegisterPropertySchema", "ptr", pszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Informs the schema subsystem of the removal of a property description schema file.
     * @remarks
     * This function is a wrapper for the schema subsystem's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-unregisterpropertyschema">IPropertySystem::UnregisterPropertySchema</a>. Call this method when the file is being uninstalled from the computer. Typically, a setup application calls this method before or after uninstalling the .propdesc file. This method can be called after the file no longer exists.
     * 
     * This function fails with a code of E_ACCESSDENIED if the calling context does not have proper privileges, which include write access to HKLM (HKEY_LOCAL_MACHINE). It is the responsibility of the calling application to obtain privileges through User Account Control (UAC) mechanisms.
     * @param {Pointer<Char>} pszPath Type: <b>PCWSTR</b>
     * 
     * Pointer to the full file path, as a Unicode string, to the property description schema (.propdesc) file on the local machine. This can be either a fully-specified full path, or a full path that includes environment variables such as <c>%PROGRAMFILES%</c>.
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
     * The schema was unregistered.
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
     * The calling context does not have proper privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psunregisterpropertyschema
     * @since windows5.1.2600
     */
    static PSUnregisterPropertySchema(pszPath) {
        pszPath := pszPath is String? StrPtr(pszPath) : pszPath

        result := DllCall("PROPSYS.dll\PSUnregisterPropertySchema", "ptr", pszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Not supported.It is valid to call this function, but it is not implemented to perform any function so there is no reason to do so.
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
     * Schema files reloaded.
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
     * The calling context does not have proper privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psrefreshpropertyschema
     * @since windows5.1.2600
     */
    static PSRefreshPropertySchema() {
        result := DllCall("PROPSYS.dll\PSRefreshPropertySchema", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * A wrapper API that calls the schema subsystem's IPropertySystem::EnumeratePropertyDescriptions.
     * @remarks
     * We recommend that you use the IID_PPV_ARGS macro, defined in objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, eliminating the possibility of a coding error.
     * @param {Integer} filterOn Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_enumfilter">PROPDESC_ENUMFILTER</a></b>
     * 
     * The list to return. <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_enumfilter">PROPDESC_ENUMFILTER</a> shows the valid values for this method.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the  interface ID of the requested interface.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface pointer.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
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
     * Indicates an interface is obtained.
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
     * Indicates that <i>ppv</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psenumeratepropertydescriptions
     * @since windows5.1.2600
     */
    static PSEnumeratePropertyDescriptions(filterOn, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSEnumeratePropertyDescriptions", "int", filterOn, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the property key for a canonical property name.
     * @remarks
     * Property keys uniquely identify a property. For example, <c>PKEY_Keywords</code> corresponds to <code>System.Keywords</c>. This function succeeds only for properties registered as part of the property schema.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionbyname">PSGetPropertyDescriptionByName</a> for a list of legacy property names that are also supported by the function.
     * @param {Pointer<Char>} pszName Type: <b>PCWSTR</b>
     * 
     * Pointer to a property name as a null-terminated, Unicode string.
     * @param {Pointer<PROPERTYKEY>} ppropkey Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * When this function returns, contains the requested property key.
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
     * Property key structure was obtained.
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
     * The <i>pszName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The canonical property name does not exist in the schema subsystem cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetpropertykeyfromname
     * @since windows5.1.2600
     */
    static PSGetPropertyKeyFromName(pszName, ppropkey) {
        pszName := pszName is String? StrPtr(pszName) : pszName

        result := DllCall("PROPSYS.dll\PSGetPropertyKeyFromName", "ptr", pszName, "ptr", ppropkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the canonical name of the property, given its PROPERTYKEY.
     * @remarks
     * Retrieves a canonical name for a specified property key. Like property keys, canonical names uniquely identify a property. For example, <c>System.Keywords</code> is the canonical name for <code>PKEY_Keywords</c>. This function succeeds only for properties registered as part of the property schema.
     * 
     * It is the responsibility of the calling application to use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the string referred to by <i>ppszCanonicalName</i> when it is no longer needed.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that identifies the requested property.
     * @param {Pointer<Char>} ppszCanonicalName Type: <b>PWSTR*</b>
     * 
     * When this function returns, contains a pointer to the property name as a null-terminated Unicode string.
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
     * The property's canonical name is obtained.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> does not exist in the schema subsystem cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetnamefrompropertykey
     * @since windows5.1.2600
     */
    static PSGetNameFromPropertyKey(propkey, ppszCanonicalName) {
        result := DllCall("PROPSYS.dll\PSGetNameFromPropertyKey", "ptr", propkey, "ptr", ppszCanonicalName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts the value of a property to the canonical value, according to the property description.
     * @remarks
     * This function is a wrapper around the system's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescription-coercetocanonicalvalue">IPropertyDescription::CoerceToCanonicalValue</a>.
     * 
     * Most property descriptions specify the type that their values are expected to use. For example, the property description for <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-title">System.Title</a> specifies that System.Title values should be of type VT_LPWSTR. This function coerces values to this type, and then coerces the result into a canonical form.
     * 
     * It is important to note that if this function fails, it will have already called <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-imimeallocator-propvariantclear">PropVariantClear</a> on the input <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. Only if this function succeeds is the calling application responsible for calling <b>PropVariantClear</b> on <i>ppropvar</i> when the structure is no longer needed.
     * 
     * The coercion performed by this function is also performed by the property system during calls to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getvalue">IPropertyStore::GetValue</a> and <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-setvalue">IPropertyStore::SetValue</a>. Applications can either depend on the property system to perform the coercions or can use this function to perform the coercion at a time of the application's choosing.
     * 
     * The coercion is performed in four steps, as follows:
     *         
     *                 
     * 
     * <ol>
     * <li>The following values are converted to VT_EMPTY.
     *                         <ul>
     * <li>Values of type VT_NULL.</li>
     * <li>Values of type VT_LPWSTR, VT_BSTR, or VT_LPSTR whose pointer is <b>NULL</b>.</li>
     * <li>Values of type VT_LPWSTR, VT_BSTR, or VT_LPSTR that are empty or consist entirely of spaces.</li>
     * <li>Values of type VT_FILETIME prior to midnight 1601/01/02.</li>
     * </ul>
     * </li>
     * <li>If the value is not of type VT_EMPTY after Step 1, it is converted to the type specified by the property description. The type of a property description can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescription-getpropertytype">IPropertyDescription::GetPropertyType</a>. For information on how the property schema influences the type of a property description, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a>. Conversions are performed as follows:
     *                         
     *                         <ul>
     * <li>Values of type VT_LPWSTR, VT_BSTR, or VT_LPSTR are converted to VT_VECTOR | VT_LPWSTR using <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-initpropvariantfromstringasvector">InitPropVariantFromStringAsVector</a>.</li>
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
     * <td>VT_EMPTY</td>
     * <td>Always canonical.</td>
     * </tr>
     * <tr>
     * <td>VT_LPWSTR</td>
     * <td>
     * <ul>
     * <li>No leading or trailing spaces. The string is non-empty and non-<b>NULL</b>. For example, L"Alice".</li>
     * <li>If this is a tree property (that is, if the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> element's <i>isTreeProperty</i> attribute is <b>TRUE</b>), then it must not have leading or trailing forward slashes (/), must not have spaces between the text and the forward slashes, and must not have two consecutive forward slashes(/). For example, L"Friend/Bob".</li>
     * <li>Coercion removes unnecessary characters and results in VT_EMPTY if there was no content.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td>VT_VECTOR | VT_LPWSTR</td>
     * <td>
     * <ul>
     * <li>Each string in the vector must adhere to the rules for VT_LPWSTR listed above. In addition, the vector must have no duplicates and have no null pointers.</li>
     * <li>If this is a tree property, then no value can be the ancestor of another value. For example, L"Friend" is an ancestor of L"Friend/Bob".</li>
     * <li>If there is no content, coercion removes duplicate and ancestor characters and results in VT_EMPTY.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * <li>If applicable, the value is checked against the property description type enumeration.  The checks in the following table apply.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Enumeration Type</th>
     * <th>Value Type</th>
     * <th>Canonical Form</th>
     * </tr>
     * <tr>
     * <td>Discrete or Ranged</td>
     * <td>VT_EMPTY</td>
     * <td>Always canonical</td>
     * </tr>
     * <tr>
     * <td>Discrete</td>
     * <td>VT_LPWSTR</td>
     * <td>The string matches one of the enumerated strings allowed for the property. Comparisons are case-insensitive. If not, convert the value to VT_EMPTY.</td>
     * </tr>
     * <tr>
     * <td>Discrete</td>
     * <td>Numeric</td>
     * <td>The number matches one of the enumerated values allowed for the property. If not, convert the value to VT_EMPTY.</td>
     * </tr>
     * <tr>
     * <td>Discrete</td>
     * <td>VT_VECTOR | VT_LPWSTR</td>
     * <td>Each string in the vector matches one of the enumerated strings allowed for the property. Comparisons are case-insensitive. If not, remove that string from the vector. If the resulting vector is empty, convert the value to VT_EMPTY.</td>
     * </tr>
     * <tr>
     * <td>Discrete</td>
     * <td>VT_VECTOR | Numeric</td>
     * <td>Each number in the vector matches one of the enumerated values allowed for the property. If not, remove that number from the vector. If the resulting vector is empty, convert the value to VT_EMPTY.</td>
     * </tr>
     * <tr>
     * <td>Ranged</td>
     * <td>VT_LPWSTR</td>
     * <td>The string exists in the range allowed for the property. Comparisons are case-sensitive. If not, convert the value to VT_EMPTY.</td>
     * </tr>
     * <tr>
     * <td>Ranged</td>
     * <td>Numeric</td>
     * <td>The number exists in the range allowed for the property. If not, convert the value to VT_EMPTY.</td>
     * </tr>
     * <tr>
     * <td>Ranged</td>
     * <td>VT_VECTOR | VT_LPWSTR</td>
     * <td>Each string in the vector exists in the range allowed for the property. Comparisons are case-sensitive. If not, remove that string from the vector. If the resulting vector is empty, convert the value to VT_EMPTY.</td>
     * </tr>
     * <tr>
     * <td>Ranged</td>
     * <td>VT_VECTOR | Numeric</td>
     * <td>Each number in the vector exists in the range allowed for the property. If not, remove that number from the vector. If the resulting vector is empty, convert the value to VT_EMPTY.</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * </ol>
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that identifies the property whose value is to be coerced.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * On entry, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the original value. When this function returns successfully, contains the canonical value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Possible return values include the following:
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Coercion from the value's type to the property description's type was not possible. The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has been cleared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Any other failure code</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Coercion from the value's type to the property description's type was not possible. The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has been cleared.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pscoercetocanonicalvalue
     * @since windows5.1.2600
     */
    static PSCoerceToCanonicalValue(key, ppropvar) {
        result := DllCall("PROPSYS.dll\PSCoerceToCanonicalValue", "ptr", key, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets an instance of a property description list interface for a specified property list.
     * @remarks
     * This function calls the property subsystem implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-getpropertydescriptionlistfromstring">IPropertySystem::GetPropertyDescriptionListFromString</a> to obtain a collection of properties provided as a semicolon-delimited property list string.
     * 
     * We recommend that you use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * 
     * For more information about property schemas, see <a href="https://docs.microsoft.com/windows/desktop/properties/building-property-handlers-property-schemas">Property Schemas</a>.
     * @param {Pointer<Char>} pszPropList Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode string that identifies the property list. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-getpropertydescriptionlistfromstring">IPropertySystem::GetPropertyDescriptionListFromString</a> for more information about the format of this parameter.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the interface ID of the requested interface.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
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
     * The interface was obtained.
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
     * The <i>ppv</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring
     * @since windows5.1.2600
     */
    static PSGetPropertyDescriptionListFromString(pszPropList, riid, ppv) {
        pszPropList := pszPropList is String? StrPtr(pszPropList) : pszPropList

        result := DllCall("PROPSYS.dll\PSGetPropertyDescriptionListFromString", "ptr", pszPropList, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Wraps an IPropertySetStorage interface in an IPropertyStore interface.
     * @remarks
     * This function wraps an <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface in an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface. Any value other than <b>STGM_READ</b> for <i>grfMode</i>, causes calls to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-setvalue">IPropertyStore::SetValue</a> and <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-commit">IPropertyStore::Commit</a> to fail with <b>STG_E_ACCESSDENIED.</b>
     * @param {Pointer<IPropertySetStorage>} ppss Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * Specifies the access mode to enforce. grfMode should match the access mode used to open the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>. Valid values are as follows:
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to an IID.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer specified in <i>riid</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pscreatepropertystorefrompropertysetstorage
     * @since windows5.1.2600
     */
    static PSCreatePropertyStoreFromPropertySetStorage(ppss, grfMode, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSCreatePropertyStoreFromPropertySetStorage", "ptr", ppss, "uint", grfMode, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Accepts the IUnknown interface of an object that supports IPropertyStore or IPropertySetStorage. If the object supports IPropertySetStorage, it is wrapped so that it supports IPropertyStore.
     * @remarks
     * If the object pointed to by <i>punk</i> already supports <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>, no wrapper is created and the <i>punk</i> is returned unaltered.
     * @param {Pointer<IUnknown>} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an interface that supports either <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * Specifies the access mode to use. One of these values:
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the requested IID.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns successfully, contains the address of a pointer to an interface guaranteed to support <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pscreatepropertystorefromobject
     * @since windows5.1.2600
     */
    static PSCreatePropertyStoreFromObject(punk, grfMode, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSCreatePropertyStoreFromObject", "ptr", punk, "uint", grfMode, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an adapter from an IPropertyStore.
     * @remarks
     * The adapter object implements <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iobjectprovider">IObjectProvider</a>.
     * 
     * Use this function if you need an object that implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> with an API that requires an <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface. The object created can also be useful to a namespace extension that wants to provide support for binding to namespace items using <b>IPropertySetStorage</b>. Applications must call this object from only one thread at a time.
     * 
     * The adapter property store created by this function retains a reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface. Therefore, the calling application is free to release its reference to the source <b>IPropertyStore</b> whenever convenient after calling this function.
     * 
     * The adapter property store makes calls to methods on the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface as appropriate. Therefore, if the calling application is writing values to the store, it should call the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-commit">IPropertyStore::Commit</a> method on only one of the interfaces.
     * @param {Pointer<IPropertyStore>} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object that represents the property store.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to an IID.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pscreateadapterfrompropertystore
     * @since windows5.1.2600
     */
    static PSCreateAdapterFromPropertyStore(pps, riid, ppv) {
        result := DllCall("PROPSYS.dll\PSCreateAdapterFromPropertyStore", "ptr", pps, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets an instance of the subsystem object that implements IPropertySystem.
     * @remarks
     * You must initialize Component Object Model (COM) with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> prior to calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertysystem">PSGetPropertySystem</a>.  COM must remain initialized for the lifetime of this object. The property system object aggregates the free-threaded marshaller and is thread-safe.
     * 
     * We recommend that you use the IID_PPV_ARGS macro defined in Objbase.h to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the IID of the requested interface.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertysystem">IPropertySystem</a>.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
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
     * The interface was obtained.
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
     * The <i>ppv</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetpropertysystem
     * @since windows5.1.2600
     */
    static PSGetPropertySystem(riid, ppv) {
        result := DllCall("PROPSYS.dll\PSGetPropertySystem", "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the value of a property as stored in serialized property storage.
     * @remarks
     * This function is intended to be called if the calling application already has a serialized property storage and needs no more than a few properties from storage. If many properties need to be retrieved, performance can be enhanced by creating a memory property store through <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatememorypropertystore">PSCreateMemoryPropertyStore</a>, initializing the property store by calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipersistserializedpropstorage-setpropertystorage">IPersistSerializedPropStorage::SetPropertyStorage</a>, and by using <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> to retrieve the properties.
     * 
     * Note that <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertyfrompropertystorage">PSGetPropertyFromPropertyStorage</a> works only on serialized buffers created by the system implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipersistserializedpropstorage">IPersistSerializedPropStorage</a>. You must first obtain a memory property store by calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatememorypropertystore">PSCreateMemoryPropertyStore</a>. That store can then create a serialized buffer using the <b>IPersistSerializedPropStorage</b> interface.
     * 
     * Although SERIALIZEDPROPSTORAGE is an opaque serialized data structure whose format may change in the future, earlier formats will be supported on subsequent versions of Windows. Because the format is opaque, applications should use supported property storage APIs to access and manipulate the serialized buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipersistserializedpropstorage">IPersistSerializedPropStorage</a>).
     * @param {Pointer} psps Type: <b>PCUSERIALIZEDPROPSTORAGE</b>
     * 
     * Pointer to an allocated buffer that contains the serialized properties. This buffer is obtained by a call to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipersistserializedpropstorage-getpropertystorage">IPersistSerializedPropStorage::GetPropertyStorage</a>.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the <b>USERIALIZESPROPSTORAGE</b> buffer pointed to by <i>psps</i>.
     * @param {Pointer<PROPERTYKEY>} rpkey Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> that identifies the property for which to get the value.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>**</b>
     * 
     * When this function returns, contains the requested value.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetpropertyfrompropertystorage
     * @since windows5.1.2600
     */
    static PSGetPropertyFromPropertyStorage(psps, cb, rpkey, ppropvar) {
        result := DllCall("PROPSYS.dll\PSGetPropertyFromPropertyStorage", "ptr", psps, "uint", cb, "ptr", rpkey, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a value from serialized property storage by property name.
     * @remarks
     * This function is intended to be called if the calling application already has a serialized property storage and needs no more than a few properties from storage. If many properties need to be retrieved, performance can be enhanced by creating a memory property store by calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatememorypropertystore">PSCreateMemoryPropertyStore</a>, initializing the property store by calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipersistserializedpropstorage-setpropertystorage">IPersistSerializedPropStorage::SetPropertyStorage</a>, and using <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-inamedpropertystore">INamedPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> to retrieve the properties.
     * 
     * Note that <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetnamedpropertyfrompropertystorage">PSGetNamedPropertyFromPropertyStorage</a> works only on serialized buffers created by the system implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipersistserializedpropstorage">IPersistSerializedPropStorage</a>. You must first obtain a memory property store by calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatememorypropertystore">PSCreateMemoryPropertyStore</a>; that store can then create a serialized buffer using the <b>IPersistSerializedPropStorage</b> interface.
     * 
     * Although SERIALIZEDPROPSTORAGE is an opaque serialized data structure whose format may change in the future, earlier formats will be supported on subsequent versions of Windows. Because the format is opaque, applications should use supported property storage APIs to access and manipulate the serialized buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipersistserializedpropstorage">IPersistSerializedPropStorage</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertyfrompropertystorage">PSGetPropertyFromPropertyStorage</a>).
     * @param {Pointer} psps Type: <b>PCUSERIALIZEDPROPSTORAGE</b>
     * 
     * A pointer to an allocated buffer that contains the serialized properties. Call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipersistserializedpropstorage-getpropertystorage">IPersistSerializedPropStorage::GetPropertyStorage</a> to obtain the buffer.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the USERIALIZESPROPSTORAGE buffer pointed to by <i>psps</i>.
     * @param {Pointer<Char>} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that contains the name of the property.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the requested value.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-psgetnamedpropertyfrompropertystorage
     * @since windows5.1.2600
     */
    static PSGetNamedPropertyFromPropertyStorage(psps, cb, pszName, ppropvar) {
        pszName := pszName is String? StrPtr(pszName) : pszName

        result := DllCall("PROPSYS.dll\PSGetNamedPropertyFromPropertyStorage", "ptr", psps, "uint", cb, "ptr", pszName, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the type of data value of a property that is stored in a property bag.
     * @remarks
     * <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> and <a href="../ocidl/nn-ocidl-ipersistpropertybag.md">IPersistPropertyBag</a> optimize Save As Text functionality. <b>IPropertyBag</b> and <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a> provide an object with a property bag in which the object can save its properties persistently. <b>IPropertyBag2</b> allows the object to obtain type information for each property: <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768194(v=vs.85)">IPropertyBag2::Read</a> causes one or more properties to be read from the property bag, and <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768195(v=vs.85)">IPropertyBag2::Write</a> causes one or more properties to be saved into the property bag.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object, that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<VARIANT>} var Type: <b>VARIANT*</b>
     * 
     * Returns on successful function completion a pointer to a <b>VARIANT</b> data type that contains the property value.
     * @param {Integer} type Type: <b>VARTYPE*</b>
     * 
     * If <i>type</i> is VT_EMPTY, this function reads the <b>VARIANT</b> of the property in the IPropertyBag   <i>propBag</i> parameter. If <i>type</i> is not VT_EMPTY and not the same as the <b>VARIANT</b> read, then this function attempts to convert the <b>VARIANT</b> read to the <b>VARTYPE</b> defined by <i>type</i> parameter before returning.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readtype
     * @since windows6.1
     */
    static PSPropertyBag_ReadType(propBag, propName, var, type) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadType", "ptr", propBag, "ptr", propName, "ptr", var, "ushort", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the string data value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Char>} value Type: <b>LPCWSTR</b>
     * 
     * When this function returns, contains a pointer to a string property value.
     * @param {Integer} characterCount Type: <b>int</b>
     * 
     * This function returns the  integer that represents the size (maximum number of characters) of the <i>value</i> parameter being returned.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readstr
     * @since windows6.1
     */
    static PSPropertyBag_ReadStr(propBag, propName, value, characterCount) {
        propName := propName is String? StrPtr(propName) : propName
        value := value is String? StrPtr(value) : value

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadStr", "ptr", propBag, "ptr", propName, "ptr", value, "int", characterCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a string data value from a property in a property bag and allocates memory for the string that is read.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<Char>} value Type: <b>PWSTR*</b>
     * 
     * When this function returns, contains a pointer to a string data value from a property in a property bag and allocates memory for the string that is read. The caller of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pspropertybag_readstralloc">PSPropertyBag_ReadStrAlloc</a> function needs to call a <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function on this parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readstralloc
     * @since windows6.1
     */
    static PSPropertyBag_ReadStrAlloc(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadStrAlloc", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a BSTR data value from a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag.  Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Char>} value Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * When this function returns, contains a pointer to a <b>BSTR</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readbstr
     * @since windows6.1
     */
    static PSPropertyBag_ReadBSTR(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadBSTR", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the string value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Char>} value Type: <b>LPCWSTR</b>
     * 
     * The string value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writestr
     * @since windows6.1
     */
    static PSPropertyBag_WriteStr(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName
        value := value is String? StrPtr(value) : value

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteStr", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the BSTR value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Char>} value Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The <b>BSTR</b> value to which the named property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writebstr
     * @since windows6.1
     */
    static PSPropertyBag_WriteBSTR(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteBSTR", "ptr", propBag, "ptr", propName, "char*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads an int data value from a property in a property bag.
     * @remarks
     * If the property bag does not already contain the specified property, the call still succeeds.
     * 
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Int32>} value Type: <b>int*</b>
     * 
     * When this function returns, contains a pointer to an <b>int</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readint
     * @since windows6.1
     */
    static PSPropertyBag_ReadInt(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadInt", "ptr", propBag, "ptr", propName, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the int value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>int</b>
     * 
     * The <b>int</b> value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writeint
     * @since windows6.1
     */
    static PSPropertyBag_WriteInt(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteInt", "ptr", propBag, "ptr", propName, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the SHORT data value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Int16>} value Type: <b>SHORT*</b>
     * 
     * When this function returns, contains a pointer to a SHORT property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readshort
     * @since windows6.1
     */
    static PSPropertyBag_ReadSHORT(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadSHORT", "ptr", propBag, "ptr", propName, "short*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the SHORT value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>SHORT</b>
     * 
     * The SHORT value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writeshort
     * @since windows6.1
     */
    static PSPropertyBag_WriteSHORT(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteSHORT", "ptr", propBag, "ptr", propName, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a LONG data value from a property in a property bag.
     * @remarks
     * If the property bag does not already contain the specified property, the call still succeeds.
     * 
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Int32>} value Type: <b>LONG*</b>
     * 
     * When this function returns, contains a pointer to a <b>LONG</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readlong
     * @since windows6.1
     */
    static PSPropertyBag_ReadLONG(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadLONG", "ptr", propBag, "ptr", propName, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the LONG value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>LONG</b>
     * 
     * The <b>LONG</b> value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writelong
     * @since windows6.1
     */
    static PSPropertyBag_WriteLONG(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteLONG", "ptr", propBag, "ptr", propName, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a DWORD data value from property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<UInt32>} value Type: <b>DWORD*</b>
     * 
     * When this function returns, contains a pointer to a <b>DWORD</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readdword
     * @since windows6.1
     */
    static PSPropertyBag_ReadDWORD(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadDWORD", "ptr", propBag, "ptr", propName, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the DWORD value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>DWORD</b>
     * 
     * A <b>DWORD</b> value to which the named property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writedword
     * @since windows6.1
     */
    static PSPropertyBag_WriteDWORD(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteDWORD", "ptr", propBag, "ptr", propName, "uint", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the BOOL data value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between windows types and the <b>VARIANT</b> type that is used to express values in a property bag.  Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Int32>} value Type: <b>BOOL*</b>
     * 
     * When this function returns successfully, contains a pointer to the value read from the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readbool
     * @since windows6.1
     */
    static PSPropertyBag_ReadBOOL(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadBOOL", "ptr", propBag, "ptr", propName, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the BOOL value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>BOOL</b>
     * 
     * The <b>BOOL</b> value to which the named property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writebool
     * @since windows6.1
     */
    static PSPropertyBag_WriteBOOL(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteBOOL", "ptr", propBag, "ptr", propName, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the property coordinates stored in a POINTL structure of a specified property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<POINTL>} value Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a>*</b>
     * 
     * When this function returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that contains the property coordinates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readpointl
     * @since windows6.1
     */
    static PSPropertyBag_ReadPOINTL(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadPOINTL", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Stores the property coordinates in aPOINTL structure of a specified property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<POINTL>} value Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that specifies the coordinates to store in the  property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writepointl
     * @since windows6.1
     */
    static PSPropertyBag_WritePOINTL(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WritePOINTL", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the property coordinates stored in a POINTS structure of a specified property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<POINTS>} value Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-points">POINTS</a>*</b>
     * 
     * When this function returns successfully, contains a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-points">POINTS</a> structure that contains the property coordinates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readpoints
     * @since windows6.1
     */
    static PSPropertyBag_ReadPOINTS(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadPOINTS", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Stores the property coordinates in aPOINTS structure of a specified property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<POINTS>} value Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-points">POINTS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-points">POINTS</a> structure that specifies the coordinates to store in the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writepoints
     * @since windows6.1
     */
    static PSPropertyBag_WritePOINTS(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WritePOINTS", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the coordinates of a rectangle stored in a property contained in a specified property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<RECTL>} value Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rectl">RECTL</a>*</b>
     * 
     * When this function returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rectl">RECTL</a> structure that contains the property coordinates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readrectl
     * @since windows6.1
     */
    static PSPropertyBag_ReadRECTL(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadRECTL", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Stores the coordinates of a rectangle in a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<RECTL>} value Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rectl">RECTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rectl">RECTL</a> structure that specifies the coordinates to store in the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writerectl
     * @since windows6.1
     */
    static PSPropertyBag_WriteRECTL(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteRECTL", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the data stream stored in a given property contained in a specified property bag.
     * @remarks
     * The caller of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pspropertybag_readstream">PSPropertyBag_ReadStream</a> function needs to call a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object returned by this function.
     * 
     * 
     * 
     * <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> and <a href="../ocidl/nn-ocidl-ipersistpropertybag.md">IPersistPropertyBag</a> optimize Save As Text functionality. <b>IPropertyBag</b> and <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a> provide an object with a property bag in which the object can save its properties persistently. <b>IPropertyBag2</b> allows the object to obtain type information for each property: <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768194(v=vs.85)">IPropertyBag2::Read</a> causes one or more properties to be read from the property bag, and <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768195(v=vs.85)">IPropertyBag2::Write</a> causes one or more properties to be saved into the property bag.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object, that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<IStream>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The address of a pointer that, when this function returns successfully, receives the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readstream
     * @since windows6.1
     */
    static PSPropertyBag_ReadStream(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadStream", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a data stream to a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<IStream>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object to write to the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writestream
     * @since windows6.1
     */
    static PSPropertyBag_WriteStream(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteStream", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deletes a property from a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_delete
     * @since windows6.1
     */
    static PSPropertyBag_Delete(propBag, propName) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_Delete", "ptr", propBag, "ptr", propName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a ULONGLONG data value from a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<UInt64>} value Type: <b>ULONGLONG</b>
     * 
     * When this function returns, contains a pointer to a <b>ULONGLONG</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readulonglong
     * @since windows6.1
     */
    static PSPropertyBag_ReadULONGLONG(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadULONGLONG", "ptr", propBag, "ptr", propName, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the ULONGLONG value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>ULONGLONG</b>
     * 
     * An <b>ULONGLONG</b> value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writeulonglong
     * @since windows6.1
     */
    static PSPropertyBag_WriteULONGLONG(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteULONGLONG", "ptr", propBag, "ptr", propName, "uint", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a given property of an unknown data value in a property bag.
     * @remarks
     * <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> and <a href="../ocidl/nn-ocidl-ipersistpropertybag.md">IPersistPropertyBag</a> optimize Save As Text functionality. <b>IPropertyBag</b> and <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a> provide an object with a property bag in which the object can save its properties persistently. <b>IPropertyBag2</b> allows the object to obtain type information for each property: <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768194(v=vs.85)">IPropertyBag2::Read</a> causes one or more properties to be read from the property bag, and <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768195(v=vs.85)">IPropertyBag2::Write</a> causes one or more properties to be saved into the property bag.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object, that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>. This interface IID should be <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> or an interface derived from <b>IPropertyBag</b>.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically <i>riid</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readunknown
     * @since windows6.1
     */
    static PSPropertyBag_ReadUnknown(propBag, propName, riid, ppv) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadUnknown", "ptr", propBag, "ptr", propName, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a property of an unknown data value in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<IUnknown>} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> derived interface that copies the specified property of an unknown data value in a property bag.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writeunknown
     * @since windows6.1
     */
    static PSPropertyBag_WriteUnknown(propBag, propName, punk) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteUnknown", "ptr", propBag, "ptr", propName, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the GUID data value from a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Guid>} value Type: <b>GUID*</b>
     * 
     * When this function returns, contains a pointer to a GUID property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readguid
     * @since windows6.1
     */
    static PSPropertyBag_ReadGUID(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadGUID", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the GUID value of a property in a property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag.  Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Guid>} value Type: <b>const GUID*</b>
     * 
     * A pointer to a GUID value to which the named property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writeguid
     * @since windows6.1
     */
    static PSPropertyBag_WriteGUID(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteGUID", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the property key of a property in a specified property bag.
     * @remarks
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<PROPERTYKEY>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * When this function returns, contains a pointer to a property key value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_readpropertykey
     * @since windows6.1
     */
    static PSPropertyBag_ReadPropertyKey(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadPropertyKey", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the property key value of a property in a property bag.
     * @remarks
     * Property keys uniquely identify a property. For example, <c>PKEY_Keywords</code> corresponds to <code>System.Keywords</c>. This function succeeds only for properties registered as part of the property schema.
     * 
     * The property bag property function API converts between window types and the <b>VARIANT</b> type that is used to express values in a property bag. Doing so eases property bag usage, simplifies applications, and avoids common coding errors.
     * @param {Pointer<IPropertyBag>} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {Pointer<Char>} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<PROPERTYKEY>} value Type: <b>REFPROPERTYKEY</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that specifies the property key value to store in the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-pspropertybag_writepropertykey
     * @since windows6.1
     */
    static PSPropertyBag_WritePropertyKey(propBag, propName, value) {
        propName := propName is String? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WritePropertyKey", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves an object that supports IPropertyStore or related interfaces from a pointer to an item identifier list (PIDL).
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A pointer to an item ID list.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired interface ID.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or a related interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shgetpropertystorefromidlist
     * @since windows6.0.6000
     */
    static SHGetPropertyStoreFromIDList(pidl, flags, riid, ppv) {
        result := DllCall("SHELL32.dll\SHGetPropertyStoreFromIDList", "ptr", pidl, "int", flags, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns a property store for an item, given a path or parsing name.
     * @param {Pointer<Char>} pszPath Type: <b>PCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that specifies the item path.
     * @param {Pointer<IBindCtx>} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> object, which provides access to a bind context. This value can be <b>NULL</b>.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired interface ID.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or a related interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shgetpropertystorefromparsingname
     * @since windows6.0.6000
     */
    static SHGetPropertyStoreFromParsingName(pszPath, pbc, flags, riid, ppv) {
        pszPath := pszPath is String? StrPtr(pszPath) : pszPath

        result := DllCall("SHELL32.dll\SHGetPropertyStoreFromParsingName", "ptr", pszPath, "ptr", pbc, "int", flags, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds default properties to the property store as registered for the specified file extension.
     * @remarks
     * The list of properties used to set a default value comes from the <c>SetDefaultsFor</code> registry value of the ProgID for the file association of the specified file extension. The list is prefixed by "<code>prop:</code>" and contains the canonical names of the properties to set the default value, such as: "<code>prop:System.Author;System.Document.DateCreated</code>". The possible properties for this list are <b>System.Author</b>, <b>System.Document.DateCreated</b>, and <b>System.Photo.DateTaken</b>. If the <code>SetDefaultsFor</code> value does not exist on the ProgID, this function uses the default found on the <code>SetDefaultsFor</c> value of <b>HKEY_CLASSES_ROOT\*</b>.
     * 
     * <b>System.Author</b> has the value of the user that performed the action. <b>System.Document.DateCreated</b> and <b>System.Photo.DateTaken</b> use the current date. These three properties are the only ones for which the system provides special defaults.
     * 
     * Note that there are several types of properties: 
     * 
     *                 
     * 
     * <ol>
     * <li>Properties that derive from the file system (such as, size and date created)</li>
     * <li>Properties that derive from the file (such as, dimensions and number of pages)</li>
     * <li>Properties that are placed in the file (such as, author and tags)</li>
     * </ol>
     * When creating a new file, types one and two are provided just by creating the file. But properties of type three must be set explicitly by a program. The system provides <b>SHAddDefaultPropertiesByExt</b> to provide values for up to three specific properties of type three. Sometimes Windows Explorer uses this API when saving a file for the first time, or when creating a new file after the menu choice <b>New</b> is selected from a shortcut menu.
     * @param {Pointer<Char>} pszExt Type: <b>PCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that specifies the extension.
     * @param {Pointer<IPropertyStore>} pPropStore Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface that defines the default properties to add.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-shadddefaultpropertiesbyext
     * @since windows6.0.6000
     */
    static SHAddDefaultPropertiesByExt(pszExt, pPropStore) {
        pszExt := pszExt is String? StrPtr(pszExt) : pszExt

        result := DllCall("SHELL32.dll\SHAddDefaultPropertiesByExt", "ptr", pszExt, "ptr", pPropStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens the .pif file associated with a Microsoft MS-DOS application, and returns a handle to the application's properties.
     * @remarks
     * You should not think of <b>PifMgr_OpenProperties</b> as a function that opens a file somewhere. The .pif file does not remain open after this call. It is more useful to think of the function as a property structure allocator that you can initialize using disk data. 
     * The primary reason why this function fails is because of low memory or inability to open the specified .pif file.
     * 
     * If no .pif file exists, the function still allocates a data block in memory and initializes it with data from _Default.pif or its internal defaults.  If the function looks for a .pif file name but does not find it, it constructs a name and saves it in its internal .pif data structure. This guarantees that if <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-pifmgr_setproperties">PifMgr_SetProperties</a> is called, the data is saved to disk.
     * 
     * If the function does not find the .pif file, it searches for it in the following order. 
     * 
     * 				
     * 
     * <ol>
     * <li>Searches the current directory.</li>
     * <li>Searches the specified directory.</li>
     * <li>Searches in .pif directory.</li>
     * <li>Searches the folders specified by the PATH environment variable.</li>
     * </ol>
     * @param {Pointer<Char>} pszApp Type: <b>PCWSTR</b>
     * 
     * A null-terminated Unicode string that contains the application's name.
     * @param {Pointer<Char>} pszPIF Type: <b>PCWSTR</b>
     * 
     * A null-terminated Unicode string that contains the name of the .pif file.
     * @param {Integer} hInf Type: <b>UINT</b>
     * 
     * A handle to the application's .inf file. Set this value to zero if there is no .inf file. Set this value to -1 to prevent the .inf file from being processed.
     * @param {Integer} flOpt Type: <b>UINT</b>
     * 
     * A flag that controls how the function operates.
     * @returns {Pointer<Void>} Type: <b>HANDLE</b>
     * 
     * Returns a handle to the application's properties. Use this handle when you call the related .pif functions.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pifmgr_openproperties
     * @since windows5.0
     */
    static PifMgr_OpenProperties(pszApp, pszPIF, hInf, flOpt) {
        pszApp := pszApp is String? StrPtr(pszApp) : pszApp
        pszPIF := pszPIF is String? StrPtr(pszPIF) : pszPIF

        result := DllCall("SHELL32.dll\PifMgr_OpenProperties", "ptr", pszApp, "ptr", pszPIF, "uint", hInf, "uint", flOpt)
        return result
    }

    /**
     * Returns a specified block of data from a .pif file.
     * @remarks
     * If the block is a "named" block, it must be the name of a linked extension inside the .pif file. This can be any predefined name (such as, "WINDOWS 386 3.0") or the name of your own block. You can create your own named data blocks using <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-pifmgr_setproperties">PifMgr_SetProperties</a>. Named data can also be thought of as raw data, because it is returned to the calling application as it is, without translation.
     * 
     * The size of a named block can be determined by calling <b>PifMgr_GetProperties</b> with <i>cbProps</i> set to 0. No data is copied, but the size of the requested block is returned.
     * 
     * All named blocks can be enumerated by setting <i>pszGroup</i> to <b>NULL</b>. <i>lpProps</i> must be a pointer to a 16-byte buffer to contain the requested block name, and <i>cbProps</i> must be set to the zero-based block index.  The return value is the size of the block, or zero if the block is not found.
     * 
     * If you request an unnamed property block by setting the selector of the name parameter to <b>NULL</b>, and the offset is a property group ordinal, then the associated structure is returned. For example, PifMgr_GetProperties(GROUP_TSK) returns a predefined structure that contains all the task-related information in a format that is independent of the .pif file. This is a valuable service because it relieves calling applications from dealing with .pif files that contain a wide variety of sections (known as .pif extensions), when only one is required.
     * @param {Pointer<Void>} hProps Type: <b>HANDLE</b>
     * 
     * A handle to an application's properties. This parameter should be set to the value that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-pifmgr_openproperties">PifMgr_OpenProperties</a>.
     * @param {Pointer<Byte>} pszGroup Type: <b>PCSTR</b>
     * 
     * A null-terminated string that contains the property group name. It can be one of the following, or any other name that corresponds to a valid .pif extension.
     * @param {Pointer} lpProps Type: <b>void*</b>
     * 
     * When this function returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-propprg">PROPPRG</a> structure.
     * @param {Integer} cbProps Type: <b>int</b>
     * 
     * The size of the buffer, in bytes, pointed to by <i>lpProps</i>.
     * @param {Integer} flOpt Type: <b>UINT</b>
     * 
     * Set this parameter to GETPROPS_NONE.
     * @returns {Integer} Type: <b>int</b>
     * 
     * Returns <b>NULL</b> if successful. If unsuccessful, the function returns the handle to the application properties that were passed as <i>hProps</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pifmgr_getproperties
     * @since windows5.0
     */
    static PifMgr_GetProperties(hProps, pszGroup, lpProps, cbProps, flOpt) {
        pszGroup := pszGroup is String? StrPtr(pszGroup) : pszGroup

        result := DllCall("SHELL32.dll\PifMgr_GetProperties", "ptr", hProps, "ptr", pszGroup, "ptr", lpProps, "int", cbProps, "uint", flOpt, "int")
        return result
    }

    /**
     * Assigns values to a block of data from a .pif file.
     * @param {Pointer<Void>} hProps Type: <b>HANDLE</b>
     * 
     * A handle to the application's properties. This parameter should be set to the value that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-pifmgr_openproperties">PifMgr_OpenProperties</a>.
     * @param {Pointer<Byte>} pszGroup Type: <b>PCSTR</b>
     * 
     * A null-terminated ANSI string containing the property group name. It can be one of the following, or any other name that corresponds to a valid .pif extension.
     * @param {Pointer} lpProps Type: <b>const void*</b>
     * 
     * A property group record buffer that holds the data.
     * @param {Integer} cbProps Type: <b>int</b>
     * 
     * The size of the buffer, in bytes, pointed to by <i>lpProps</i>.
     * @param {Integer} flOpt Type: <b>UINT</b>
     * 
     * Always SETPROPS_NONE.
     * @returns {Integer} Type: <b>int</b>
     * 
     * Returns the amount of information transferred, in bytes. Returns zero if the group cannot be found or an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pifmgr_setproperties
     * @since windows5.0
     */
    static PifMgr_SetProperties(hProps, pszGroup, lpProps, cbProps, flOpt) {
        pszGroup := pszGroup is String? StrPtr(pszGroup) : pszGroup

        result := DllCall("SHELL32.dll\PifMgr_SetProperties", "ptr", hProps, "ptr", pszGroup, "ptr", lpProps, "int", cbProps, "uint", flOpt, "int")
        return result
    }

    /**
     * Closes application properties that were opened with PifMgr_OpenProperties.
     * @param {Pointer<Void>} hProps Type: <b>HANDLE</b>
     * 
     * A handle to the application's properties. This parameter should be set to the value that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-pifmgr_openproperties">PifMgr_OpenProperties</a>.
     * @param {Integer} flOpt Type: <b>UINT</b>
     * 
     * A flag that specifies how the function operates.
     * @returns {Pointer<Void>} Type: <b>int</b>
     * 
     * Returns <b>NULL</b> if successful. If unsuccessful, the functions returns the handle to the application properties that was passed as <i>hProps</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pifmgr_closeproperties
     * @since windows5.0
     */
    static PifMgr_CloseProperties(hProps, flOpt) {
        result := DllCall("SHELL32.dll\PifMgr_CloseProperties", "ptr", hProps, "uint", flOpt)
        return result
    }

    /**
     * Ensures proper handling of code page retrieval or assignment for the requested property set operation.
     * @param {Pointer<IPropertySetStorage>} psstg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * A property set ID to open. The values for this parameter can be either one of those defined in <a href="https://docs.microsoft.com/windows/desktop/Stg/predefined-property-set-format-identifiers">Predefined Property Set Format Identifiers</a> or any other FMTID that you register.
     * @param {Pointer<Guid>} pclsid Type: <b>const CLSID*</b>
     * 
     * A pointer to the CLSID associated with the set. This parameter can be <b>NULL</b>.
     * @param {Integer} grfFlags Type: <b>DWORD</b>
     * 
     * One or more members of the <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG</a> enumeration that determine how the property set is created and opened. All sets containing ANSI bytes should be created with PROPSETFLAG_ANSI, otherwise PROPSETFLAG_DEFAULT.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * The flags from the <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> enumeration that indicate conditions for creating and deleting the object and access modes for the object. Must contain STGM_DIRECT | STGM_SHARE_EXCLUSIVE.
     * @param {Integer} dwDisposition Type: <b>DWORD</b>
     * @param {Pointer<IPropertyStorage>} ppstg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>**</b>
     * 
     * When this method returns, contains an <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface pointer.
     * @param {Pointer<UInt32>} puCodePage Type: <b>UINT*</b>
     * 
     * When this method returns, contains the address of the code page ID for the set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shpropstgcreate
     * @since windows5.0
     */
    static SHPropStgCreate(psstg, fmtid, pclsid, grfFlags, grfMode, dwDisposition, ppstg, puCodePage) {
        result := DllCall("SHELL32.dll\SHPropStgCreate", "ptr", psstg, "ptr", fmtid, "ptr", pclsid, "uint", grfFlags, "uint", grfMode, "uint", dwDisposition, "ptr", ppstg, "uint*", puCodePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Wraps the IPropertyStorage::ReadMultiple function to ensure that ANSI and Unicode translations are handled properly for deprecated property sets.
     * @param {Pointer<IPropertyStorage>} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface pointer that identifies the property store.
     * @param {Integer} uCodePage Type: <b>UINT</b>
     * 
     * A code page value for ANSI string properties.
     * @param {Integer} cpspec Type: <b>ULONG</b>
     * 
     * A count of properties being read.
     * @param {Pointer<PROPSPEC>} rgpspec Type: <b>PROPSPEC const[]</b>
     * 
     * An array of properties to be read.
     * @param {Pointer<PROPVARIANT>} rgvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>[]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> types that, when this function returns successfully, receives the property values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shpropstgreadmultiple
     * @since windows5.1.2600
     */
    static SHPropStgReadMultiple(pps, uCodePage, cpspec, rgpspec, rgvar) {
        result := DllCall("SHELL32.dll\SHPropStgReadMultiple", "ptr", pps, "uint", uCodePage, "uint", cpspec, "ptr", rgpspec, "ptr", rgvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Wraps the IPropertyStorage::WriteMultiple function to ensure that ANSI and Unicode translations are handled properly for deprecated property sets.
     * @param {Pointer<IPropertyStorage>} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface pointer that identifies the property store.
     * @param {Pointer<UInt32>} puCodePage Type: <b>UINT*</b>
     * 
     * A pointer to the code page value for ANSI string properties.
     * @param {Integer} cpspec Type: <b>ULONG</b>
     * 
     * A count of properties being set.
     * @param {Pointer<PROPSPEC>} rgpspec Type: <b>PROPSPEC const[]</b>
     * 
     * An array of PROPSPEC structures that contain the property information to be set.
     * @param {Pointer<PROPVARIANT>} rgvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>[]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> types to set the property values.
     * @param {Integer} propidNameFirst Type: <b>PROPID</b>
     * 
     * The minimum value for property identifiers when they must be allocated. The value should be greater than or equal to PID_FIRST_USABLE.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shpropstgwritemultiple
     * @since windows5.1.2600
     */
    static SHPropStgWriteMultiple(pps, puCodePage, cpspec, rgpspec, rgvar, propidNameFirst) {
        result := DllCall("SHELL32.dll\SHPropStgWriteMultiple", "ptr", pps, "uint*", puCodePage, "uint", cpspec, "ptr", rgpspec, "ptr", rgvar, "uint", propidNameFirst, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves an object that represents a specific window's collection of properties, which allows those properties to be queried or set.
     * @remarks
     * An application can use this function to obtain access to a window's property store so that it can set an explicit Application User Model ID (AppUserModelID) in the <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-appusermodel-id">System.AppUserModel.ID</a> property.
     * 
     * A window's properties must be removed before the window is closed. If this is not done, the resources used by those properties are not returned to the system. A property is removed by setting it to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> type VT_EMPTY.
     * 
     * When a call is made to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-setvalue">IPropertyStore::SetValue</a> on the object retrieved through <i>ppv</i>, the properties and values are immediately stored on the window. Therefore, no call to <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-commit">IPropertyStore::Commit</a> is needed. No error occurs if it is called, but it has no effect.
     * 
     * An application sets AppUserModelIDs on individual windows to control the application's taskbar grouping and Jump List contents. For instance, a suite application might want to provide a different taskbar button for each of its subfeatures, with the windows relating to that subfeature grouped under that button. Without window-level AppUserModelIDs, those windows would all be grouped together under the main process.
     * 
     * Applications should also use this property store to set these relaunch properties so that the system can return the application to that state.
     * 
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-appusermodel-relaunchcommand">System.AppUserModel.RelaunchCommand</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-appusermodel-relaunchdisplaynameresource">System.AppUserModel.RelaunchDisplayNameResource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-appusermodel-relaunchiconresource">System.AppUserModel.RelaunchIconResource</a>
     * </li>
     * </ul>
     * @param {Pointer<Void>} hwnd Type: <b>HWND</b>
     * 
     * A handle to the window whose properties are being retrieved.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the property store object to retrieve through <i>ppv</i>. This is typically IID_IPropertyStore.
     * @param {Pointer<Void>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetpropertystoreforwindow
     * @since windows6.1
     */
    static SHGetPropertyStoreForWindow(hwnd, riid, ppv) {
        result := DllCall("SHELL32.dll\SHGetPropertyStoreForWindow", "ptr", hwnd, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
