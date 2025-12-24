#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VSS_SNAPSHOT_PROP.ahk
#Include .\IVssEnumObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivssfilesharesnapshotprovider
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssFileShareSnapshotProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssFileShareSnapshotProvider
     * @type {Guid}
     */
    static IID => Guid("{c8636060-7c2e-11df-8c4a-0800200c9a66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContext", "GetSnapshotProperties", "Query", "DeleteSnapshots", "BeginPrepareSnapshot", "IsPathSupported", "IsPathSnapshotted", "SetSnapshotProperty"]

    /**
     * Sets the context for the subsequent shadow copy-related operations.
     * @param {Integer} lContext The context to be set. The context must be one of the supported values of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_context">_VSS_SNAPSHOT_CONTEXT</a> or a supported combination of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> and  <b>_VSS_SNAPSHOT_CONTEXT</b> values.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context was set successfully.
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
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is frozen and cannot be changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssfilesharesnapshotprovider-setcontext
     */
    SetContext(lContext) {
        result := ComCall(3, this, "int", lContext, "HRESULT")
        return result
    }

    /**
     * Gets the VSS_SNAPSHOT_PROP structure for a file share snapshot.
     * @param {Guid} SnapshotId Shadow copy identifier.
     * @returns {VSS_SNAPSHOT_PROP} The address of a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure that receives the shadow copy properties. The provider is responsible for setting the members of this structure. All members are required except  <b>m_pwszExposedName</b> and <b>m_pwszExposedPath</b>, which the provider can set to <b>NULL</b>. The provider allocates memory for all string members  that it sets in the structure. When the structure is no longer needed, the caller is responsible for freeing these strings by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-vssfreesnapshotproperties">VssFreeSnapshotProperties</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssfilesharesnapshotprovider-getsnapshotproperties
     */
    GetSnapshotProperties(SnapshotId) {
        pProp := VSS_SNAPSHOT_PROP()
        result := ComCall(4, this, "ptr", SnapshotId, "ptr", pProp, "HRESULT")
        return pProp
    }

    /**
     * Gets an enumeration of VSS_SNAPSHOT_PROP structures for all file share snapshots that are available to the application server.
     * @param {Guid} QueriedObjectId Reserved for system use. The value of this parameter must be GUID_NULL.
     * @param {Integer} eQueriedObjectType Reserved for system use. The value of this parameter must be VSS_OBJECT_NONE.
     * @param {Integer} eReturnedObjectsType Reserved for system use. The value of this parameter must be VSS_OBJECT_SNAPSHOT.
     * @returns {IVssEnumObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface pointer, 
     *       which is initialized on return. Callers must release the interface. This parameter is required and cannot be null.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssfilesharesnapshotprovider-query
     */
    Query(QueriedObjectId, eQueriedObjectType, eReturnedObjectsType) {
        result := ComCall(5, this, "ptr", QueriedObjectId, "int", eQueriedObjectType, "int", eReturnedObjectsType, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumObject(ppEnum)
    }

    /**
     * Deletes specific snapshots, or all snapshots in a specified snapshot set.
     * @param {Guid} SourceObjectId Identifier of the shadow copy or shadow copy set to be deleted.
     * @param {Integer} eSourceObjectType Type of the object to be deleted. The value of this parameter is VSS_OBJECT_SNAPSHOT or VSS_OBJECT_SNAPSHOT_SET.
     * @param {BOOL} bForceDelete If the value of this parameter is <b>TRUE</b>, the provider will do everything possible to delete the shadow copy or shadow copies in a shadow copy set. If it is <b>FALSE</b>, no additional effort will be made.
     * @param {Pointer<Integer>} plDeletedSnapshots Pointer to a variable that receives the number of shadow copies that were deleted.
     * @param {Pointer<Guid>} pNondeletedSnapshotID If an error occurs, this parameter receives a pointer to the identifier of the first shadow copy that could not be deleted. Otherwise, it points to GUID_NULL.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copies were successfully deleted.
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
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified shadow copies were not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provider error. The provider logged the error in the event log. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssfilesharesnapshotprovider-deletesnapshots
     */
    DeleteSnapshots(SourceObjectId, eSourceObjectType, bForceDelete, plDeletedSnapshots, pNondeletedSnapshotID) {
        plDeletedSnapshotsMarshal := plDeletedSnapshots is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", SourceObjectId, "int", eSourceObjectType, "int", bForceDelete, plDeletedSnapshotsMarshal, plDeletedSnapshots, "ptr", pNondeletedSnapshotID, "HRESULT")
        return result
    }

    /**
     * VSS calls this method for each shadow copy that is added to the shadow copy set.
     * @param {Guid} SnapshotSetId Shadow copy set identifier.
     * @param {Guid} SnapshotId Identifier of the shadow copy to be created.
     * @param {Pointer<Integer>} pwszSharePath The file share path.
     * @param {Integer} lNewContext The context for the shadow copy set. This context consists of a bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> values.
     * @param {Guid} ProviderId The provider ID.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy was successfully created.
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
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified volume was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provider error. The provider logged the error in the event log. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNSUPPORTED_CONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified context is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_VOLUME_NOT_SUPPORTED_BY_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not support the specified volume.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssfilesharesnapshotprovider-beginpreparesnapshot
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, pwszSharePath, lNewContext, ProviderId) {
        pwszSharePathMarshal := pwszSharePath is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "ptr", SnapshotSetId, "ptr", SnapshotId, pwszSharePathMarshal, pwszSharePath, "int", lNewContext, "ptr", ProviderId, "HRESULT")
        return result
    }

    /**
     * Determines whether the given Universal Naming Convention (UNC) path is supported by this provider.
     * @param {Pointer<Integer>} pwszSharePath The path to the file share.
     * @returns {BOOL} This parameter receives <b>TRUE</b> if shadow copies are supported on the specified volume, otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssfilesharesnapshotprovider-ispathsupported
     */
    IsPathSupported(pwszSharePath) {
        pwszSharePathMarshal := pwszSharePath is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, pwszSharePathMarshal, pwszSharePath, "int*", &pbSupportedByThisProvider := 0, "HRESULT")
        return pbSupportedByThisProvider
    }

    /**
     * Determines whether the given Universal Naming Convention (UNC) path currently has any snapshots.
     * @param {Pointer<Integer>} pwszSharePath The path to the file share.
     * @param {Pointer<BOOL>} pbSnapshotsPresent This parameter receives <b>TRUE</b> if the volume has a shadow copy, or <b>FALSE</b> if the volume does not have a shadow copy.
     * @param {Pointer<Integer>} plSnapshotCompatibility A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_compatibility">VSS_SNAPSHOT_COMPATIBILITY</a> values that indicate whether certain volume control or file I/O operations are disabled for the given volume, if the volume has a shadow copy.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested information was successfully returned.
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
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified volume was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provider error. The provider logged the error in the event log. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssfilesharesnapshotprovider-ispathsnapshotted
     */
    IsPathSnapshotted(pwszSharePath, pbSnapshotsPresent, plSnapshotCompatibility) {
        pwszSharePathMarshal := pwszSharePath is VarRef ? "ushort*" : "ptr"
        pbSnapshotsPresentMarshal := pbSnapshotsPresent is VarRef ? "int*" : "ptr"
        plSnapshotCompatibilityMarshal := plSnapshotCompatibility is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pwszSharePathMarshal, pwszSharePath, pbSnapshotsPresentMarshal, pbSnapshotsPresent, plSnapshotCompatibilityMarshal, plSnapshotCompatibility, "HRESULT")
        return result
    }

    /**
     * Requests the provider to set a property value for the specified snapshot.
     * @param {Guid} SnapshotId Shadow copy identifier. This parameter is required and cannot be GUID_NULL.
     * @param {Integer} eSnapshotPropertyId A <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_property_id">VSS_SNAPSHOT_PROPERTY_ID</a> value that specifies the property to be set for the shadow copy.
     * @param {VARIANT} vProperty The value to be set for the property. See the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure for valid data types and descriptions of the properties that can be set for a shadow copy.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property was set successfully.
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
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified shadow copy was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssfilesharesnapshotprovider-setsnapshotproperty
     */
    SetSnapshotProperty(SnapshotId, eSnapshotPropertyId, vProperty) {
        result := ComCall(10, this, "ptr", SnapshotId, "int", eSnapshotPropertyId, "ptr", vProperty, "HRESULT")
        return result
    }
}
