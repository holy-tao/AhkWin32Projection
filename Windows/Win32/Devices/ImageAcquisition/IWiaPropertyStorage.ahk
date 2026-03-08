#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\StructuredStorage\IEnumSTATPROPSTG.ahk
#Include ..\..\System\Com\StructuredStorage\STATPROPSETSTG.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaPropertyStorage interface is used to access information about the IWiaItem object's properties. Applications must query an item to obtain its IWiaPropertyStorage interface.
 * @remarks
 * The <b>IWiaPropertyStorage</b> interface includes several methods that are very similar to the following methods from the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface. The descriptions and remarks for the IPropertyStorage version of these methods applies to the <b>IWiaPropertyStorage</b> as well. 
 * 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>IPropertyStorage Methods</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-readmultiple">IPropertyStorage::ReadMultiple</a>
 * </td>
 * <td>Reads property values in a property set.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-writemultiple">IPropertyStorage::WriteMultiple</a>
 * </td>
 * <td>Writes property values in a property set.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-deletemultiple">IPropertyStorage::DeleteMultiple</a>
 * </td>
 * <td>Deletes properties in a property set.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-readpropertynames">IPropertyStorage::ReadPropertyNames</a>
 * </td>
 * <td>Gets string names that correspond to given property identifiers.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-writepropertynames">IPropertyStorage::WritePropertyNames</a>
 * </td>
 * <td>Creates or changes string names that corresponds to given property identifiers.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-deletepropertynames">IPropertyStorage::DeletePropertyNames</a>
 * </td>
 * <td>Deletes string names for given property identifiers.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-setclass">IPropertyStorage::SetClass</a>
 * </td>
 * <td>Assigns a CLSID to the property set.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-commit">IPropertyStorage::Commit</a>
 * </td>
 * <td>As in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a>, flushes or commits changes to the property storage object.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-revert">IPropertyStorage::Revert</a>
 * </td>
 * <td>When the property storage is opened in transacted mode, discards all changes since the last commit.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-enum">IPropertyStorage::Enum</a>
 * </td>
 * <td>Creates and gets a pointer to an enumerator for properties within this set.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-stat">IPropertyStorage::Stat</a>
 * </td>
 * <td>Receives statistics about this property set.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-settimes">IPropertyStorage::SetTimes</a>
 * </td>
 * <td>Sets modification, creation, and access times for the property set.</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * The <b>IWiaPropertyStorage</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>IUnknown Methods</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>
 * </td>
 * <td>Returns pointers to supported interfaces.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>
 * </td>
 * <td>Increments reference count.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>
 * </td>
 * <td>Decrements reference count.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nn-wia_xp-iwiapropertystorage
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaPropertyStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaPropertyStorage
     * @type {Guid}
     */
    static IID => Guid("{98b5e8a0-29cc-491a-aac0-e6db4fdcceb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadMultiple", "WriteMultiple", "DeleteMultiple", "ReadPropertyNames", "WritePropertyNames", "DeletePropertyNames", "Commit", "Revert", "Enum", "SetTimes", "SetClass", "Stat", "GetPropertyAttributes", "GetCount", "GetPropertyStream", "SetPropertyStream"]

    /**
     * 
     * @param {Integer} cpspec 
     * @param {Pointer<PROPSPEC>} rgpspec 
     * @returns {PROPVARIANT} 
     */
    ReadMultiple(cpspec, rgpspec) {
        rgpropvar := PROPVARIANT()
        result := ComCall(3, this, "uint", cpspec, "ptr", rgpspec, "ptr", rgpropvar, "HRESULT")
        return rgpropvar
    }

    /**
     * 
     * @param {Integer} cpspec 
     * @param {Pointer<PROPSPEC>} rgpspec 
     * @param {Pointer<PROPVARIANT>} rgpropvar 
     * @param {Integer} propidNameFirst 
     * @returns {HRESULT} 
     */
    WriteMultiple(cpspec, rgpspec, rgpropvar, propidNameFirst) {
        result := ComCall(4, this, "uint", cpspec, "ptr", rgpspec, "ptr", rgpropvar, "uint", propidNameFirst, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpspec 
     * @param {Pointer<PROPSPEC>} rgpspec 
     * @returns {HRESULT} 
     */
    DeleteMultiple(cpspec, rgpspec) {
        result := ComCall(5, this, "uint", cpspec, "ptr", rgpspec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpropid 
     * @param {Pointer<Integer>} rgpropid 
     * @returns {PWSTR} 
     */
    ReadPropertyNames(cpropid, rgpropid) {
        rgpropidMarshal := rgpropid is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", cpropid, rgpropidMarshal, rgpropid, "ptr*", &rglpwstrName := 0, "HRESULT")
        return rglpwstrName
    }

    /**
     * 
     * @param {Integer} cpropid 
     * @param {Pointer<Integer>} rgpropid 
     * @param {Pointer<PWSTR>} rglpwstrName 
     * @returns {HRESULT} 
     */
    WritePropertyNames(cpropid, rgpropid, rglpwstrName) {
        rgpropidMarshal := rgpropid is VarRef ? "uint*" : "ptr"
        rglpwstrNameMarshal := rglpwstrName is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", cpropid, rgpropidMarshal, rgpropid, rglpwstrNameMarshal, rglpwstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpropid 
     * @param {Pointer<Integer>} rgpropid 
     * @returns {HRESULT} 
     */
    DeletePropertyNames(cpropid, rgpropid) {
        rgpropidMarshal := rgpropid is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", cpropid, rgpropidMarshal, rgpropid, "HRESULT")
        return result
    }

    /**
     * Indicates that a resource manager (RM) has finished committing a transaction that was requested by the transaction manager (TM).
     * @param {Integer} grfCommitFlags 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero. 
     * 
     * 
     *   
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     *  The following list identifies the possible error codes:
     * @see https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-commitcomplete
     */
    Commit(grfCommitFlags) {
        result := ComCall(9, this, "uint", grfCommitFlags, "HRESULT")
        return result
    }

    /**
     * Allows a security package to discontinue the impersonation of the caller and restore its own security context.
     * @remarks
     * <b>RevertSecurityContext</b> is not available with all <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security packages</a> on all platforms. Typically, it is implemented only on platforms and with security packages for which a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querysecuritypackageinfoa">QuerySecurityPackageInfo</a> function indicates impersonation support.
     * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-revertsecuritycontext
     */
    Revert() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Enumerates calendar information for a specified locale.Note  To receive a calendar identifier in addition to calendar information, the application should use the EnumCalendarInfoEx function. (ANSI)
     * @remarks
     * See Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumcalendarinfoexa">EnumCalendarInfoEx</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winnls.h header defines EnumCalendarInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {IEnumSTATPROPSTG} 
     * @see https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumcalendarinfoa
     */
    Enum() {
        result := ComCall(11, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSTATPROPSTG(ppenum)
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pctime 
     * @param {Pointer<FILETIME>} patime 
     * @param {Pointer<FILETIME>} pmtime 
     * @returns {HRESULT} 
     */
    SetTimes(pctime, patime, pmtime) {
        result := ComCall(12, this, "ptr", pctime, "ptr", patime, "ptr", pmtime, "HRESULT")
        return result
    }

    /**
     * The SetClassIDInBlob function sets the named class identifier value of a BLOB.
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} If the function is successful, the return value is NMERR\_SUCCESS.
     * 
     * If the function is unsuccessful, the return value is a NMERR value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/setclassidinblob
     */
    SetClass(clsid) {
        result := ComCall(13, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * State Variables for Current Values and Associated Data
     * @returns {STATPROPSETSTG} 
     * @see https://learn.microsoft.com/windows/win32/OpenGL/state-variables-for-current-values-and-associated-data
     */
    Stat() {
        pstatpsstg := STATPROPSETSTG()
        result := ComCall(14, this, "ptr", pstatpsstg, "HRESULT")
        return pstatpsstg
    }

    /**
     * The IWiaPropertyStorage::GetPropertyAttributes method retrieves access rights and legal value information for a specified set of properties.
     * @remarks
     * This method retrieves both property access rights and valid property values. Access rights report whether the property is readable, writable, or both. Valid property values are specified as a range of values, a list of values, or a group of flag values. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-property-attributes">Property Attributes</a>.
     * 
     * If the property access rights flag has the <b>WIA_PROP_NONE</b> bit set, no legal value information is available for this property. Read only properties and properties with a binary data type are examples of properties that would have the <b>WIA_PROP_NONE</b> bit set.
     * 
     * If the property has a range of valid values, they can be determined through the <i>rgpropvar</i> parameter upon completion of this method. The <i>ppvValidValues</i> parameter specifies an array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures. 
     * 
     * For example, if the property range is specified as VT_VECTOR | VT_UI4, range information can be retrieved through the structure member 
     * 
     * <i>rgpropvar</i>[<i>n</i>].caul.pElems[<i>range_specifier</i>]
     * 
     * where <i>n</i> is the index number of the property that is inspected and <i>range_specifier</i> is one of the following:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Range Specifier</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>WIA_RANGE_MAX</td>
     * <td>Maximum value to which the property may be set.</td>
     * </tr>
     * <tr>
     * <td>WIA_RANGE_MIN</td>
     * <td>Minimum value to which the property may be set.</td>
     * </tr>
     * <tr>
     * <td>WIA_RANGE_NOM</td>
     * <td>Normal or default property value.</td>
     * </tr>
     * <tr>
     * <td>WIA_RANGE_STEP</td>
     * <td>Increment or decrement between property values.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the property has a list of valid values, applications determine them through the <i>ppvValidValues</i> parameter upon completion of this method. 
     * 
     * For example, if the property range is specified as VT_VECTOR | VT_UI4, the list of valid property values can be retrieved through the structure member 
     * 
     * rgpropspecValues[<i>n</i>].caul.pElems[<i>list_specifier</i>]
     * 
     * where <i>n</i> is the index number of the property that is inspected and <i>list_specifier</i> is one of the following:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Range Specifier</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>WIA_LIST_COUNT</td>
     * <td>Total number of list elements excluding the nominal value.</td>
     * </tr>
     * <tr>
     * <td>WIA_LIST_NOM</td>
     * <td>Nominal value for the property.</td>
     * </tr>
     * <tr>
     * <td>WIA_LIST_VALUES</td>
     * <td>The index number of the first value.</td>
     * </tr>
     * </table>
     *  
     * 
     * Programs also use the <i>ppvValidValues</i> parameter to retrieve valid flag values. For instance, if the property flags are specified as VT_UI4, valid flag values can be determined through the structure member 
     * 
     * rgpropspec[<i>n</i>].caul.pElems[<i>flag_specifier</i>]
     * 
     * where <i>n</i> is the index number of the property that is inspected, and <i>flag_specifier </i> is one of the following:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Range Specifier</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>WIA_FLAG_NOM</td>
     * <td>The nominal value for the property.</td>
     * </tr>
     * <tr>
     * <td>WIA_FLAG_NUM_ELEMS</td>
     * <td>Total number of list elements excluding the nominal value.</td>
     * </tr>
     * <tr>
     * <td>WIA_FLAG_VALUES</td>
     * <td>All values with all valid flag bits set.</td>
     * </tr>
     * </table>
     * @param {Integer} cpspec Type: <b>ULONG</b>
     * 
     * Specifies the number of property attributes to query.
     * @param {Pointer<PROPSPEC>} rgpspec Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a>[]</b>
     * 
     * Specifies an array of <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wiadeviceinfoprop">Device Information Property Constants</a>. Each constant in the array selects a property to query.
     * @param {Pointer<Integer>} rgflags Type: <b>ULONG[]</b>
     * 
     * An array that receives a <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-property-attributes">property attribute descriptor</a> for each property specified in the <i>rgpspec</i> array. Each element in the array is one or more descriptor values combined with a bitwise <b>OR</b> operation.
     * @param {Pointer<PROPVARIANT>} rgpropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>[]</b>
     * 
     * An array that receives a <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-property-attributes">property attribute descriptor</a> for each property specified in the <i>pPROPSPEC</i> array. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns one of the following values or a standard COM error code:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Return Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>This method succeeded.</td>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td>The specified property names do not exist. No attributes were retrieved.</td>
     * </tr>
     * <tr>
     * <td>STG_E_ACCESSDENIED</td>
     * <td>The application does not have access to the property stream or the stream may already be open.</td>
     * </tr>
     * <tr>
     * <td>STG_E_INSUFFICIENTMEMORY</td>
     * <td>There is not enough memory to complete the operation.</td>
     * </tr>
     * <tr>
     * <td>ERROR_NOT_SUPPORTED</td>
     * <td>The property type is not supported.</td>
     * </tr>
     * <tr>
     * <td>STG_E_INVALIDPARAMETER</td>
     * <td>One or more parameters are invalid. One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a> structures contain invalid data.</td>
     * </tr>
     * <tr>
     * <td>STG_E_INVALIDPOINTER</td>
     * <td>One or more of the pointers passed to this method are invalid.</td>
     * </tr>
     * <tr>
     * <td>ERROR_NO_UNICODE_TRANSLATION</td>
     * <td>A translation from Unicode to ANSI or ANSI to Unicode failed.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiapropertystorage-getpropertyattributes
     */
    GetPropertyAttributes(cpspec, rgpspec, rgflags, rgpropvar) {
        rgflagsMarshal := rgflags is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", cpspec, "ptr", rgpspec, rgflagsMarshal, rgflags, "ptr", rgpropvar, "HRESULT")
        return result
    }

    /**
     * The IWiaPropertyStorage::GetCount method returns the number of properties stored in the property storage.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * Receives the number of properties stored in the property storage.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiapropertystorage-getcount
     */
    GetCount() {
        result := ComCall(16, this, "uint*", &pulNumProps := 0, "HRESULT")
        return pulNumProps
    }

    /**
     * The IWiaPropertyStorage::GetPropertyStream method retrieves the property stream of an item.
     * @remarks
     * Applications use this method to get a snapshot of the current properties of an item. These are subsequently restored by calling <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiapropertystorage-setpropertystream">IWiaPropertyStorage::SetPropertyStream</a>.
     * 
     * Applications can use the <i>pCompatibilityID</i> parameter to check if a device supports a specific set of property values before attempting to write these values to the device.
     * 
     * When it is finished using the item's property stream, the application must release it.
     * @param {Pointer<Guid>} pCompatibilityId Type: <b>GUID*</b>
     * 
     * Receives a unique identifier for a set of property values.
     * @param {Pointer<IStream>} ppIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * Pointer to a stream that receives the item properties. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiapropertystorage-getpropertystream
     */
    GetPropertyStream(pCompatibilityId, ppIStream) {
        result := ComCall(17, this, "ptr", pCompatibilityId, "ptr*", ppIStream, "HRESULT")
        return result
    }

    /**
     * The IWiaPropertyStorage::SetPropertyStream sets the property stream of an item in the tree of IWiaItem objects of a Windows Image Acquisition (WIA) hardware device.
     * @remarks
     * Applications use the <i>pCompatibilityID</i> parameter to check whether a device supports a specific set of property values before attempting to write these values to the device.
     * 
     * Set <i>pIStream</i> to <b>NULL</b> to check whether the device driver accepts the CompatibilityID specified by <i>pCompatibilityID</i>.
     * 
     * If the application obtained the property stream of the item using the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiapropertystorage-getpropertystream">IWiaPropertyStorage::GetPropertyStream</a> method, the application must release it. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * @param {Pointer<Guid>} pCompatibilityId Type: <b>GUID*</b>
     * 
     * Specifies a unique identifier for a set of property values.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * Pointer to the property stream that is used to set the current item's property stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiapropertystorage-setpropertystream
     */
    SetPropertyStream(pCompatibilityId, pIStream) {
        result := ComCall(18, this, "ptr", pCompatibilityId, "ptr", pIStream, "HRESULT")
        return result
    }
}
