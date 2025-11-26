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
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwiapropertystorage
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
        result := ComCall(12, this, "ptr", pctime, "ptr", patime, "ptr", pmtime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    SetClass(clsid) {
        result := ComCall(13, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {STATPROPSETSTG} 
     */
    Stat() {
        pstatpsstg := STATPROPSETSTG()
        result := ComCall(14, this, "ptr", pstatpsstg, "HRESULT")
        return pstatpsstg
    }

    /**
     * The IWiaPropertyStorage::GetPropertyAttributes method retrieves access rights and legal value information for a specified set of properties.
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
     * <td>One or more parameters are invalid. One or more of the <a href="/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a> structures contain invalid data.</td>
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
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiapropertystorage-getpropertyattributes
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
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiapropertystorage-getcount
     */
    GetCount() {
        result := ComCall(16, this, "uint*", &pulNumProps := 0, "HRESULT")
        return pulNumProps
    }

    /**
     * The IWiaPropertyStorage::GetPropertyStream method retrieves the property stream of an item.
     * @param {Pointer<Guid>} pCompatibilityId Type: <b>GUID*</b>
     * 
     * Receives a unique identifier for a set of property values.
     * @param {Pointer<IStream>} ppIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * Pointer to a stream that receives the item properties. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiapropertystorage-getpropertystream
     */
    GetPropertyStream(pCompatibilityId, ppIStream) {
        result := ComCall(17, this, "ptr", pCompatibilityId, "ptr*", ppIStream, "HRESULT")
        return result
    }

    /**
     * The IWiaPropertyStorage::SetPropertyStream sets the property stream of an item in the tree of IWiaItem objects of a Windows Image Acquisition (WIA) hardware device.
     * @param {Pointer<Guid>} pCompatibilityId Type: <b>GUID*</b>
     * 
     * Specifies a unique identifier for a set of property values.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * Pointer to the property stream that is used to set the current item's property stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiapropertystorage-setpropertystream
     */
    SetPropertyStream(pCompatibilityId, pIStream) {
        result := ComCall(18, this, "ptr", pCompatibilityId, "ptr", pIStream, "HRESULT")
        return result
    }
}
