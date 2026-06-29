#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVssExamineWriterMetadata.ahk" { IVssExamineWriterMetadata }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IVssExpressWriter.ahk" { IVssExpressWriter }
#Import ".\IVssBackupComponents.ahk" { IVssBackupComponents }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VSS_SNAPSHOT_PROP.ahk" { VSS_SNAPSHOT_PROP }

/**
 * @namespace Windows.Win32.Storage.Vss
 */

;@region Functions
/**
 * The CreateVssExpressWriterInternal function (vswriter.h) creates an IVssExpressWriter interface object and returns a pointer to it.
 * @returns {IVssExpressWriter} Doubly indirect pointer to the newly created <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivssexpresswriter">IVssExpressWriter</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-createvssexpresswriterinternal
 * @since windows6.1
 */
export CreateVssExpressWriterInternal() {
    result := DllCall("VSSAPI.dll\CreateVssExpressWriterInternal", "ptr*", &ppWriter := 0, "HRESULT")
    return IVssExpressWriter(ppWriter)
}

/**
 * The CreateVssBackupComponents function (vsbackup.h) creates an IVssBackupComponents interface object and returns a pointer to it.
 * @remarks
 * The calling application is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release the 
 *     resources held by the returned 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> when it is no 
 *     longer needed.
 * @returns {IVssBackupComponents} Doubly indirect pointer to the created 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> interface object.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-createvssbackupcomponentsinternal
 * @since windows5.1.2600
 */
export CreateVssBackupComponentsInternal() {
    result := DllCall("VSSAPI.dll\CreateVssBackupComponentsInternal", "ptr*", &ppBackup := 0, "HRESULT")
    return IVssBackupComponents(ppBackup)
}

/**
 * The CreateVssExamineWriterMetadata function (vsbackup.h) creates an IVssExamineWriterMetadata object.
 * @remarks
 * To save a copy of a writer’s Writer Metadata Document into an XML string to pass in the <i>bstrXML</i> parameter, use the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-saveasxml">IVssExamineWriterMetadata::SaveAsXML</a> method.
 * 
 * To retrieve the latest version of a writer’s Writer Metadata Document, use the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritermetadata">IVssBackupComponents::GetWriterMetadata</a> method.
 * 
 * To load a writer metadata document into an existing <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata">IVssExamineWriterMetadata</a> object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-loadfromxml">IVssExamineWriterMetadata::LoadFromXML</a> method.
 * 
 * Users should not attempt to modify the contents of the Writer Metadata Document.
 * 
 * The calling application is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release the 
 *     resources held by 
 *     the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata">IVssExamineWriterMetadata</a> object when the object 
 *     is no longer needed.
 * @param {BSTR} bstrXML An XML string containing a Writer Metadata Document with which to initialize the returned 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata">IVssExamineWriterMetadata</a> object.
 * @returns {IVssExamineWriterMetadata} A variable that receives an 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata">IVssExamineWriterMetadata</a> 
 *       interface pointer to the object.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-createvssexaminewritermetadatainternal
 * @since windows5.1.2600
 */
export CreateVssExamineWriterMetadataInternal(bstrXML) {
    result := DllCall("VSSAPI.dll\CreateVssExamineWriterMetadataInternal", BSTR, bstrXML, "ptr*", &ppMetadata := 0, "HRESULT")
    return IVssExamineWriterMetadata(ppMetadata)
}

/**
 * The IsVolumeSnapshottedInternal function (vsbackup.h) determines whether any shadow copies exist for the specified volume.
 * @remarks
 * Before calling this function, the caller must have initialized COM by calling the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> function.
 * 
 * If no volume control or file I/O operations are disabled for the selected volume, then the shadow copy 
 *     capability of the selected volume returned by <i>plSnapshotCapability</i> will be zero.
 * @param {Pointer<Integer>} pwszVolumeName Name of the volume. The name of the volume to be checked must be in one of the following formats and must include a trailing backslash (\\):
 * 
 * <ul>
 * <li>The path of a mounted folder, for example, Y:\MountX\</li>
 * <li>A drive letter, for example, 
 *         D:\</li>
 * <li>A volume GUID path of the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
 * </ul>
 * @param {Pointer<BOOL>} pbSnapshotsPresent The value of this parameter is <b>TRUE</b> if the volume has a shadow copy, and 
 *       <b>FALSE</b> if the volume does not have a shadow copy.
 * @param {Pointer<Integer>} plSnapshotCapability A bit mask (or bitwise OR) of 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_compatibility">VSS_SNAPSHOT_COMPATIBILITY</a> values that 
 *       indicates whether certain volume control or file I/O operations are disabled for the given volume if a shadow 
 *       copy of it exists.
 * @returns {HRESULT} The return values listed here are in addition to the normal COM <b>HRESULT</b>s that may be returned at any time 
 *        from the function.
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
 * The function completed successfully.
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
 * One of the parameters is not valid.
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
 * Out of memory or other system resources.
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
 * Expected provider error. The provider logged the error in the event log. For more information, see 
 *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
 * <dt><b>VSS_E_UNEXPECTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unexpected error. The error code is logged in the error log file. For more information, see 
 *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
 * 
 * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. <b>E_UNEXPECTED</b> is used instead.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unexpected provider error. The error code is logged in the event log file. For additional information, 
 *         see 
 *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-isvolumesnapshottedinternal
 * @since windows5.1.2600
 */
export IsVolumeSnapshottedInternal(pwszVolumeName, pbSnapshotsPresent, plSnapshotCapability) {
    pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"
    pbSnapshotsPresentMarshal := pbSnapshotsPresent is VarRef ? "int*" : "ptr"
    plSnapshotCapabilityMarshal := plSnapshotCapability is VarRef ? "int*" : "ptr"

    result := DllCall("VSSAPI.dll\IsVolumeSnapshottedInternal", pwszVolumeNameMarshal, pwszVolumeName, pbSnapshotsPresentMarshal, pbSnapshotsPresent, plSnapshotCapabilityMarshal, plSnapshotCapability, "HRESULT")
    return result
}

/**
 * The VssFreeSnapshotPropertiesInternal function (vsbackup.h) is used to free the contents of a VSS_SNAPSHOT_PROP structure as part of managing its life cycle.
 * @param {Pointer<VSS_SNAPSHOT_PROP>} pProp Pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> 
 *       object.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-vssfreesnapshotpropertiesinternal
 * @since windows5.1.2600
 */
export VssFreeSnapshotPropertiesInternal(pProp) {
    DllCall("VSSAPI.dll\VssFreeSnapshotPropertiesInternal", VSS_SNAPSHOT_PROP.Ptr, pProp)
}

/**
 * 
 * @param {Guid} ProviderId 
 * @param {Guid} InterfaceId 
 * @returns {IUnknown} 
 */
export GetProviderMgmtInterfaceInternal(ProviderId, InterfaceId) {
    result := DllCall("VSSAPI.dll\GetProviderMgmtInterfaceInternal", Guid, ProviderId, Guid, InterfaceId, "ptr*", &ppItf := 0, "HRESULT")
    return IUnknown(ppItf)
}

/**
 * 
 * @param {PWSTR} wszVolumeName 
 * @returns {Boolean} 
 */
export ShouldBlockRevertInternal(wszVolumeName) {
    wszVolumeName := wszVolumeName is String ? StrPtr(wszVolumeName) : wszVolumeName

    result := DllCall("VSSAPI.dll\ShouldBlockRevertInternal", "ptr", wszVolumeName, "int*", &pbBlock := 0, "HRESULT")
    return pbBlock
}

;@endregion Functions
