#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssProviderCreateSnapshotSet interface contains the methods used during shadow copy creation.
 * @see https://learn.microsoft.com/windows/win32/api/vsprov/nn-vsprov-ivssprovidercreatesnapshotset
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-endpreparesnapshots
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-precommitsnapshots
     */
    PreCommitSnapshots(SnapshotSetId) {
        result := ComCall(4, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * Quickly commits all LUNs in this provider.
     * @remarks
     * This method is called at the defined time at which the shadow copies should be taken. For each prepared LUN 
     *     in this shadow copy set, the provider will perform the work required to persist the point-in-time LUN contents. 
     *     While this method is executing, both applications and the I/O subsystem are largely quiescent. The provider must 
     *     minimize the amount of time spent in this method. As a general rule, this method should take less than one second 
     *     to complete. This method is called during the Flush and Hold window, and VSS Kernel Support will 
     *      cancel the Flush and Hold if the release is not received within 10 seconds, which would cause VSS to fail the 
     *      shadow copy creation process. If each provider takes more than  a second or two to complete this call, there is a 
     *      high probability that the entire shadow copy creation will fail.
     * 
     * Because the I/O system is quiescent, the provider must take care to not initiate any I/O as it could deadlock 
     *     the system - for example debug or tracing I/O by this method or any calls made from this method. Memory mapped 
     *     files and paging I/O will not be frozen at this time.
     * 
     * Note that the I/O system is quiescent only while this method is executing. Immediately after the last provider's <b>CommitSnapshots</b> method returns, the VSS service releases all pending writes on the source LUNs. If the provider performs any synchronization of the source and shadow copy LUNs, this synchronization must be completed before the provider's <b>CommitSnapshots</b> method returns;  it cannot be performed asynchronously.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-commitsnapshots
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-postcommitsnapshots
     */
    PostCommitSnapshots(SnapshotSetId, lSnapshotsCount) {
        result := ComCall(6, this, "ptr", SnapshotSetId, "int", lSnapshotsCount, "HRESULT")
        return result
    }

    /**
     * Enables providers to support auto-recover shadow copies.
     * @remarks
     * This method was added to enable binary compatibility when the 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-a">auto-recover</a> feature was introduced in 
     *     Windows Server 2003 with Service Pack 1 (SP1).
     * 
     * <div class="alert"><b>Note</b>  For Windows Server 2003, it is recommended that hardware providers implement this method using 
     *     the following example:</div>
     * <div> </div>
     * 
     * ```cpp
     * HRESULT PreFinalCommitSnapshots(
     * VSS_ID     // SnapshotSetId 
     * )
     * {
     *     return S_OK;
     * }
     * 
     * ```
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-prefinalcommitsnapshots
     */
    PreFinalCommitSnapshots(SnapshotSetId) {
        result := ComCall(7, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * Supports auto-recover shadow copies.
     * @remarks
     * This method was added in Windows Server 2003 to enable binary compatibility when the 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-a">auto-recover</a> feature was 
     *     introduced in Windows Server 2003 with Service Pack 1 (SP1).
     * 
     * <div class="alert"><b>Note</b>  For Windows Server 2003, it is recommended that hardware providers implement this method using 
     *     the following example:</div>
     * <div> </div>
     * 
     * ```cpp
     * HRESULT PostFinalCommitSnapshots(
     *     VSS_ID     // SnapshotSetId 
     * )
     * {
     *     return S_OK;
     * }
     * 
     * ```
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-postfinalcommitsnapshots
     */
    PostFinalCommitSnapshots(SnapshotSetId) {
        result := ComCall(8, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * Aborts prepared shadow copies in this provider.
     * @remarks
     * VSS will only call 
     *     <b>AbortSnapshots</b> after the 
     *     requester has called 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-dosnapshotset">IVssBackupComponents::DoSnapshotSet</a>, 
     *     even if the shadow copy fails or is aborted before this point. This means that a provider will not receive an 
     *     <b>AbortSnapshots</b> call until 
     *     after <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-endpreparesnapshots">EndPrepareSnapshots</a> 
     *     has been called. If a shadow copy is aborted or fails before this point, the provider is not given any indication 
     *     until a new shadow copy is started. For this reason, the provider must be prepared to handle an out-of-sequence 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotprovider-beginpreparesnapshot">IVssHardwareSnapshotProvider::BeginPrepareSnapshot</a> 
     *     call at any point. This out-of-sequence call represents the start of a new shadow copy creation sequence and will 
     *     have a new shadow copy set ID.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidercreatesnapshotset-abortsnapshots
     */
    AbortSnapshots(SnapshotSetId) {
        result := ComCall(9, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }
}
