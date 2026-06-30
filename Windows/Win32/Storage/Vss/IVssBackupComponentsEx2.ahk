#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssBackupComponentsEx.ahk
#Include .\VSS_ROLLFORWARD_TYPE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssAsync.ahk
#Include .\VSS_COMPONENT_TYPE.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Defines additional methods that requesters can use to run backup and restore operations.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivssbackupcomponentsex2
 * @namespace Windows.Win32.Storage.Vss
 */
class IVssBackupComponentsEx2 extends IVssBackupComponentsEx {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssBackupComponentsEx2
     * @type {Guid}
     */
    static IID => Guid("{acfe2b3a-22c9-4ef8-bd03-2f9ca230084e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 53

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnexposeSnapshot", "SetAuthoritativeRestore", "SetRollForward", "SetRestoreName", "BreakSnapshotSetEx", "PreFastRecovery", "FastRecovery"]

    /**
     * Unexposes a shadow copy either by deleting the file share or by removing the drive letter or mounted folder.
     * @param {Guid} snapshotId The shadow copy identifier. The value of this identifier should be the same as the value that was used when the shadow copy was exposed.
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
     * The shadow copy was successfully unexposed.
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
     * The backup components object is not initialized, this method has been called during a restore operation, or 
     *         this method has not been called within the correct sequence.
     *        
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
     * The specified shadow copy does not exist or is not exposed.
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
     * An
     *         expected provider error has occurred. The error code is logged in the event log. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error has occurred. The error code is logged in the error log. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-unexposesnapshot
     */
    UnexposeSnapshot(snapshotId) {
        result := ComCall(53, this, "ptr", snapshotId, "HRESULT")
        return result
    }

    /**
     * Marks the restore of a component as authoritative for a replicated data store.
     * @remarks
     * The <b>SetAuthoritativeRestore</b> method can only be called during a restore operation.
     * 
     * A writer indicates that it supports authoritative restore by setting the <b>VSS_BS_AUTHORITATIVE_RESTORE</b> flag in its backup schema mask.
     * 
     * For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/setting-vss-restore-options">Setting VSS Restore 
     *       Options</a>.
     * @param {Guid} writerId The globally unique identifier (GUID) of the writer class.
     * @param {VSS_COMPONENT_TYPE} ct The type of the component. See the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> 
     *       enumeration for the possible values.
     * @param {PWSTR} wszLogicalPath A <b>null</b>-terminated wide character string containing the logical path of the component. 
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as the string that was used when the 
     *        component was added.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName A <b>null</b>-terminated wide character string containing the name of the component. 
     *      
     * 
     * The string cannot be <b>NULL</b> and should contain the same component name as the string that was used when the component was added 
     *       to the backup set using 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a> method.
     * @param {Integer} bAuth Set this variable to <b>true</b> to indicate that the restore of the component is authoritative, or <b>false</b> otherwise.
     * 
     * The default value is <b>false</b>.
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
     * The restore of the component was successfully set to authoritative or nonauthoritative.
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
     * This method was not called during a restore operation.
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
     * The specified component was not found.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-setauthoritativerestore
     */
    SetAuthoritativeRestore(writerId, ct, wszLogicalPath, wszComponentName, bAuth) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName

        result := ComCall(54, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "char", bAuth, "HRESULT")
        return result
    }

    /**
     * Sets the roll-forward operation type for a component and specifies the restore point for a partial roll-forward operation.
     * @remarks
     * The <b>SetRollForward</b> method can only be called during a restore operation.
     * 
     * A writer indicates that it supports this method by setting the <b>VSS_BS_ROLLFORWARD_RESTORE</b> flag in its backup schema mask.
     * 
     * For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/setting-vss-restore-options">Setting VSS Restore 
     *       Options</a>.
     * @param {Guid} writerId The globally unique identifier (GUID) of the writer class.
     * @param {VSS_COMPONENT_TYPE} ct The type of the component. See the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> 
     *       enumeration for the possible values.
     * @param {PWSTR} wszLogicalPath A <b>null</b>-terminated wide character string containing the logical path of the component. 
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as the string that was used when the 
     *        component was added.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName A <b>null</b>-terminated wide character string containing the name of the component. 
     *      
     * 
     * The string cannot be <b>NULL</b> and should contain the same component name as the string that was used when the component was added 
     *       to the backup set using 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a> method.
     * @param {VSS_ROLLFORWARD_TYPE} rollType A <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_rollforward_type">VSS_ROLLFORWARD_TYPE</a> enumeration value indicating the type of roll-forward operation to be performed.
     * @param {PWSTR} wszRollForwardPoint A <b>null</b>-terminated wide character string specifying the roll-forward restore point.
     * 
     * The format of this string is defined by the writer, and can be a timestamp, a log sequence number (LSN), or any marker defined by the writer.
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
     * The roll-forward operation type and restore point were successfully set.
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
     * This method was not called during a restore operation.
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
     * The specified component was not found.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-setrollforward
     */
    SetRollForward(writerId, ct, wszLogicalPath, wszComponentName, rollType, wszRollForwardPoint) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszRollForwardPoint := wszRollForwardPoint is String ? StrPtr(wszRollForwardPoint) : wszRollForwardPoint

