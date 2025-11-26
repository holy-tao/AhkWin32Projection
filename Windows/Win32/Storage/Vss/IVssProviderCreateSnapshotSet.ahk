#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssProviderCreateSnapshotSet interface contains the methods used during shadow copy creation.
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivssprovidercreatesnapshotset
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssProviderCreateSnapshotSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssProviderCreateSnapshotSet
     * @type {Guid}
     */
    static IID => Guid("{5f894e5b-1e39-4778-8e23-9abad9f0e08c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EndPrepareSnapshots", "PreCommitSnapshots", "CommitSnapshots", "PostCommitSnapshots", "PreFinalCommitSnapshots", "PostFinalCommitSnapshots", "AbortSnapshots"]

    /**
     * Is called once for the complete shadow copy set, after the last IVssHardwareSnapshotProvider::BeginPrepareSnapshot call.
     * @param {Guid} SnapshotSetId The <b>VSS_ID</b> of the shadow copy set.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
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
     * <dt><b><b>VSS_E_INSUFFICIENT_STORAGE</b></b></dt>
     * <dt>0x8004231FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough disk storage to create a shadow copy. Insufficient disk space can also generate 
     *         <b>VSS_E_PROVIDER_VETO</b> or <b>VSS_E_OBJECT_NOT_FOUND</b> error 
     *         return values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_OBJECT_NOT_FOUND</b></b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SnapshotSetId</i> parameter refers to an object that was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. If this is returned, the error must be described in an entry in 
     *         the application event log, giving the user information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If any other value is returned, VSS will write an event to the event log and convert the error to 
     *       <b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssprovidercreatesnapshotset-endpreparesnapshots
     */
    EndPrepareSnapshots(SnapshotSetId) {
        result := ComCall(3, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * Ensures the provider is ready to quickly commit the prepared LUNs.
     * @param {Guid} SnapshotSetId The <b>VSS_ID</b> that identifies the shadow copy set.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
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
     * <dt><b><b>VSS_E_OBJECT_NOT_FOUND</b></b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SnapshotSetId</i> parameter refers to an object that was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. If this is returned, the error must be described in an entry in 
     *         the application event log, giving the user information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If any other value is returned, VSS will write an event to the event log and convert the error to 
     *       <b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssprovidercreatesnapshotset-precommitsnapshots
     */
    PreCommitSnapshots(SnapshotSetId) {
        result := ComCall(4, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * Quickly commits all LUNs in this provider.
     * @param {Guid} SnapshotSetId The <b>VSS_ID</b> that identifies the shadow copy set.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
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
     * <dt><b><b>VSS_E_OBJECT_NOT_FOUND</b></b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SnapshotSetId</i> parameter refers to an object that was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. The provider must log the details of this error in the application 
     *         event log.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If any other value is returned, VSS will write an event to the event log and convert the error to 
     *       <b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssprovidercreatesnapshotset-commitsnapshots
     */
    CommitSnapshots(SnapshotSetId) {
        result := ComCall(5, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * Is called after all providers involved in the shadow copy set have succeeded with CommitSnapshots.
     * @param {Guid} SnapshotSetId The <b>VSS_ID</b> that identifies the shadow copy set.
     * @param {Integer} lSnapshotsCount Count of shadow copies in the shadow copy set.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
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
     * <dt><b><b>VSS_E_OBJECT_NOT_FOUND</b></b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SnapshotSetId</i> parameter refers to an object that was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. If this is returned, the error must be described in an entry in 
     *         the application event log, giving the user information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If any other value is returned, VSS will write an event to the event log and convert the error to 
     *       <b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssprovidercreatesnapshotset-postcommitsnapshots
     */
    PostCommitSnapshots(SnapshotSetId, lSnapshotsCount) {
        result := ComCall(6, this, "ptr", SnapshotSetId, "int", lSnapshotsCount, "HRESULT")
        return result
    }

    /**
     * Enables providers to support auto-recover shadow copies.
     * @param {Guid} SnapshotSetId The <b>VSS_ID</b> that identifies the shadow copy set.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
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
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. If this is returned, the error must be described in an entry in 
     *         the application event log, giving the user information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If any other value is returned, VSS will write an event to the event log and convert the error to 
     *       <b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssprovidercreatesnapshotset-prefinalcommitsnapshots
     */
    PreFinalCommitSnapshots(SnapshotSetId) {
        result := ComCall(7, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * Supports auto-recover shadow copies.
     * @param {Guid} SnapshotSetId The <b>VSS_ID</b> that identifies the shadow copy set.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
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
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. If this is returned, the error must be described in an entry in 
     *         the application event log, giving the user information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If any other value is returned, VSS will write an event to the event log and convert the error to 
     *       <b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssprovidercreatesnapshotset-postfinalcommitsnapshots
     */
    PostFinalCommitSnapshots(SnapshotSetId) {
        result := ComCall(8, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * Aborts prepared shadow copies in this provider.
     * @param {Guid} SnapshotSetId The <b>VSS_ID</b> that identifies the shadow copy set.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
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
     * <dt><b><b>VSS_E_OBJECT_NOT_FOUND</b></b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SnapshotSetId</i> parameter refers to an object that was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. The provider must log a message in the application event log 
     *         providing the user with information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsprov/nf-vsprov-ivssprovidercreatesnapshotset-abortsnapshots
     */
    AbortSnapshots(SnapshotSetId) {
        result := ComCall(9, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }
}
