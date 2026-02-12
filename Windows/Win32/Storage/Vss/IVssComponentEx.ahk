#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IVssComponent.ahk

/**
 * Defines additional methods for examining and modifying information about components contained in a requester's Backup Components Document.
 * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nl-vswriter-ivsscomponentex
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssComponentEx extends IVssComponent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssComponentEx
     * @type {Guid}
     */
    static IID => Guid("{156c8b5e-f131-4bd7-9c97-d1923be7e1fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 41

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPrepareForBackupFailureMsg", "SetPostSnapshotFailureMsg", "GetPrepareForBackupFailureMsg", "GetPostSnapshotFailureMsg", "GetAuthoritativeRestore", "GetRollForward", "GetRestoreName"]

    /**
     * Sets a PrepareForBackup failure message string for a component.
     * @remarks
     * The failure message that is set by 
     * <b>SetPrepareForBackupFailureMsg</b> applies to all files in the component and any subcomponents.
     * @param {PWSTR} wszFailureMsg The address of a caller-allocated <b>NULL</b>-terminated wide character string containing the failure message that describes an error that occurred 
     *       while processing a <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PrepareForBackup</a> 
     *       event.
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
     * The failure message was successfully set.
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
     * This method was not called by a writer's <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpreparebackup">CVssWriter::OnPrepareBackup</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsscomponentex-setprepareforbackupfailuremsg
     */
    SetPrepareForBackupFailureMsg(wszFailureMsg) {
        wszFailureMsg := wszFailureMsg is String ? StrPtr(wszFailureMsg) : wszFailureMsg

        result := ComCall(41, this, "ptr", wszFailureMsg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a PostSnapshot failure message string for a component.
     * @remarks
     * The failure message that is set by 
     * <b>SetPostSnapshotFailureMsg</b> applies to all files in the component and any subcomponents.
     * @param {PWSTR} wszFailureMsg The address of a caller-allocated <b>NULL</b>-terminated wide character string containing the failure message that describes an error that occurred 
     *       while processing a <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PostSnapshot</a> 
     *       event.
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
     * The failure message was successfully set.
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
     * This method was not called by a writer's <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpostsnapshot">CVssWriter::OnPostSnapshot</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsscomponentex-setpostsnapshotfailuremsg
     */
    SetPostSnapshotFailureMsg(wszFailureMsg) {
        wszFailureMsg := wszFailureMsg is String ? StrPtr(wszFailureMsg) : wszFailureMsg

        result := ComCall(42, this, "ptr", wszFailureMsg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the PrepareForBackup failure message string that a writer has set for a given component.
     * @remarks
     * The caller is responsible for freeing the string that  the <i>pbstrFailureMsg</i> parameter points to by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @returns {BSTR} A pointer to a null-terminated wide character string containing the failure message that describes an error that occurred 
     *       while processing a <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PrepareForBackup</a> 
     *       event.
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsscomponentex-getprepareforbackupfailuremsg
     */
    GetPrepareForBackupFailureMsg() {
        pbstrFailureMsg := BSTR()
        result := ComCall(43, this, "ptr", pbstrFailureMsg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFailureMsg
    }

    /**
     * Returns the PostSnapshot failure message string that a writer has set for a given component.
     * @remarks
     * The caller is responsible for freeing the string that  the <i>pbstrFailureMsg</i> parameter points to by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @returns {BSTR} A pointer to a null-terminated wide character string containing the failure message that describes an error that occurred 
     *       while processing a <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PostSnapshot</a> 
     *       event.
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsscomponentex-getpostsnapshotfailuremsg
     */
    GetPostSnapshotFailureMsg() {
        pbstrFailureMsg := BSTR()
        result := ComCall(44, this, "ptr", pbstrFailureMsg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFailureMsg
    }

    /**
     * Determines whether a requester has marked the restore of a component as authoritative for a replicated data store.
     * @remarks
     * A writer indicates that it supports authoritative restore by setting the <b>VSS_BS_AUTHORITATIVE_RESTORE</b> flag in its backup schema mask.
     * 
     * For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/setting-vss-restore-options">Setting VSS Restore 
     *       Options</a>.
     * @returns {Boolean} The address of a caller-allocated variable that receives <b>true</b> if the restore is authoritative, or <b>false</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsscomponentex-getauthoritativerestore
     */
    GetAuthoritativeRestore() {
        result := ComCall(45, this, "int*", &pbAuth := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbAuth
    }

    /**
     * Obtains the roll-forward operation type for a component and obtains the restore point for a partial roll-forward operation.
     * @remarks
     * The <b>GetRollForward</b> method can be called only during a restore operation.
     * 
     * If the call to <b>GetRollForward</b> is successful, the caller is responsible for freeing the string that  is returned in the <i>pRollType</i> parameter by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * 
     * A writer indicates that it supports this method by setting the <b>VSS_BS_ROLLFORWARD_RESTORE</b> flag in its backup schema mask.
     * 
     * For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/setting-vss-restore-options">Setting VSS Restore 
     *       Options</a>.
     * @param {Pointer<Integer>} pRollType A <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_rollforward_type">VSS_ROLLFORWARD_TYPE</a> enumeration value indicating the type of roll-forward operation to be performed.
     * @param {Pointer<BSTR>} pbstrPoint The address of a caller-allocated variable that receives a null-terminated wide character string specifying the roll-forward restore point.
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
     * The operation was successful.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsscomponentex-getrollforward
     */
    GetRollForward(pRollType, pbstrPoint) {
        pRollTypeMarshal := pRollType is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, pRollTypeMarshal, pRollType, "ptr", pbstrPoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains the logical name assigned to a component that is being restored.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-setrestorename">GetRestoreName</a> method can only be called during a restore operation.
     * 
     * If the call to <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-setrestorename">GetRestoreName</a> is successful, the caller is responsible for freeing the string that  is returned in the <i>pbstrName</i> parameter by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * 
     * A writer indicates that it supports this method by setting the <b>VSS_BS_RESTORE_RENAME</b> flag in its backup schema mask.
     * 
     * For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/setting-vss-restore-options">Setting VSS Restore 
     *       Options</a>.
     * @returns {BSTR} The address of a caller-allocated variable that receives a null-terminated wide character string containing the restore name for the component.
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsscomponentex-getrestorename
     */
    GetRestoreName() {
        pbstrName := BSTR()
        result := ComCall(47, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }
}
