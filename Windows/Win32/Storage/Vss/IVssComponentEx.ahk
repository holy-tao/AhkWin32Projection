#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IVssComponent.ahk

/**
 * Defines additional methods for examining and modifying information about components contained in a requester's Backup Components Document.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsscomponentex
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
     * This method was not called by a writer's <a href="/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpreparebackup">CVssWriter::OnPrepareBackup</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponentex-setprepareforbackupfailuremsg
     */
    SetPrepareForBackupFailureMsg(wszFailureMsg) {
        wszFailureMsg := wszFailureMsg is String ? StrPtr(wszFailureMsg) : wszFailureMsg

        result := ComCall(41, this, "ptr", wszFailureMsg, "HRESULT")
        return result
    }

    /**
     * Sets a PostSnapshot failure message string for a component.
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
     * This method was not called by a writer's <a href="/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpostsnapshot">CVssWriter::OnPostSnapshot</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponentex-setpostsnapshotfailuremsg
     */
    SetPostSnapshotFailureMsg(wszFailureMsg) {
        wszFailureMsg := wszFailureMsg is String ? StrPtr(wszFailureMsg) : wszFailureMsg

        result := ComCall(42, this, "ptr", wszFailureMsg, "HRESULT")
        return result
    }

    /**
     * Returns the PrepareForBackup failure message string that a writer has set for a given component.
     * @returns {BSTR} A pointer to a null-terminated wide character string containing the failure message that describes an error that occurred 
     *       while processing a <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PrepareForBackup</a> 
     *       event.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponentex-getprepareforbackupfailuremsg
     */
    GetPrepareForBackupFailureMsg() {
        pbstrFailureMsg := BSTR()
        result := ComCall(43, this, "ptr", pbstrFailureMsg, "HRESULT")
        return pbstrFailureMsg
    }

    /**
     * Returns the PostSnapshot failure message string that a writer has set for a given component.
     * @returns {BSTR} A pointer to a null-terminated wide character string containing the failure message that describes an error that occurred 
     *       while processing a <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PostSnapshot</a> 
     *       event.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponentex-getpostsnapshotfailuremsg
     */
    GetPostSnapshotFailureMsg() {
        pbstrFailureMsg := BSTR()
        result := ComCall(44, this, "ptr", pbstrFailureMsg, "HRESULT")
        return pbstrFailureMsg
    }

    /**
     * Determines whether a requester has marked the restore of a component as authoritative for a replicated data store.
     * @returns {Boolean} The address of a caller-allocated variable that receives <b>true</b> if the restore is authoritative, or <b>false</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponentex-getauthoritativerestore
     */
    GetAuthoritativeRestore() {
        result := ComCall(45, this, "int*", &pbAuth := 0, "HRESULT")
        return pbAuth
    }

    /**
     * Obtains the roll-forward operation type for a component and obtains the restore point for a partial roll-forward operation.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponentex-getrollforward
     */
    GetRollForward(pRollType, pbstrPoint) {
        pRollTypeMarshal := pRollType is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, pRollTypeMarshal, pRollType, "ptr", pbstrPoint, "HRESULT")
        return result
    }

    /**
     * Obtains the logical name assigned to a component that is being restored.
     * @returns {BSTR} The address of a caller-allocated variable that receives a null-terminated wide character string containing the restore name for the component.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponentex-getrestorename
     */
    GetRestoreName() {
        pbstrName := BSTR()
        result := ComCall(47, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
