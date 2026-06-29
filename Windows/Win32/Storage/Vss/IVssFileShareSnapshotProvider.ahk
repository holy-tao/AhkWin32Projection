#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VSS_SNAPSHOT_PROPERTY_ID.ahk" { VSS_SNAPSHOT_PROPERTY_ID }
#Import ".\VSS_SNAPSHOT_PROP.ahk" { VSS_SNAPSHOT_PROP }
#Import ".\VSS_OBJECT_TYPE.ahk" { VSS_OBJECT_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVssEnumObject.ahk" { IVssEnumObject }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * . (IVssFileShareSnapshotProvider)
 * @see https://learn.microsoft.com/windows/win32/api/vsprov/nn-vsprov-ivssfilesharesnapshotprovider
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssFileShareSnapshotProvider extends IUnknown {
    /**
     * The interface identifier for IVssFileShareSnapshotProvider
     * @type {Guid}
     */
    static IID := Guid("{c8636060-7c2e-11df-8c4a-0800200c9a66}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssFileShareSnapshotProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetContext            : IntPtr
        GetSnapshotProperties : IntPtr
        Query                 : IntPtr
        DeleteSnapshots       : IntPtr
        BeginPrepareSnapshot  : IntPtr
        IsPathSupported       : IntPtr
        IsPathSnapshotted     : IntPtr
        SetSnapshotProperty   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssFileShareSnapshotProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the context for the subsequent shadow copy-related operations.
     * @remarks
     * The default context for VSS shadow copies is VSS_CTX_BACKUP.
     * 
     * <b>Windows XP:  </b>The only supported context is the default context, VSS_CTX_BACKUP. Therefore, calling 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-setcontext">SetContext</a> under Windows XP returns
     *      E_NOTIMPL.
     * 
     * For more information about how the context that is set by 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-setcontext">SetContext</a> affects 
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-setcontext
     */
    SetContext(lContext) {
        result := ComCall(3, this, "int", lContext, "HRESULT")
        return result
    }

    /**
     * Gets the VSS_SNAPSHOT_PROP structure for a file share snapshot.
     * @remarks
     * The caller should set the contents of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure to zero before calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsssoftwaresnapshotprovider-getsnapshotproperties">GetSnapshotProperties</a> method.
     * 
     * The provider is responsible for allocating and freeing the strings in the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * 
     * The VSS coordinator calls this method during the PostSnapshot phase of snapshot creation in order to retrieve the snapshot access path (UNC path for file share snapshots).  The coordinator calls this method after PreFinalCommitSnapshots and before it invokes PostSnapshot in the writers.
     * @param {Guid} SnapshotId Shadow copy identifier.
     * @returns {VSS_SNAPSHOT_PROP} The address of a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure that receives the shadow copy properties. The provider is responsible for setting the members of this structure. All members are required except  <b>m_pwszExposedName</b> and <b>m_pwszExposedPath</b>, which the provider can set to <b>NULL</b>. The provider allocates memory for all string members  that it sets in the structure. When the structure is no longer needed, the caller is responsible for freeing these strings by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-vssfreesnapshotproperties">VssFreeSnapshotProperties</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-getsnapshotproperties
     */
    GetSnapshotProperties(SnapshotId) {
        pProp := VSS_SNAPSHOT_PROP()
        result := ComCall(4, this, Guid, SnapshotId, VSS_SNAPSHOT_PROP.Ptr, pProp, "HRESULT")
        return pProp
    }

    /**
     * Gets an enumeration of VSS_SNAPSHOT_PROP structures for all file share snapshots that are available to the application server.
     * @remarks
     * This method is typically called in response to requester generated snapshot query operations.
     * 
     * Calling the <a href="https://docs.microsoft.com/windows/desktop/api/vss/nf-vss-ivssenumobject-next">IVssEnumObject::Next</a> method on the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface that is returned though the 
     *     <i>ppEnum</i>  parameter will return 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> structures containing a 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure for each shadow copy.
     * @param {Guid} QueriedObjectId Reserved for system use. The value of this parameter must be GUID_NULL.
     * @param {VSS_OBJECT_TYPE} eQueriedObjectType Reserved for system use. The value of this parameter must be VSS_OBJECT_NONE.
     * @param {VSS_OBJECT_TYPE} eReturnedObjectsType Reserved for system use. The value of this parameter must be VSS_OBJECT_SNAPSHOT.
     * @returns {IVssEnumObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface pointer, 
     *       which is initialized on return. Callers must release the interface. This parameter is required and cannot be null.
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-query
     */
    Query(QueriedObjectId, eQueriedObjectType, eReturnedObjectsType) {
        result := ComCall(5, this, Guid, QueriedObjectId, VSS_OBJECT_TYPE, eQueriedObjectType, VSS_OBJECT_TYPE, eReturnedObjectsType, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumObject(ppEnum)
    }

    /**
     * Deletes specific snapshots, or all snapshots in a specified snapshot set.
     * @remarks
     * The VSS coordinator calls this method as part of the snapshot auto-release process.  The method is also called in response to requester driven delete operations.
     * @param {Guid} SourceObjectId Identifier of the shadow copy or shadow copy set to be deleted.
     * @param {VSS_OBJECT_TYPE} eSourceObjectType Type of the object to be deleted. The value of this parameter is VSS_OBJECT_SNAPSHOT or VSS_OBJECT_SNAPSHOT_SET.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-deletesnapshots
     */
    DeleteSnapshots(SourceObjectId, eSourceObjectType, bForceDelete, plDeletedSnapshots, pNondeletedSnapshotID) {
        plDeletedSnapshotsMarshal := plDeletedSnapshots is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, Guid, SourceObjectId, VSS_OBJECT_TYPE, eSourceObjectType, BOOL, bForceDelete, plDeletedSnapshotsMarshal, plDeletedSnapshots, Guid.Ptr, pNondeletedSnapshotID, "HRESULT")
        return result
    }

    /**
     * VSS calls this method for each shadow copy that is added to the shadow copy set. (IVssFileShareSnapshotProvider.BeginPrepareSnapshot)
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-beginpreparesnapshot
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, pwszSharePath, lNewContext, ProviderId) {
        pwszSharePathMarshal := pwszSharePath is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, Guid, SnapshotSetId, Guid, SnapshotId, pwszSharePathMarshal, pwszSharePath, "int", lNewContext, Guid, ProviderId, "HRESULT")
        return result
    }

    /**
     * Determines whether the given Universal Naming Convention (UNC) path is supported by this provider.
     * @remarks
     * The VSS coordinator calls this method as part of <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addtosnapshotset">AddToSnapshotSet</a> to determine which provider to use for snapshot creation.
     * @param {Pointer<Integer>} pwszSharePath The path to the file share.
     * @returns {BOOL} This parameter receives <b>TRUE</b> if shadow copies are supported on the specified volume, otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-ispathsupported
     */
    IsPathSupported(pwszSharePath) {
        pwszSharePathMarshal := pwszSharePath is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, pwszSharePathMarshal, pwszSharePath, BOOL.Ptr, &pbSupportedByThisProvider := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-ispathsnapshotted
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
     * @param {VSS_SNAPSHOT_PROPERTY_ID} eSnapshotPropertyId A <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_property_id">VSS_SNAPSHOT_PROPERTY_ID</a> value that specifies the property to be set for the shadow copy.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-setsnapshotproperty
     */
    SetSnapshotProperty(SnapshotId, eSnapshotPropertyId, vProperty) {
        result := ComCall(10, this, Guid, SnapshotId, VSS_SNAPSHOT_PROPERTY_ID, eSnapshotPropertyId, VARIANT, vProperty, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVssFileShareSnapshotProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetContext := CallbackCreate(GetMethod(implObj, "SetContext"), flags, 2)
        this.vtbl.GetSnapshotProperties := CallbackCreate(GetMethod(implObj, "GetSnapshotProperties"), flags, 3)
        this.vtbl.Query := CallbackCreate(GetMethod(implObj, "Query"), flags, 5)
        this.vtbl.DeleteSnapshots := CallbackCreate(GetMethod(implObj, "DeleteSnapshots"), flags, 6)
        this.vtbl.BeginPrepareSnapshot := CallbackCreate(GetMethod(implObj, "BeginPrepareSnapshot"), flags, 6)
        this.vtbl.IsPathSupported := CallbackCreate(GetMethod(implObj, "IsPathSupported"), flags, 3)
        this.vtbl.IsPathSnapshotted := CallbackCreate(GetMethod(implObj, "IsPathSnapshotted"), flags, 4)
        this.vtbl.SetSnapshotProperty := CallbackCreate(GetMethod(implObj, "SetSnapshotProperty"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetContext)
        CallbackFree(this.vtbl.GetSnapshotProperties)
        CallbackFree(this.vtbl.Query)
        CallbackFree(this.vtbl.DeleteSnapshots)
        CallbackFree(this.vtbl.BeginPrepareSnapshot)
        CallbackFree(this.vtbl.IsPathSupported)
        CallbackFree(this.vtbl.IsPathSnapshotted)
        CallbackFree(this.vtbl.SetSnapshotProperty)
    }
}