        result := ComCall(55, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "int", rollType, "ptr", wszRollForwardPoint, "HRESULT")
        return result
    }

    /**
     * Assigns a new logical name to a component that is being restored.
     * @remarks
     * The <b>SetRestoreName</b> method can only be called during a restore operation.
     * 
     * A writer indicates that it supports this method by setting the <b>VSS_BS_RESTORE_RENAME</b> flag in its backup schema mask.
     * 
     * For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/setting-vss-restore-options">Setting VSS Restore 
     *       Options</a>.
     * @param {Guid} writerId The globally unique identifier (GUID) of the writer class.
     * @param {VSS_COMPONENT_TYPE} ct The type of the component. See the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> 
     *       enumeration for the possible values.
     * @param {PWSTR} wszLogicalPath A <b>null</b>-terminated wide character string containing the logical path of the component. 
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as the string that was used when the 
     *        component was added.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName A <b>null</b>-terminated wide character string containing the name of the component. 
     *      
     * 
     * The string cannot be <b>NULL</b> and should contain the same component name as was the component name  that was used when the component was added 
     *       to the backup set using 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a> method.
     * @param {PWSTR} wszRestoreName A <b>null</b>-terminated wide character string containing the restore name to be set for the component.
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
     * The restore name was successfully set.
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
     * This method was not called during a restore operation.
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
     * The specified component was not found.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-setrestorename
     */
    SetRestoreName(writerId, ct, wszLogicalPath, wszComponentName, wszRestoreName) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszRestoreName := wszRestoreName is String ? StrPtr(wszRestoreName) : wszRestoreName

        result := ComCall(56, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszRestoreName, "HRESULT")
        return result
    }

    /**
     * Breaks a shadow copy set according to requester-specified options.
     * @remarks
     * <b>BreakSnapshotSetEx</b> is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-breaksnapshotset">IVssBackupComponents::BreakSnapshotSet</a> method, except that it has extra parameters to query status and specify how the shadow copy set is broken.
     * 
     * Like <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-breaksnapshotset">BreakSnapshotSet</a>, <b>BreakSnapshotSetEx</b> can be used only for shadow copies that were created by a hardware shadow copy provider.
     * 
     * After this method returns, the shadow copy volume is still a volume, but it is no longer a shadow copy. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/breaking-shadow-copies">Breaking Shadow Copies</a>.
     * @param {Guid} SnapshotSetID A shadow copy set identifier.
     * @param {Integer} dwBreakFlags A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_hardware_options">_VSS_HARDWARE_OPTIONS</a> flags that specify how the shadow copy set is broken.
     * @returns {IVssAsync} A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface pointer that can be used to retrieve the status of the shadow copy set break operation. When the break operation is complete, the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method must be called for this interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-breaksnapshotsetex
     */
    BreakSnapshotSetEx(SnapshotSetID, dwBreakFlags) {
        result := ComCall(57, this, "ptr", SnapshotSetID, "uint", dwBreakFlags, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * This method is reserved for future use. (IVssBackupComponentsEx2.PreFastRecovery)
     * @param {Guid} SnapshotSetID This parameter is reserved for future use.
     * @param {Integer} dwPreFastRecoveryFlags This parameter is reserved for future use.
     * @returns {IVssAsync} This parameter is reserved for future use.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-prefastrecovery
     */
    PreFastRecovery(SnapshotSetID, dwPreFastRecoveryFlags) {
        result := ComCall(58, this, "ptr", SnapshotSetID, "uint", dwPreFastRecoveryFlags, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * This method is reserved for future use. (IVssBackupComponentsEx2.FastRecovery)
     * @param {Guid} SnapshotSetID This parameter is reserved for future use.
     * @param {Integer} dwFastRecoveryFlags This parameter is reserved for future use.
     * @returns {IVssAsync} This parameter is reserved for future use.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-fastrecovery
     */
    FastRecovery(SnapshotSetID, dwFastRecoveryFlags) {
        result := ComCall(59, this, "ptr", SnapshotSetID, "uint", dwFastRecoveryFlags, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }
}
