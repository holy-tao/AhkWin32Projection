#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncKnowledge.ahk
#Include .\ISyncProvider.ahk

/**
 * Represents a synchronization provider that uses knowledge to perform synchronization.
 * @remarks
 * Typically, the first method that is called by a synchronization  session is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iknowledgesyncprovider-beginsession">BeginSession</a>. The last method is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iknowledgesyncprovider-endsession">EndSession</a>. All other <b>IKnowledgeSyncProvider</b> methods are called between these two methods.
 * 
 * For an overview of what a synchronization session is see the topic <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/windows-sync-overview">Windows Sync Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-iknowledgesyncprovider
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IKnowledgeSyncProvider extends ISyncProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnowledgeSyncProvider
     * @type {Guid}
     */
    static IID => Guid("{43434a49-8da4-47f2-8172-ad7b8b024978}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginSession", "GetSyncBatchParameters", "GetChangeBatch", "GetFullEnumerationChangeBatch", "ProcessChangeBatch", "ProcessFullEnumerationChangeBatch", "EndSession"]

    /**
     * Notifies the provider that it is joining a synchronization session.
     * @remarks
     * The provider must return an error if it cannot begin a session. This can occur when the provider has not been initialized, has an invalid configuration, or is already enlisted in an active session.
     * @param {Integer} role The role of this provider, relative to the other provider in the session.
     * @param {ISyncSessionState} pSessionState The current status of the corresponding session.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * <dt><b>Provider-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-beginsession
     */
    BeginSession(role, pSessionState) {
        result := ComCall(4, this, "int", role, "ptr", pSessionState, "HRESULT")
        return result
    }

    /**
     * Gets the requested number of item changes that will be included in change batches, and the current knowledge for the synchronization scope.
     * @param {Pointer<Integer>} pdwRequestedBatchSize Returns the requested number of item changes that will be included in change batches returned by the source provider.
     * @returns {ISyncKnowledge} Returns the current knowledge for the synchronization scope, or a newly created knowledge object if no current knowledge exists.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-getsyncbatchparameters
     */
    GetSyncBatchParameters(pdwRequestedBatchSize) {
        pdwRequestedBatchSizeMarshal := pdwRequestedBatchSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", &ppSyncKnowledge := 0, pdwRequestedBatchSizeMarshal, pdwRequestedBatchSize, "HRESULT")
        return ISyncKnowledge(ppSyncKnowledge)
    }

    /**
     * Gets a change batch that contains item metadata for items that are not contained in the specified knowledge from the destination provider.
     * @remarks
     * Be aware that <i>dwBatchSize</i> is a requested number only. A smaller or larger batch can be returned.
     * 
     * 
     * <div class="alert"><b>Note</b>  If there are no more changes to send after this batch, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatchbase">ISyncChangeBatchBase::SetLastBatch</a> must be called on the returned change batch before <b>GetChangeBatch</b> is called again.</div>
     * <div> </div>
     * @param {Integer} dwBatchSize The requested number of changes to include in the change batch.
     * @param {ISyncKnowledge} pSyncKnowledge The knowledge from the destination provider. This knowledge must be mapped by calling  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncknowledge-mapremotetolocal">ISyncKnowledge::MapRemoteToLocal</a> on the source knowledge before it can be used for change enumeration.
     * @param {Pointer<ISyncChangeBatch>} ppSyncChangeBatch Returns a change batch that contains item metadata for items that are not contained in <i>pSyncKnowledge</i>.
     * @param {Pointer<IUnknown>} ppUnkDataRetriever Returns an object that can be used to retrieve change data. It can be an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isynchronousdataretriever">ISynchronousDataRetriever</a> object or a provider-specific object.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * <dt><b>Provider-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-getchangebatch
     */
    GetChangeBatch(dwBatchSize, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever) {
        result := ComCall(6, this, "uint", dwBatchSize, "ptr", pSyncKnowledge, "ptr*", ppSyncChangeBatch, "ptr*", ppUnkDataRetriever, "HRESULT")
        return result
    }

    /**
     * Gets a change batch that contains item metadata for items that have IDs greater than the specified lower bound, as part of a full enumeration.
     * @remarks
     * This method enumerates, in sorted order by item ID, changes that have an item ID of <i>pbLowerEnumerationBound</i> or greater. This enables a synchronization session to determine which items on the destination provider have been deleted but forgotten by the source provider. Optionally, this method can also add changes to the batch, sorted by item ID, that have item ID less than <i>pbLowerEnumerationBound</i> and that are not contained in the destination knowledge.
     * 
     * <div class="alert"><b>Note</b>  If there are no more changes to send after this batch, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncchangebatchbase-setlastbatch">ISyncChangeBatchBase::SetLastBatch</a> must be called on the returned change batch. Otherwise, the synchronization session calls <b>GetFullEnumerationChangeBatch</b> again to retrieve another batch of changes.<p class="note">For a provider that sends item data together with item change metadata, <i>pSyncKnowledge</i> can be used to determine whether it is necessary to send item data. Item data does not have to be sent when the item change is contained in <i>pSyncKnowledge</i>. Be aware that before it can be used to check items for containment, <i>pSyncKnowledge</i> must be mapped by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncknowledge-mapremotetolocal">ISyncKnowledge::MapRemoteToLocal</a> method on the knowledge object that is contained in the current provider.
     * 
     * </div>
     * <div> </div>
     * @param {Integer} dwBatchSize The number of changes to include in the change batch.
     * @param {Pointer<Integer>} pbLowerEnumerationBound The lower bound for item IDs. This method returns changes that have IDs greater than or equal to this ID value.
     * @param {ISyncKnowledge} pSyncKnowledge If an item change is contained in this knowledge object, data for that item already exists on the destination replica.
     * @param {Pointer<ISyncFullEnumerationChangeBatch>} ppSyncChangeBatch Returns a change batch that contains item metadata for items that have IDs greater than the specified lower bound.
     * @param {Pointer<IUnknown>} ppUnkDataRetriever Returns an object that can be used to retrieve change data. It can be an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isynchronousdataretriever">ISynchronousDataRetriever</a> object or a provider-specific object.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * <dt><b>Provider-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-getfullenumerationchangebatch
     */
    GetFullEnumerationChangeBatch(dwBatchSize, pbLowerEnumerationBound, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever) {
        pbLowerEnumerationBoundMarshal := pbLowerEnumerationBound is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", dwBatchSize, pbLowerEnumerationBoundMarshal, pbLowerEnumerationBound, "ptr", pSyncKnowledge, "ptr*", ppSyncChangeBatch, "ptr*", ppUnkDataRetriever, "HRESULT")
        return result
    }

    /**
     * Processes a set of changes by detecting conflicts and applying changes to the item store.
     * @remarks
     * When a source change contains change unit changes, the destination provider must determine which, if any, change unit versions to include in the batch of destination versions that is sent to the change applier. This decision depends on the kind of change from the source provider and whether the item is marked as deleted on the destination replica.
     * @param {Integer} resolutionPolicy The conflict resolution policy to use when this method applies changes.
     * @param {ISyncChangeBatch} pSourceChangeBatch A batch of changes from the source provider to be applied locally.
     * @param {IUnknown} pUnkDataRetriever An object that can be used to retrieve change data. It can be an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isynchronousdataretriever">ISynchronousDataRetriever</a> object or a provider-specific object.
     * @param {ISyncCallback} pCallback An object that receives event notifications during change application.
     * @param {Pointer<SYNC_SESSION_STATISTICS>} pSyncSessionStatistics Tracks change statistics. For a provider that uses custom change application, this object must be updated with the results of the change application.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * <dt><b>Provider-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-processchangebatch
     */
    ProcessChangeBatch(resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics) {
        result := ComCall(8, this, "int", resolutionPolicy, "ptr", pSourceChangeBatch, "ptr", pUnkDataRetriever, "ptr", pCallback, "ptr", pSyncSessionStatistics, "HRESULT")
        return result
    }

    /**
     * Processes a set of changes for a full enumeration by applying changes to the item store.
     * @remarks
     * This method is called during forgotten knowledge recovery.
     * @param {Integer} resolutionPolicy The conflict resolution policy to use when this method applies changes.
     * @param {ISyncFullEnumerationChangeBatch} pSourceChangeBatch A batch of changes from the source provider to be applied locally.
     * @param {IUnknown} pUnkDataRetriever An object that can be used to retrieve change data. It can be an <b>ISynchronousDataRetriever</b> object or a provider-specific object.
     * @param {ISyncCallback} pCallback An object that receives event notifications during change application.
     * @param {Pointer<SYNC_SESSION_STATISTICS>} pSyncSessionStatistics Tracks change statistics. For a provider that uses custom change application, this object must be updated with the results of the change application.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * <dt><b>Provider-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-processfullenumerationchangebatch
     */
    ProcessFullEnumerationChangeBatch(resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics) {
        result := ComCall(9, this, "int", resolutionPolicy, "ptr", pSourceChangeBatch, "ptr", pUnkDataRetriever, "ptr", pCallback, "ptr", pSyncSessionStatistics, "HRESULT")
        return result
    }

    /**
     * Notifies the provider that a synchronization session to which it was enlisted has finished.
     * @remarks
     * <i>pSessionState</i> will be equal to the <b>ISyncSessionState</b> object that was provided to the previous corresponding call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iknowledgesyncprovider-beginsession">IKnowledgeSyncProvider::BeginSession</a>.
     * 
     * <div class="alert"><b>Note</b>  This method must return an error, typically <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/windows-sync-error-codes">SYNC_E_INVALIDOPERATION</a>, if the provider did not receive a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iknowledgesyncprovider-beginsession">BeginSession</a> for the specified session.
     * 
     * <p class="note">When this method is called, the provider must release any references it has to the <b>ISyncSessionState</b> object that is specified by <i>pSessionState</i>.
     * 
     * </div>
     * <div> </div>
     * @param {ISyncSessionState} pSessionState The current status of the corresponding session.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * <dt><b>Provider-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-endsession
     */
    EndSession(pSessionState) {
        result := ComCall(10, this, "ptr", pSessionState, "HRESULT")
        return result
    }
}
