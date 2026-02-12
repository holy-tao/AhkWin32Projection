#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VSS_SNAPSHOT_PROP.ahk
#Include .\IVssEnumObject.ahk
#Include .\IVssAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains the methods used by VSS to manage shadow copy volumes. All software providers must support this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nn-vsprov-ivsssoftwaresnapshotprovider
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssSoftwareSnapshotProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssSoftwareSnapshotProvider
     * @type {Guid}
     */
    static IID => Guid("{609e123e-2c5a-44d3-8f01-0b1d9a47d1ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContext", "GetSnapshotProperties", "Query", "DeleteSnapshots", "BeginPrepareSnapshot", "IsVolumeSupported", "IsVolumeSnapshotted", "SetSnapshotProperty", "RevertToSnapshot", "QueryRevertStatus"]

    /**
     * Sets the context for subsequent shadow copy-related operations.
     * @remarks
     * The default context for VSS shadow copies is VSS_CTX_BACKUP.
     * 
     * <b>Windows XP:  </b>The only supported context is the default context, VSS_CTX_BACKUP. Therefore, calling 
     *      <b>SetContext</b> under Windows XP returns
     *      E_NOTIMPL.
     * 
     * For more information about how the context that is set by 
     *     <b>SetContext</b> affects 
     *     how a shadow copy is created and managed, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/implementation-details-for-creating-shadow-copies">Implementation Details for 
     *     Creating Shadow Copies</a>.
     *    
     * 
     * For a complete discussion of the permitted shadow copy contexts, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_context">_VSS_SNAPSHOT_CONTEXT</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-setcontext
     */
    SetContext(lContext) {
        result := ComCall(3, this, "int", lContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the properties of the specified shadow copy.
     * @remarks
     * The caller should set the contents of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure to zero before calling the <b>GetSnapshotProperties</b> method.
     * 
     * The provider is responsible for allocating and freeing the strings in the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @param {Guid} SnapshotId Shadow copy identifier.
     * @returns {VSS_SNAPSHOT_PROP} The address of a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure that receives the shadow copy properties. The provider is responsible for setting the members of this structure. All members are required except  <b>m_pwszExposedName</b> and <b>m_pwszExposedPath</b>, which the provider can set to <b>NULL</b>. The provider allocates memory for all string members  that it sets in the structure. When the structure is no longer needed, the caller is responsible for freeing these strings by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-vssfreesnapshotproperties">VssFreeSnapshotProperties</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-getsnapshotproperties
     */
    GetSnapshotProperties(SnapshotId) {
        pProp := VSS_SNAPSHOT_PROP()
        result := ComCall(4, this, "ptr", SnapshotId, "ptr", pProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pProp
    }

    /**
     * Queries the provider for information about the shadow copies that the provider has completed.
     * @remarks
     * Calling the <a href="https://docs.microsoft.com/windows/desktop/api/vss/nf-vss-ivssenumobject-next">IVssEnumObject::Next</a> method on the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface that is returned though the 
     *     <i>ppEnum</i>  parameter will return 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> structures containing a 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure for each shadow copy.
     * @param {Guid} QueriedObjectId Reserved for system use. The value of this parameter must be GUID_NULL.
     * @param {Integer} eQueriedObjectType Reserved for system use. The value of this parameter must be VSS_OBJECT_NONE.
     * @param {Integer} eReturnedObjectsType Reserved for system use. The value of this parameter must be VSS_OBJECT_SNAPSHOT.
     * @returns {IVssEnumObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface pointer, 
     *       which is initialized on return. Callers must release the interface. This parameter is required and cannot be null.
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-query
     */
    Query(QueriedObjectId, eQueriedObjectType, eReturnedObjectsType) {
        result := ComCall(5, this, "ptr", QueriedObjectId, "int", eQueriedObjectType, "int", eReturnedObjectsType, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVssEnumObject(ppEnum)
    }

    /**
     * Deletes one or more shadow copies or a shadow copy set.
     * @remarks
     * Multiple shadow copies in a shadow copy set are deleted sequentially. If an error occurs during one of these individual deletions, <b>DeleteSnapshots</b> will return immediately; no attempt will be made to delete any remaining shadow copies. The VSS_ID of the undeleted shadow copy is returned in <i>pNondeletedSnapshotID</i>.
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
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-deletesnapshots
     */
    DeleteSnapshots(SourceObjectId, eSourceObjectType, bForceDelete, plDeletedSnapshots, pNondeletedSnapshotID) {
        plDeletedSnapshotsMarshal := plDeletedSnapshots is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", SourceObjectId, "int", eSourceObjectType, "int", bForceDelete, plDeletedSnapshotsMarshal, plDeletedSnapshots, "ptr", pNondeletedSnapshotID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * VSS calls this method for each shadow copy that is added to the shadow copy set. (IVssSoftwareSnapshotProvider.BeginPrepareSnapshot)
     * @param {Guid} SnapshotSetId Shadow copy set identifier.
     * @param {Guid} SnapshotId Identifier of the shadow copy to be created.
     * @param {Pointer<Integer>} pwszVolumeName Null-terminated wide character string containing the volume name. The name must be in one of the following formats and must include a trailing backslash (\\): 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, D:\</li>
     * <li>A volume GUID path of the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * </ul>
     * @param {Integer} lNewContext The context for the shadow copy set. This context consists of a bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> values.
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
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-beginpreparesnapshot
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, pwszVolumeName, lNewContext) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "ptr", SnapshotSetId, "ptr", SnapshotId, pwszVolumeNameMarshal, pwszVolumeName, "int", lNewContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the provider supports shadow copies on the specified volume.
     * @remarks
     * The <b>IsVolumeSupported</b> method will return <b>TRUE</b> if it is possible to create shadow copies on the given volume, even if the current configuration does not allow the creation of shadow copies on that volume at the present time.
     * 
     * For example, if the maximum number of shadow copies has been reached on a given volume (and therefore no more shadow copies can be created on that volume), the method will still indicate that the volume can be shadow copied.
     * 
     * This method cannot be called for a virtual hard disk (VHD) that is nested inside another VHD.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>VHDs are not supported.
     * @param {Pointer<Integer>} pwszVolumeName Null-terminated wide character string containing the volume name. The name must be in one of the following formats and must include a trailing backslash (\\): 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, D:\</li>
     * <li>A volume GUID path of the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * </ul>
     * @returns {BOOL} This parameter receives <b>TRUE</b> if shadow copies are supported on the specified volume, otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-isvolumesupported
     */
    IsVolumeSupported(pwszVolumeName) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, pwszVolumeNameMarshal, pwszVolumeName, "int*", &pbSupportedByThisProvider := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbSupportedByThisProvider
    }

    /**
     * Determines whether any shadow copies exist for the specified volume.
     * @remarks
     * If no volume control or file I/O operations are disabled for the selected volume, then the shadow copy capability of the selected volume returned by <i>plSnapshotCapability</i> will be zero.
     * @param {Pointer<Integer>} pwszVolumeName Null-terminated wide character string containing the volume name. The name must be in one of the following formats and must include a trailing backslash (\\): 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, D:\</li>
     * <li>A volume GUID path of the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where GUID identifies the volume)</li>
     * </ul>
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
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-isvolumesnapshotted
     */
    IsVolumeSnapshotted(pwszVolumeName, pbSnapshotsPresent, plSnapshotCompatibility) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"
        pbSnapshotsPresentMarshal := pbSnapshotsPresent is VarRef ? "int*" : "ptr"
        plSnapshotCompatibilityMarshal := plSnapshotCompatibility is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pwszVolumeNameMarshal, pwszVolumeName, pbSnapshotsPresentMarshal, pbSnapshotsPresent, plSnapshotCompatibilityMarshal, plSnapshotCompatibility, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a property for a shadow copy.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-setsnapshotproperty
     */
    SetSnapshotProperty(SnapshotId, eSnapshotPropertyId, vProperty) {
        result := ComCall(10, this, "ptr", SnapshotId, "int", eSnapshotPropertyId, "ptr", vProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reverts a volume to a previous shadow copy. (IVssSoftwareSnapshotProvider.RevertToSnapshot)
     * @remarks
     * This operation cannot be canceled, or undone once completed. If the computer is rebooted during the revert operation, the revert process will continue when the system is restarted.
     * @param {Guid} SnapshotId Shadow copy identifier of the shadow copy to revert.
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
     * The revert operation was successful.
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
     * <dt><b><b>VSS_E_REVERT_IN_PROGRESS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume already has a revert operation in process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-reverttosnapshot
     */
    RevertToSnapshot(SnapshotId) {
        result := ComCall(11, this, "ptr", SnapshotId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns an IVssAsync interface pointer that can be used to determine the status of the revert operation. (IVssSoftwareSnapshotProvider.QueryRevertStatus)
     * @remarks
     * The revert operation will continue even if the computer is rebooted, and cannot be canceled or undone, except by restoring a backup that was created using another method. The <a href="https://docs.microsoft.com/windows/desktop/api/vss/nf-vss-ivssasync-querystatus">IVssAsync::QueryStatus</a> method cannot return VSS_S_ASYNC_CANCELLED, because the revert operation cannot be canceled after it has started.
     * @param {Pointer<Integer>} pwszVolume Null-terminated wide character string containing the volume name. The name must be in one of the following formats and must include a trailing backslash (\\): 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, D:\</li>
     * <li>A volume GUID path of the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * </ul>
     * @returns {IVssAsync} Pointer to a location that will receive an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface pointer that can be used to retrieve the status of the revert operation. When the operation is complete, the caller must release the interface pointer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-queryrevertstatus
     */
    QueryRevertStatus(pwszVolume) {
        pwszVolumeMarshal := pwszVolume is VarRef ? "ushort*" : "ptr"

        result := ComCall(12, this, pwszVolumeMarshal, pwszVolume, "ptr*", &ppAsync := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVssAsync(ppAsync)
    }
}
