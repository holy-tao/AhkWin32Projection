#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\System\Com\StructuredStorage\STATPROPSETSTG.ahk" { STATPROPSETSTG }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\StructuredStorage\IEnumSTATPROPSTG.ahk" { IEnumSTATPROPSTG }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }

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
 */
export default struct IWiaPropertyStorage extends IUnknown {
    /**
     * The interface identifier for IWiaPropertyStorage
     * @type {Guid}
     */
    static IID := Guid("{98b5e8a0-29cc-491a-aac0-e6db4fdcceb6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaPropertyStorage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadMultiple          : IntPtr
        WriteMultiple         : IntPtr
        DeleteMultiple        : IntPtr
        ReadPropertyNames     : IntPtr
        WritePropertyNames    : IntPtr
        DeletePropertyNames   : IntPtr
        Commit                : IntPtr
        Revert                : IntPtr
        Enum                  : IntPtr
        SetTimes              : IntPtr
        SetClass              : IntPtr
        Stat                  : IntPtr
        GetPropertyAttributes : IntPtr
        GetCount              : IntPtr
        GetPropertyStream     : IntPtr
        SetPropertyStream     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaPropertyStorage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cpspec 
     * @param {Pointer<PROPSPEC>} rgpspec 
     * @returns {PROPVARIANT} 
     */
    ReadMultiple(cpspec, rgpspec) {
        rgpropvar := PROPVARIANT()
        result := ComCall(3, this, "uint", cpspec, PROPSPEC.Ptr, rgpspec, PROPVARIANT.Ptr, rgpropvar, "HRESULT")
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
        result := ComCall(4, this, "uint", cpspec, PROPSPEC.Ptr, rgpspec, PROPVARIANT.Ptr, rgpropvar, "uint", propidNameFirst, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpspec 
     * @param {Pointer<PROPSPEC>} rgpspec 
     * @returns {HRESULT} 
     */
    DeleteMultiple(cpspec, rgpspec) {
        result := ComCall(5, this, "uint", cpspec, PROPSPEC.Ptr, rgpspec, "HRESULT")
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

        result := ComCall(6, this, "uint", cpropid, rgpropidMarshal, rgpropid, PWSTR.Ptr, &rglpwstrName := 0, "HRESULT")
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
     * 
     * @param {Integer} grfCommitFlags 
     * @returns {HRESULT} 
     */
    Commit(grfCommitFlags) {
        result := ComCall(9, this, "uint", grfCommitFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Revert() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSTATPROPSTG} 
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
        result := ComCall(12, this, FILETIME.Ptr, pctime, FILETIME.Ptr, patime, FILETIME.Ptr, pmtime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    SetClass(clsid) {
        result := ComCall(13, this, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {STATPROPSETSTG} 
     */
    Stat() {
        pstatpsstg := STATPROPSETSTG()
        result := ComCall(14, this, STATPROPSETSTG.Ptr, pstatpsstg, "HRESULT")
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

        result := ComCall(15, this, "uint", cpspec, PROPSPEC.Ptr, rgpspec, rgflagsMarshal, rgflags, PROPVARIANT.Ptr, rgpropvar, "HRESULT")
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
        result := ComCall(17, this, Guid.Ptr, pCompatibilityId, IStream.Ptr, ppIStream, "HRESULT")
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
        result := ComCall(18, this, Guid.Ptr, pCompatibilityId, "ptr", pIStream, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWiaPropertyStorage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadMultiple := CallbackCreate(GetMethod(implObj, "ReadMultiple"), flags, 4)
        this.vtbl.WriteMultiple := CallbackCreate(GetMethod(implObj, "WriteMultiple"), flags, 5)
        this.vtbl.DeleteMultiple := CallbackCreate(GetMethod(implObj, "DeleteMultiple"), flags, 3)
        this.vtbl.ReadPropertyNames := CallbackCreate(GetMethod(implObj, "ReadPropertyNames"), flags, 4)
        this.vtbl.WritePropertyNames := CallbackCreate(GetMethod(implObj, "WritePropertyNames"), flags, 4)
        this.vtbl.DeletePropertyNames := CallbackCreate(GetMethod(implObj, "DeletePropertyNames"), flags, 3)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 2)
        this.vtbl.Revert := CallbackCreate(GetMethod(implObj, "Revert"), flags, 1)
        this.vtbl.Enum := CallbackCreate(GetMethod(implObj, "Enum"), flags, 2)
        this.vtbl.SetTimes := CallbackCreate(GetMethod(implObj, "SetTimes"), flags, 4)
        this.vtbl.SetClass := CallbackCreate(GetMethod(implObj, "SetClass"), flags, 2)
        this.vtbl.Stat := CallbackCreate(GetMethod(implObj, "Stat"), flags, 2)
        this.vtbl.GetPropertyAttributes := CallbackCreate(GetMethod(implObj, "GetPropertyAttributes"), flags, 5)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetPropertyStream := CallbackCreate(GetMethod(implObj, "GetPropertyStream"), flags, 3)
        this.vtbl.SetPropertyStream := CallbackCreate(GetMethod(implObj, "SetPropertyStream"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadMultiple)
        CallbackFree(this.vtbl.WriteMultiple)
        CallbackFree(this.vtbl.DeleteMultiple)
        CallbackFree(this.vtbl.ReadPropertyNames)
        CallbackFree(this.vtbl.WritePropertyNames)
        CallbackFree(this.vtbl.DeletePropertyNames)
        CallbackFree(this.vtbl.Commit)
        CallbackFree(this.vtbl.Revert)
        CallbackFree(this.vtbl.Enum)
        CallbackFree(this.vtbl.SetTimes)
        CallbackFree(this.vtbl.SetClass)
        CallbackFree(this.vtbl.Stat)
        CallbackFree(this.vtbl.GetPropertyAttributes)
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetPropertyStream)
        CallbackFree(this.vtbl.SetPropertyStream)
    }
}
