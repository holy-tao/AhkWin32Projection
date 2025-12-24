#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMMetaData.ahk
#Include .\IWMDMStorage2.ahk

/**
 * The IWMDMStorage3 interface extends IWMDMStorage2 by exposing metadata.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstorage3
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
     * @returns {IWMDMMetaData} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmmetadata">IWMDMMetaData</a> pointer associated with a storage. The caller is responsible for calling <b>Release</b> on this interface and all the allocated values when finished with it, as described under "Clearing allocated memory" in <a href="https://docs.microsoft.com/windows/desktop/WMDM/discovering-device-format-capabilities">Discovering Device Format Capabilities</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage3-getmetadata
     */
    GetMetadata() {
        result := ComCall(15, this, "ptr*", &ppMetadata := 0, "HRESULT")
        return IWMDMMetaData(ppMetadata)
    }

    /**
     * The SetMetadata method sets metadata on the storage.
     * @param {IWMDMMetaData} pMetadata An <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmmetadata">IWMDMMetaData</a> pointer containing metadata to set on the object. To create this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage3-createemptymetadataobject">CreateEmptyMetadataObject</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage3-setmetadata
     */
    SetMetadata(pMetadata) {
        result := ComCall(16, this, "ptr", pMetadata, "HRESULT")
        return result
    }

    /**
     * The CreateEmptyMetadataObject method creates a new IWMDMMetaData interface. This interface is used to set or retrieve metadata properties of a storage.
     * @returns {IWMDMMetaData} Receives the new <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmmetadata">IWMDMMetaData</a> interface. The caller must release this interface when done with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage3-createemptymetadataobject
     */
    CreateEmptyMetadataObject() {
        result := ComCall(17, this, "ptr*", &ppMetadata := 0, "HRESULT")
        return IWMDMMetaData(ppMetadata)
    }

    /**
     * The SetEnumPreference method sets the preferred view mode for the storage.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage3-setenumpreference
     */
    SetEnumPreference(pMode, nViews, pViews) {
        pModeMarshal := pMode is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pModeMarshal, pMode, "uint", nViews, "ptr", pViews, "HRESULT")
        return result
    }
}
