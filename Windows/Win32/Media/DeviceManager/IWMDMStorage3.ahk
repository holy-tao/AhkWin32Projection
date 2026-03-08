#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMMetaData.ahk
#Include .\IWMDMStorage2.ahk

/**
 * The IWMDMStorage3 interface extends IWMDMStorage2 by exposing metadata.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmstorage3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorage3 extends IWMDMStorage2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorage3
     * @type {Guid}
     */
    static IID => Guid("{97717eea-926a-464e-96a4-247b0216026e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadata", "SetMetadata", "CreateEmptyMetadataObject", "SetEnumPreference"]

    /**
     * The GetMetadata method retrieves the metadata associated with the storage.
     * @remarks
     * This method retrieves all metadata associated with the storage. If an application is seeking specific metadata, it might be more efficient to call <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage4-getspecifiedmetadata">IWMDMStorage4::GetSpecifiedMetadata</a>.
     * 
     * When retrieving data from a Windows Portable Devices (WPD) device, the data is returned in binary form. The application should de-serialize this data to obtain the actual property values.
     * @returns {IWMDMMetaData} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmmetadata">IWMDMMetaData</a> pointer associated with a storage. The caller is responsible for calling <b>Release</b> on this interface and all the allocated values when finished with it, as described under "Clearing allocated memory" in <a href="https://docs.microsoft.com/windows/desktop/WMDM/discovering-device-format-capabilities">Discovering Device Format Capabilities</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage3-getmetadata
     */
    GetMetadata() {
        result := ComCall(15, this, "ptr*", &ppMetadata := 0, "HRESULT")
        return IWMDMMetaData(ppMetadata)
    }

    /**
     * The SetMetadata method sets metadata on the storage.
     * @remarks
     * Existing properties in the storage with the same name are overwritten. All other existing properties are not modified or lost.
     * 
     * To set properties for a Windows Portable Devices (WPD) device, an application would create an <b>IPortableDeviceValues</b> object and set each property into this collection. Then, the application would serialize the collection to a binary large object (BLOB). Once the data is serialized, the application would add it to the <b>IWMDMMetaData</b> referenced by the <i>pMetadata</i> argument using the g_wszWPDPassthroughPropertyValues metadata constant.
     * @param {IWMDMMetaData} pMetadata An <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmmetadata">IWMDMMetaData</a> pointer containing metadata to set on the object. To create this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage3-createemptymetadataobject">CreateEmptyMetadataObject</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage3-setmetadata
     */
    SetMetadata(pMetadata) {
        result := ComCall(16, this, "ptr", pMetadata, "HRESULT")
        return result
    }

    /**
     * The CreateEmptyMetadataObject method creates a new IWMDMMetaData interface. This interface is used to set or retrieve metadata properties of a storage.
     * @remarks
     * The metadata interface created is not implicitly connected to the storage that created it; it is merely an empty metadata container. You must submit the interface to a method to set or retrieve metadata values.
     * @returns {IWMDMMetaData} Receives the new <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmmetadata">IWMDMMetaData</a> interface. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage3-createemptymetadataobject
     */
    CreateEmptyMetadataObject() {
        result := ComCall(17, this, "ptr*", &ppMetadata := 0, "HRESULT")
        return IWMDMMetaData(ppMetadata)
    }

    /**
     * The SetEnumPreference method sets the preferred view mode for the storage.
     * @remarks
     * Windows Media Device Manager can present metadata views of the content on the device. It walks through all the content on a top-level storage (such as internal memory or a storage card) and returns a storage enumerator that presents the content organized by the metadata of the content. The definition of a metadata view is provided through a <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmmetadataview">WMDMMetadataView</a> structure.
     * 
     * This behavior is controlled by the <i>pMode</i> parameter. If the <i>pMode</i> is set to ENUM_MODE_RAW, Windows Media Device Manager returns an enumerator that mirrors the hierarchy of the file system on the storage of the device. If the <i>pMode</i> is set to ENUM_MODE_METADATA_VIEWS, Windows Media Device Manager generates metadata views.
     * 
     * Devices indicate their preference by setting the device parameter <i>UseMetadataViews</i> at the time the device is installed. For more information about <i>UseMetadataViews</i>, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/device-parameters">Device Parameters</a>. If the application will let the device decide on the kind of storage enumerator returned, it should set <i>pMode</i> to ENUM_MODE_USE_DEVICE_PREF.
     * 
     * After this method is called, later calls to <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-enumstorage">IWMDMStorage::EnumStorage</a> will behave according to the storage enumeration preference set by this method. This method can be called again to change the behavior of subsequent <b>IWMDMStorage::EnumStorage</b> calls.
     * 
     * This method should typically be called on the top-level storage. If this method is called on any of the storages in metadata view, it will return WMDM_E_NOTSUPPORTED.
     * @param {Pointer<Integer>} pMode Desired mode of the storage enumerator. For more details on the mode, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-storage-enum-mode">WMDM_STORAGE_ENUM_MODE</a>. If the value of <i>pMode</i> is set to ENUM_MODE_USE_DEVICE_PREF, then upon return it is set to ENUM_MODE_RAW or ENUM_MODE_METADATA_VIEWS, based on the device preference.
     * @param {Integer} nViews Number of view definitions provided.
     * 
     * This parameter is ignored if the value of <i>pMode</i> is ENUM_MODE_RAW or if the value of <i>pMode</i> is ENUM_MODE_USE_DEVICE_PREF and the device does not prefer metadata views.
     * 
     * If the value of <i>pMode</i> is ENUM_MODE_METADATA_VIEWS or if the value of <i>pMode</i> is ENUM_MODE_USE_DEVICE_PREF and the device prefers metadata views, this parameter can still be 0. In this case, Windows Media Device Manager uses its default metadata views.
     * 
     * If the value of <i>nViews</i> is 0, <i>ppViews</i> must be <b>NULL</b>. If the value of <i>nViews</i> is not 0, <i>ppViews</i> must point to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmmetadataview">WMDMMetadataView</a> structures with <i>nViews</i> elements.
     * @param {Pointer<WMDMMetadataView>} pViews Array of view definitions. The length of the array must be equal to <i>nViews</i>.
     * 
     * This parameter is ignored if the value of <i>pMode</i> is ENUM_MODE_RAW or if the value of <i>pMode</i> is ENUM_MODE_USE_DEVICE_PREF and the device does not prefer metadata views.
     * 
     * If the value of <i>pMode</i> is ENUM_MODE_METADATA_VIEWS or if the value of <i>pMode</i> is ENUM_MODE_USE_DEVICE_PREF and the device prefers metadata views, this parameter can still be <b>NULL</b>. In this case Windows Media Device Manager uses its default metadata views.
     * 
     * The value of this parameter must be <b>NULL</b> if the value of <i>nViews</i> is 0. If the value of <i>nViews</i> is not 0, <i>ppViews</i> must point to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmmetadataview">WMDMMetadataView</a> structures with <i>nViews</i> elements.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. The following table lists all possible values.
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
     * The method succeeded.
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
     * There is not enough memory to allocate the item.
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
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOT_CERTIFIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the rights to execute this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorage3-setenumpreference
     */
    SetEnumPreference(pMode, nViews, pViews) {
        pModeMarshal := pMode is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pModeMarshal, pMode, "uint", nViews, "ptr", pViews, "HRESULT")
        return result
    }
}
