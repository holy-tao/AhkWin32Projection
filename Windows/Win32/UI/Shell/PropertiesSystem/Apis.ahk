#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

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
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> that names the property whose value is being retrieved.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {Integer} pdfFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * A flag that specifies the format to apply to the property string. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> for possible values.
     * @param {PWSTR} pwszText Type: <b>LPWSTR</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psformatfordisplay
     * @since windows6.0.6000
     */
    static PSFormatForDisplay(propkey, propvar, pdfFlags, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := DllCall("PROPSYS.dll\PSFormatForDisplay", "ptr", propkey, "ptr", propvar, "int", pdfFlags, "ptr", pwszText, "uint", cchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a formatted, Unicode string representation of a property value stored in a PROPVARIANT structure. This function allocates memory for the output string.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> that names the property whose value is being retrieved.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {Integer} pdff Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * One or more flags that specify the format to apply to the property string. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> for possible values.
     * @param {Pointer<PWSTR>} ppszDisplay Type: <b>PWSTR*</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psformatfordisplayalloc
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
     * @param {IPropertyStore} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>, which represents the property store from which the property value is taken.
     * @param {IPropertyDescription} ppd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>, which represents the property whose value is being retrieved.
     * @param {Integer} pdff Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> that specify the format to apply to the property string. See <b>PROPDESC_FORMAT_FLAGS</b> for possible values.
     * @param {Pointer<PWSTR>} ppszDisplay Type: <b>LPWSTR*</b>
     * 
     * When the function returns, contains a pointer to the formatted value as a null-terminated, Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psformatpropertyvalue
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
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that specifies the property.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>.
     * @param {Pointer<PWSTR>} ppszImageRes Type: <b>void**</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetimagereferenceforvalue
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
     * @param {Pointer<PROPERTYKEY>} pkey Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that identifies a property.
     * @param {PWSTR} psz Type: <b>LPWSTR</b>
     * 
     * Pointer to a buffer that receives the output string. The buffer should be large enough to contain PKEYSTR_MAX <b>WCHAR</b><b>s</b>.
     * @param {Integer} cch Type: <b>UINT</b>
     * 
     * The length of the buffer pointed to by <i>psz</i>, in <b>WCHAR</b><b>s</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psstringfrompropertykey
     * @since windows5.1.2600
     */
    static PSStringFromPropertyKey(pkey, psz, cch) {
        psz := psz is String ? StrPtr(psz) : psz

        result := DllCall("PROPSYS.dll\PSStringFromPropertyKey", "ptr", pkey, "ptr", psz, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a string to a PROPERTYKEY structure.
     * @param {PWSTR} pszString Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode string to be converted.
     * @param {Pointer<PROPERTYKEY>} pkey Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * When this function returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertykeyfromstring
     * @since windows5.1.2600
     */
    static PSPropertyKeyFromString(pszString, pkey) {
        pszString := pszString is String ? StrPtr(pszString) : pszString

        result := DllCall("PROPSYS.dll\PSPropertyKeyFromString", "ptr", pszString, "ptr", pkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an in-memory property store.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the requested interface ID.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains a pointer to the desired interface, typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipersistserializedpropstorage">IPersistSerializedPropStorage</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pscreatememorypropertystore
     * @since windows5.1.2600
     */
    static PSCreateMemoryPropertyStore(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSCreateMemoryPropertyStore", "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a read-only, delayed-binding property store that contains multiple property stores.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> values. These values specify details of the created property store object.
     * @param {IDelayedPropertyStoreFactory} pdpsf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-idelayedpropertystorefactory">IDelayedPropertyStoreFactory</a>*</b>
     * 
     * Interface pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-idelayedpropertystorefactory">IDelayedPropertyStoreFactory</a>.
     * @param {Pointer<Integer>} rgStoreIds Type: <b>const DWORD*</b>
     * 
     * Pointer to an array of property store IDs. This array does not need to be initialized.
     * @param {Integer} cStores Type: <b>DWORD</b>
     * 
     * The number of elements in the array pointed to by <i>rgStoreIds</i>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the requested IID of the interface that will represent the created property store.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pscreatedelayedmultiplexpropertystore
     * @since windows5.1.2600
     */
    static PSCreateDelayedMultiplexPropertyStore(flags, pdpsf, rgStoreIds, cStores, riid, ppv) {
        rgStoreIdsMarshal := rgStoreIds is VarRef ? "uint*" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSCreateDelayedMultiplexPropertyStore", "int", flags, "ptr", pdpsf, rgStoreIdsMarshal, rgStoreIds, "uint", cStores, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a read-only property store that contains multiple property stores, each of which must support either IPropertyStore or IPropertySetStorage.
     * @param {Pointer<IUnknown>} prgpunkStores Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Address of a pointer to an array of property stores that implement either <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>.
     * @param {Integer} cStores Type: <b>DWORD</b>
     * 
     * The number of elements in the array referenced in <i>prgpunkStores</i>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the requested IID.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pscreatemultiplexpropertystore
     * @since windows5.1.2600
     */
    static PSCreateMultiplexPropertyStore(prgpunkStores, cStores, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSCreateMultiplexPropertyStore", "ptr*", prgpunkStores, "uint", cStores, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a container for a set of IPropertyChange objects. This container can be used with IFileOperation to apply a set of property changes to a set of files.
     * @param {Pointer<PROPERTYKEY>} rgpropkey Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures that name the specific properties whose changes are being stored. If this value is <b>NULL</b>, <i>cChanges</i> must be 0.
     * @param {Pointer<Integer>} rgflags Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-pka_flags">PKA_FLAGS</a>*</b>
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
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychangearray">IPropertyChangeArray</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pscreatepropertychangearray
     * @since windows5.1.2600
     */
    static PSCreatePropertyChangeArray(rgpropkey, rgflags, rgpropvar, cChanges, riid, ppv) {
        rgflagsMarshal := rgflags is VarRef ? "int*" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSCreatePropertyChangeArray", "ptr", rgpropkey, rgflagsMarshal, rgflags, "ptr", rgpropvar, "uint", cChanges, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a simple property change.
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
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a> interface pointer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pscreatesimplepropertychange
     * @since windows5.1.2600
     */
    static PSCreateSimplePropertyChange(flags, key, propvar, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSCreateSimplePropertyChange", "int", flags, "ptr", key, "ptr", propvar, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets an instance of a property description interface for a property specified by a PROPERTYKEY structure.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the interface ID of the requested interface.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
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
     * The <a href="/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> does not exist in the schema subsystem cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetpropertydescription
     * @since windows5.1.2600
     */
    static PSGetPropertyDescription(propkey, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSGetPropertyDescription", "ptr", propkey, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets an instance of a property description interface for a specified property name.
     * @param {PWSTR} pszCanonicalName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that identifies the property.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the interface ID of the requested property.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetpropertydescriptionbyname
     * @since windows5.1.2600
     */
    static PSGetPropertyDescriptionByName(pszCanonicalName, riid, ppv) {
        pszCanonicalName := pszCanonicalName is String ? StrPtr(pszCanonicalName) : pszCanonicalName

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSGetPropertyDescriptionByName", "ptr", pszCanonicalName, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the class identifier (CLSID) of a per-computer, registered file property handler.
     * @param {PWSTR} pszFilePath Type: <b>PCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode buffer that contains the absolute path of the file whose property handler CLSID is requested.
     * @param {Pointer<Guid>} pclsid Type: <b>CLSID*</b>
     * 
     * When this function returns, contains the requested property handler CLSID.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pslookuppropertyhandlerclsid
     * @since windows5.1.2600
     */
    static PSLookupPropertyHandlerCLSID(pszFilePath, pclsid) {
        pszFilePath := pszFilePath is String ? StrPtr(pszFilePath) : pszFilePath

        result := DllCall("PROPSYS.dll\PSLookupPropertyHandlerCLSID", "ptr", pszFilePath, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a property handler for a Shell item.
     * @param {IUnknown} punkItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a Shell item that supports <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * 
     *                     
     * 
     * <b>Windows XP:</b> Use <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellitem">SHCreateShellItem</a> to create the Shell item.
     * 
     * <b>Windows Vista:</b> Use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromidlist">SHCreateItemFromIDList</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromparsingname">SHCreateItemFromParsingName</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromrelativename">SHCreateItemFromRelativeName</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateiteminknownfolder">SHCreateItemInKnownFolder</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemwithparent">SHCreateItemWithParent</a> to create the Shell item.
     * @param {BOOL} fReadWrite Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to retrieve a read/write property handler. <b>FALSE</b> to retrieve a read-only property handler.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the IID of the interface the handler object should return. This should be <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or an interface derived from <b>IPropertyStore</b>.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetitempropertyhandler
     * @since windows5.1.2600
     */
    static PSGetItemPropertyHandler(punkItem, fReadWrite, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSGetItemPropertyHandler", "ptr", punkItem, "int", fReadWrite, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a property handler for a Shell item.
     * @param {IUnknown} punkItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a Shell item that supports <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * 
     *                     
     * 
     * <b>Windows XP:</b> Use <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellitem">SHCreateShellItem</a> to create the Shell item.
     * 
     * <b>Windows Vista:</b> Use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromidlist">SHCreateItemFromIDList</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromparsingname">SHCreateItemFromParsingName</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromrelativename">SHCreateItemFromRelativeName</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateiteminknownfolder">SHCreateItemInKnownFolder</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemwithparent">SHCreateItemWithParent</a> to create the Shell item.
     * @param {BOOL} fReadWrite Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to retrieve a read/write property handler. <b>FALSE</b> to retrieve a read-only property handler.
     * @param {IUnknown} punkCreateObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a class factory object that supports <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-icreateobject">ICreateObject</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystorecapabilities">IPropertyStoreCapabilities</a>.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetitempropertyhandlerwithcreateobject
     * @since windows5.1.2600
     */
    static PSGetItemPropertyHandlerWithCreateObject(punkItem, fReadWrite, punkCreateObject, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSGetItemPropertyHandlerWithCreateObject", "ptr", punkItem, "int", fReadWrite, "ptr", punkCreateObject, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a property value from a property store.
     * @param {IPropertyStore} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface, which represents the property store from which to get the value.
     * @param {IPropertyDescription} ppd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>*</b>
     * 
     * Pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface, which represents the property in the property store.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to an uninitialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. When this function returns, points to the requested property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetpropertyvalue
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
     * @param {IPropertyStore} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface, which represents the property store that contains the property.
     * @param {IPropertyDescription} ppd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>*</b>
     * 
     * Pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface, which identifies the individual property.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the new value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pssetpropertyvalue
     * @since windows5.1.2600
     */
    static PSSetPropertyValue(pps, ppd, propvar) {
        result := DllCall("PROPSYS.dll\PSSetPropertyValue", "ptr", pps, "ptr", ppd, "ptr", propvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Informs the schema subsystem of the addition of a property description schema file.
     * @param {PWSTR} pszPath Type: <b>PCWSTR</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psregisterpropertyschema
     * @since windows5.1.2600
     */
    static PSRegisterPropertySchema(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := DllCall("PROPSYS.dll\PSRegisterPropertySchema", "ptr", pszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Informs the schema subsystem of the removal of a property description schema file.
     * @param {PWSTR} pszPath Type: <b>PCWSTR</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psunregisterpropertyschema
     * @since windows5.1.2600
     */
    static PSUnregisterPropertySchema(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psrefreshpropertyschema
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
     * @param {Integer} filterOn Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_enumfilter">PROPDESC_ENUMFILTER</a></b>
     * 
     * The list to return. <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_enumfilter">PROPDESC_ENUMFILTER</a> shows the valid values for this method.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the  interface ID of the requested interface.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psenumeratepropertydescriptions
     * @since windows5.1.2600
     */
    static PSEnumeratePropertyDescriptions(filterOn, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSEnumeratePropertyDescriptions", "int", filterOn, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the property key for a canonical property name.
     * @param {PWSTR} pszName Type: <b>PCWSTR</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetpropertykeyfromname
     * @since windows5.1.2600
     */
    static PSGetPropertyKeyFromName(pszName, ppropkey) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("PROPSYS.dll\PSGetPropertyKeyFromName", "ptr", pszName, "ptr", ppropkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the canonical name of the property, given its PROPERTYKEY.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that identifies the requested property.
     * @param {Pointer<PWSTR>} ppszCanonicalName Type: <b>PWSTR*</b>
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
     * Indicates that the <a href="/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> does not exist in the schema subsystem cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetnamefrompropertykey
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
     * The <i>ppropvar</i> parameter is invalid. The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has been cleared.
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
     * Coercion from the value's type to the property description's type was not possible. The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has been cleared.
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
     * Coercion from the value's type to the property description's type was not possible. The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has been cleared.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pscoercetocanonicalvalue
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
     * @param {PWSTR} pszPropList Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode string that identifies the property list. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertysystem-getpropertydescriptionlistfromstring">IPropertySystem::GetPropertyDescriptionListFromString</a> for more information about the format of this parameter.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the interface ID of the requested interface.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetpropertydescriptionlistfromstring
     * @since windows5.1.2600
     */
    static PSGetPropertyDescriptionListFromString(pszPropList, riid, ppv) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSGetPropertyDescriptionListFromString", "ptr", pszPropList, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Wraps an IPropertySetStorage interface in an IPropertyStore interface.
     * @param {IPropertySetStorage} ppss Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * Specifies the access mode to enforce. grfMode should match the access mode used to open the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>. Valid values are as follows:
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to an IID.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer specified in <i>riid</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pscreatepropertystorefrompropertysetstorage
     * @since windows5.1.2600
     */
    static PSCreatePropertyStoreFromPropertySetStorage(ppss, grfMode, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSCreatePropertyStoreFromPropertySetStorage", "ptr", ppss, "uint", grfMode, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Accepts the IUnknown interface of an object that supports IPropertyStore or IPropertySetStorage. If the object supports IPropertySetStorage, it is wrapped so that it supports IPropertyStore.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an interface that supports either <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * Specifies the access mode to use. One of these values:
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the requested IID.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns successfully, contains the address of a pointer to an interface guaranteed to support <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pscreatepropertystorefromobject
     * @since windows5.1.2600
     */
    static PSCreatePropertyStoreFromObject(punk, grfMode, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSCreatePropertyStoreFromObject", "ptr", punk, "uint", grfMode, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an adapter from an IPropertyStore.
     * @param {IPropertyStore} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object that represents the property store.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to an IID.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pscreateadapterfrompropertystore
     * @since windows5.1.2600
     */
    static PSCreateAdapterFromPropertyStore(pps, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSCreateAdapterFromPropertyStore", "ptr", pps, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets an instance of the subsystem object that implements IPropertySystem.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the IID of the requested interface.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetpropertysystem
     * @since windows5.1.2600
     */
    static PSGetPropertySystem(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSGetPropertySystem", "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the value of a property as stored in serialized property storage.
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetpropertyfrompropertystorage
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
     * @param {Pointer} psps Type: <b>PCUSERIALIZEDPROPSTORAGE</b>
     * 
     * A pointer to an allocated buffer that contains the serialized properties. Call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipersistserializedpropstorage-getpropertystorage">IPersistSerializedPropStorage::GetPropertyStorage</a> to obtain the buffer.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the USERIALIZESPROPSTORAGE buffer pointed to by <i>psps</i>.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that contains the name of the property.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the requested value.
     * @returns {HRESULT} Type: <b>PSSTDAPI</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-psgetnamedpropertyfrompropertystorage
     * @since windows5.1.2600
     */
    static PSGetNamedPropertyFromPropertyStorage(psps, cb, pszName, ppropvar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("PROPSYS.dll\PSGetNamedPropertyFromPropertyStorage", "ptr", psps, "uint", cb, "ptr", pszName, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the type of data value of a property that is stored in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object, that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readtype
     * @since windows6.1
     */
    static PSPropertyBag_ReadType(propBag, propName, var, type) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadType", "ptr", propBag, "ptr", propName, "ptr", var, "ushort", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the string data value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {PWSTR} value Type: <b>LPCWSTR</b>
     * 
     * When this function returns, contains a pointer to a string property value.
     * @param {Integer} characterCount Type: <b>int</b>
     * 
     * This function returns the  integer that represents the size (maximum number of characters) of the <i>value</i> parameter being returned.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readstr
     * @since windows6.1
     */
    static PSPropertyBag_ReadStr(propBag, propName, value, characterCount) {
        propName := propName is String ? StrPtr(propName) : propName
        value := value is String ? StrPtr(value) : value

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadStr", "ptr", propBag, "ptr", propName, "ptr", value, "int", characterCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a string data value from a property in a property bag and allocates memory for the string that is read.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<PWSTR>} value Type: <b>PWSTR*</b>
     * 
     * When this function returns, contains a pointer to a string data value from a property in a property bag and allocates memory for the string that is read. The caller of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pspropertybag_readstralloc">PSPropertyBag_ReadStrAlloc</a> function needs to call a <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function on this parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readstralloc
     * @since windows6.1
     */
    static PSPropertyBag_ReadStrAlloc(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadStrAlloc", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a BSTR data value from a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<BSTR>} value Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * When this function returns, contains a pointer to a <b>BSTR</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readbstr
     * @since windows6.1
     */
    static PSPropertyBag_ReadBSTR(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadBSTR", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the string value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {PWSTR} value Type: <b>LPCWSTR</b>
     * 
     * The string value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writestr
     * @since windows6.1
     */
    static PSPropertyBag_WriteStr(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName
        value := value is String ? StrPtr(value) : value

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteStr", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the BSTR value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {BSTR} value Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a></b>
     * 
     * The <b>BSTR</b> value to which the named property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writebstr
     * @since windows6.1
     */
    static PSPropertyBag_WriteBSTR(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteBSTR", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads an int data value from a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Integer>} value Type: <b>int*</b>
     * 
     * When this function returns, contains a pointer to an <b>int</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readint
     * @since windows6.1
     */
    static PSPropertyBag_ReadInt(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadInt", "ptr", propBag, "ptr", propName, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the int value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>int</b>
     * 
     * The <b>int</b> value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writeint
     * @since windows6.1
     */
    static PSPropertyBag_WriteInt(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteInt", "ptr", propBag, "ptr", propName, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the SHORT data value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Integer>} value Type: <b>SHORT*</b>
     * 
     * When this function returns, contains a pointer to a SHORT property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readshort
     * @since windows6.1
     */
    static PSPropertyBag_ReadSHORT(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        valueMarshal := value is VarRef ? "short*" : "ptr"

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadSHORT", "ptr", propBag, "ptr", propName, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the SHORT value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>SHORT</b>
     * 
     * The SHORT value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writeshort
     * @since windows6.1
     */
    static PSPropertyBag_WriteSHORT(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteSHORT", "ptr", propBag, "ptr", propName, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a LONG data value from a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Integer>} value Type: <b>LONG*</b>
     * 
     * When this function returns, contains a pointer to a <b>LONG</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readlong
     * @since windows6.1
     */
    static PSPropertyBag_ReadLONG(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadLONG", "ptr", propBag, "ptr", propName, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the LONG value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>LONG</b>
     * 
     * The <b>LONG</b> value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writelong
     * @since windows6.1
     */
    static PSPropertyBag_WriteLONG(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteLONG", "ptr", propBag, "ptr", propName, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a DWORD data value from property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<Integer>} value Type: <b>DWORD*</b>
     * 
     * When this function returns, contains a pointer to a <b>DWORD</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readdword
     * @since windows6.1
     */
    static PSPropertyBag_ReadDWORD(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadDWORD", "ptr", propBag, "ptr", propName, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the DWORD value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>DWORD</b>
     * 
     * A <b>DWORD</b> value to which the named property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writedword
     * @since windows6.1
     */
    static PSPropertyBag_WriteDWORD(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteDWORD", "ptr", propBag, "ptr", propName, "uint", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the BOOL data value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<BOOL>} value Type: <b>BOOL*</b>
     * 
     * When this function returns successfully, contains a pointer to the value read from the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readbool
     * @since windows6.1
     */
    static PSPropertyBag_ReadBOOL(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadBOOL", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the BOOL value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {BOOL} value Type: <b>BOOL</b>
     * 
     * The <b>BOOL</b> value to which the named property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writebool
     * @since windows6.1
     */
    static PSPropertyBag_WriteBOOL(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteBOOL", "ptr", propBag, "ptr", propName, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the property coordinates stored in a POINTL structure of a specified property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<POINTL>} value Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a>*</b>
     * 
     * When this function returns, contains a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a> structure that contains the property coordinates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readpointl
     * @since windows6.1
     */
    static PSPropertyBag_ReadPOINTL(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadPOINTL", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Stores the property coordinates in aPOINTL structure of a specified property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<POINTL>} value Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a> structure that specifies the coordinates to store in the  property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writepointl
     * @since windows6.1
     */
    static PSPropertyBag_WritePOINTL(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WritePOINTL", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the property coordinates stored in a POINTS structure of a specified property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<POINTS>} value Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162808(v=vs.85)">POINTS</a>*</b>
     * 
     * When this function returns successfully, contains a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162808(v=vs.85)">POINTS</a> structure that contains the property coordinates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readpoints
     * @since windows6.1
     */
    static PSPropertyBag_ReadPOINTS(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadPOINTS", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Stores the property coordinates in aPOINTS structure of a specified property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<POINTS>} value Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd162808(v=vs.85)">POINTS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162808(v=vs.85)">POINTS</a> structure that specifies the coordinates to store in the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writepoints
     * @since windows6.1
     */
    static PSPropertyBag_WritePOINTS(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WritePOINTS", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the coordinates of a rectangle stored in a property contained in a specified property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<RECTL>} value Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">RECTL</a>*</b>
     * 
     * When this function returns, contains a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">RECTL</a> structure that contains the property coordinates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readrectl
     * @since windows6.1
     */
    static PSPropertyBag_ReadRECTL(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadRECTL", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Stores the coordinates of a rectangle in a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<RECTL>} value Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">RECTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">RECTL</a> structure that specifies the coordinates to store in the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writerectl
     * @since windows6.1
     */
    static PSPropertyBag_WriteRECTL(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteRECTL", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the data stream stored in a given property contained in a specified property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object, that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<IStream>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The address of a pointer that, when this function returns successfully, receives the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readstream
     * @since windows6.1
     */
    static PSPropertyBag_ReadStream(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadStream", "ptr", propBag, "ptr", propName, "ptr*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a data stream to a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {IStream} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object to write to the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writestream
     * @since windows6.1
     */
    static PSPropertyBag_WriteStream(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteStream", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deletes a property from a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_delete
     * @since windows6.1
     */
    static PSPropertyBag_Delete(propBag, propName) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_Delete", "ptr", propBag, "ptr", propName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a ULONGLONG data value from a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Integer>} value Type: <b>ULONGLONG</b>
     * 
     * When this function returns, contains a pointer to a <b>ULONGLONG</b> property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readulonglong
     * @since windows6.1
     */
    static PSPropertyBag_ReadULONGLONG(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadULONGLONG", "ptr", propBag, "ptr", propName, valueMarshal, value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the ULONGLONG value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Integer} value Type: <b>ULONGLONG</b>
     * 
     * An <b>ULONGLONG</b> value to which the property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writeulonglong
     * @since windows6.1
     */
    static PSPropertyBag_WriteULONGLONG(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteULONGLONG", "ptr", propBag, "ptr", propName, "uint", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a given property of an unknown data value in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object, that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>. This interface IID should be <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> or an interface derived from <b>IPropertyBag</b>.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically <i>riid</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readunknown
     * @since windows6.1
     */
    static PSPropertyBag_ReadUnknown(propBag, propName, riid, ppv) {
        propName := propName is String ? StrPtr(propName) : propName

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadUnknown", "ptr", propBag, "ptr", propName, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a property of an unknown data value in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated property name string.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> derived interface that copies the specified property of an unknown data value in a property bag.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writeunknown
     * @since windows6.1
     */
    static PSPropertyBag_WriteUnknown(propBag, propName, punk) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteUnknown", "ptr", propBag, "ptr", propName, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the GUID data value from a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Guid>} value Type: <b>GUID*</b>
     * 
     * When this function returns, contains a pointer to a GUID property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readguid
     * @since windows6.1
     */
    static PSPropertyBag_ReadGUID(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadGUID", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the GUID value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<Guid>} value Type: <b>const GUID*</b>
     * 
     * A pointer to a GUID value to which the named property should be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writeguid
     * @since windows6.1
     */
    static PSPropertyBag_WriteGUID(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_WriteGUID", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the property key of a property in a specified property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<PROPERTYKEY>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * When this function returns, contains a pointer to a property key value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_readpropertykey
     * @since windows6.1
     */
    static PSPropertyBag_ReadPropertyKey(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

        result := DllCall("PROPSYS.dll\PSPropertyBag_ReadPropertyKey", "ptr", propBag, "ptr", propName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the property key value of a property in a property bag.
     * @param {IPropertyBag} propBag Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> object that represents the property bag in which the property is stored.
     * @param {PWSTR} propName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated property name string.
     * @param {Pointer<PROPERTYKEY>} value Type: <b>REFPROPERTYKEY</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that specifies the property key value to store in the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-pspropertybag_writepropertykey
     * @since windows6.1
     */
    static PSPropertyBag_WritePropertyKey(propBag, propName, value) {
        propName := propName is String ? StrPtr(propName) : propName

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
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or a related interface.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-shgetpropertystorefromidlist
     * @since windows6.0.6000
     */
    static SHGetPropertyStoreFromIDList(pidl, flags, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("SHELL32.dll\SHGetPropertyStoreFromIDList", "ptr", pidl, "int", flags, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns a property store for an item, given a path or parsing name.
     * @param {PWSTR} pszPath Type: <b>PCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that specifies the item path.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> object, which provides access to a bind context. This value can be <b>NULL</b>.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired interface ID.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> or a related interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-shgetpropertystorefromparsingname
     * @since windows6.0.6000
     */
    static SHGetPropertyStoreFromParsingName(pszPath, pbc, flags, riid, ppv) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("SHELL32.dll\SHGetPropertyStoreFromParsingName", "ptr", pszPath, "ptr", pbc, "int", flags, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds default properties to the property store as registered for the specified file extension.
     * @param {PWSTR} pszExt Type: <b>PCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that specifies the extension.
     * @param {IPropertyStore} pPropStore Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface that defines the default properties to add.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-shadddefaultpropertiesbyext
     * @since windows6.0.6000
     */
    static SHAddDefaultPropertiesByExt(pszExt, pPropStore) {
        pszExt := pszExt is String ? StrPtr(pszExt) : pszExt

        result := DllCall("SHELL32.dll\SHAddDefaultPropertiesByExt", "ptr", pszExt, "ptr", pPropStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens the .pif file associated with a Microsoft MS-DOS application, and returns a handle to the application's properties.
     * @param {PWSTR} pszApp Type: <b>PCWSTR</b>
     * 
     * A null-terminated Unicode string that contains the application's name.
     * @param {PWSTR} pszPIF Type: <b>PCWSTR</b>
     * 
     * A null-terminated Unicode string that contains the name of the .pif file.
     * @param {Integer} hInf Type: <b>UINT</b>
     * 
     * A handle to the application's .inf file. Set this value to zero if there is no .inf file. Set this value to -1 to prevent the .inf file from being processed.
     * @param {Integer} flOpt Type: <b>UINT</b>
     * 
     * A flag that controls how the function operates.
     * @returns {HANDLE} Type: <b>HANDLE</b>
     * 
     * Returns a handle to the application's properties. Use this handle when you call the related .pif functions.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-pifmgr_openproperties
     * @since windows5.0
     */
    static PifMgr_OpenProperties(pszApp, pszPIF, hInf, flOpt) {
        pszApp := pszApp is String ? StrPtr(pszApp) : pszApp
        pszPIF := pszPIF is String ? StrPtr(pszPIF) : pszPIF

        result := DllCall("SHELL32.dll\PifMgr_OpenProperties", "ptr", pszApp, "ptr", pszPIF, "uint", hInf, "uint", flOpt, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Returns a specified block of data from a .pif file.
     * @param {HANDLE} hProps Type: <b>HANDLE</b>
     * 
     * A handle to an application's properties. This parameter should be set to the value that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-pifmgr_openproperties">PifMgr_OpenProperties</a>.
     * @param {PSTR} pszGroup Type: <b>PCSTR</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-pifmgr_getproperties
     * @since windows5.0
     */
    static PifMgr_GetProperties(hProps, pszGroup, lpProps, cbProps, flOpt) {
        hProps := hProps is Win32Handle ? NumGet(hProps, "ptr") : hProps
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        result := DllCall("SHELL32.dll\PifMgr_GetProperties", "ptr", hProps, "ptr", pszGroup, "ptr", lpProps, "int", cbProps, "uint", flOpt, "int")
        return result
    }

    /**
     * Assigns values to a block of data from a .pif file.
     * @param {HANDLE} hProps Type: <b>HANDLE</b>
     * 
     * A handle to the application's properties. This parameter should be set to the value that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-pifmgr_openproperties">PifMgr_OpenProperties</a>.
     * @param {PSTR} pszGroup Type: <b>PCSTR</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-pifmgr_setproperties
     * @since windows5.0
     */
    static PifMgr_SetProperties(hProps, pszGroup, lpProps, cbProps, flOpt) {
        hProps := hProps is Win32Handle ? NumGet(hProps, "ptr") : hProps
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        result := DllCall("SHELL32.dll\PifMgr_SetProperties", "ptr", hProps, "ptr", pszGroup, "ptr", lpProps, "int", cbProps, "uint", flOpt, "int")
        return result
    }

    /**
     * Closes application properties that were opened with PifMgr_OpenProperties.
     * @param {HANDLE} hProps Type: <b>HANDLE</b>
     * 
     * A handle to the application's properties. This parameter should be set to the value that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-pifmgr_openproperties">PifMgr_OpenProperties</a>.
     * @param {Integer} flOpt Type: <b>UINT</b>
     * 
     * A flag that specifies how the function operates.
     * @returns {HANDLE} Type: <b>int</b>
     * 
     * Returns <b>NULL</b> if successful. If unsuccessful, the functions returns the handle to the application properties that was passed as <i>hProps</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-pifmgr_closeproperties
     * @since windows5.0
     */
    static PifMgr_CloseProperties(hProps, flOpt) {
        hProps := hProps is Win32Handle ? NumGet(hProps, "ptr") : hProps

        result := DllCall("SHELL32.dll\PifMgr_CloseProperties", "ptr", hProps, "uint", flOpt, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Ensures proper handling of code page retrieval or assignment for the requested property set operation.
     * @param {IPropertySetStorage} psstg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>*</b>
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
     * @param {Pointer<Integer>} puCodePage Type: <b>UINT*</b>
     * 
     * When this method returns, contains the address of the code page ID for the set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-shpropstgcreate
     * @since windows5.0
     */
    static SHPropStgCreate(psstg, fmtid, pclsid, grfFlags, grfMode, dwDisposition, ppstg, puCodePage) {
        puCodePageMarshal := puCodePage is VarRef ? "uint*" : "ptr"

        result := DllCall("SHELL32.dll\SHPropStgCreate", "ptr", psstg, "ptr", fmtid, "ptr", pclsid, "uint", grfFlags, "uint", grfMode, "uint", dwDisposition, "ptr*", ppstg, puCodePageMarshal, puCodePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Wraps the IPropertyStorage::ReadMultiple function to ensure that ANSI and Unicode translations are handled properly for deprecated property sets.
     * @param {IPropertyStorage} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-shpropstgreadmultiple
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
     * @param {IPropertyStorage} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface pointer that identifies the property store.
     * @param {Pointer<Integer>} puCodePage Type: <b>UINT*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-shpropstgwritemultiple
     * @since windows5.1.2600
     */
    static SHPropStgWriteMultiple(pps, puCodePage, cpspec, rgpspec, rgvar, propidNameFirst) {
        puCodePageMarshal := puCodePage is VarRef ? "uint*" : "ptr"

        result := DllCall("SHELL32.dll\SHPropStgWriteMultiple", "ptr", pps, puCodePageMarshal, puCodePage, "uint", cpspec, "ptr", rgpspec, "ptr", rgvar, "uint", propidNameFirst, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves an object that represents a specific window's collection of properties, which allows those properties to be queried or set.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the window whose properties are being retrieved.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the property store object to retrieve through <i>ppv</i>. This is typically IID_IPropertyStore.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this function returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shellapi/nf-shellapi-shgetpropertystoreforwindow
     * @since windows6.1
     */
    static SHGetPropertyStoreForWindow(hwnd, riid, ppv) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("SHELL32.dll\SHGetPropertyStoreForWindow", "ptr", hwnd, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
