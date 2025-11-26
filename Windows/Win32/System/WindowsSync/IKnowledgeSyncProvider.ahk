#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncKnowledge.ahk
#Include .\ISyncProvider.ahk

/**
 * Represents a synchronization provider that uses knowledge to perform synchronization.
 * @remarks
 * 
 * Typically, the first method that is called by a synchronization  session is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iknowledgesyncprovider-beginsession">BeginSession</a>. The last method is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iknowledgesyncprovider-endsession">EndSession</a>. All other <b>IKnowledgeSyncProvider</b> methods are called between these two methods.
 * 
 * For an overview of what a synchronization session is see the topic <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/windows-sync-overview">Windows Sync Overview</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iknowledgesyncprovider
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iknowledgesyncprovider-beginsession
     */
    BeginSession(role, pSessionState) {
        result := ComCall(4, this, "int", role, "ptr", pSessionState, "HRESULT")
        return result
    }

    /**
     * Gets the requested number of item changes that will be included in change batches, and the current knowledge for the synchronization scope.
     * @param {Pointer<Integer>} pdwRequestedBatchSize Returns the requested number of item changes that will be included in change batches returned by the source provider.
     * @returns {ISyncKnowledge} Returns the current knowledge for the synchronization scope, or a newly created knowledge object if no current knowledge exists.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iknowledgesyncprovider-getsyncbatchparameters
     */
    GetSyncBatchParameters(pdwRequestedBatchSize) {
        pdwRequestedBatchSizeMarshal := pdwRequestedBatchSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", &ppSyncKnowledge := 0, pdwRequestedBatchSizeMarshal, pdwRequestedBatchSize, "HRESULT")
        return ISyncKnowledge(ppSyncKnowledge)
    }

    /**
     * Gets a change batch that contains item metadata for items that are not contained in the specified knowledge from the destination provider.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iknowledgesyncprovider-getchangebatch
     */
    GetChangeBatch(dwBatchSize, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever) {
        result := ComCall(6, this, "uint", dwBatchSize, "ptr", pSyncKnowledge, "ptr*", ppSyncChangeBatch, "ptr*", ppUnkDataRetriever, "HRESULT")
        return result
    }

    /**
     * Gets a change batch that contains item metadata for items that have IDs greater than the specified lower bound, as part of a full enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iknowledgesyncprovider-getfullenumerationchangebatch
     */
    GetFullEnumerationChangeBatch(dwBatchSize, pbLowerEnumerationBound, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever) {
        pbLowerEnumerationBoundMarshal := pbLowerEnumerationBound is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", dwBatchSize, pbLowerEnumerationBoundMarshal, pbLowerEnumerationBound, "ptr", pSyncKnowledge, "ptr*", ppSyncChangeBatch, "ptr*", ppUnkDataRetriever, "HRESULT")
        return result
    }

    /**
     * Processes a set of changes by detecting conflicts and applying changes to the item store.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iknowledgesyncprovider-processchangebatch
     */
    ProcessChangeBatch(resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics) {
        result := ComCall(8, this, "int", resolutionPolicy, "ptr", pSourceChangeBatch, "ptr", pUnkDataRetriever, "ptr", pCallback, "ptr", pSyncSessionStatistics, "HRESULT")
        return result
    }

    /**
     * Processes a set of changes for a full enumeration by applying changes to the item store.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iknowledgesyncprovider-processfullenumerationchangebatch
     */
    ProcessFullEnumerationChangeBatch(resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics) {
        result := ComCall(9, this, "int", resolutionPolicy, "ptr", pSourceChangeBatch, "ptr", pUnkDataRetriever, "ptr", pCallback, "ptr", pSyncSessionStatistics, "HRESULT")
        return result
    }

    /**
     * Notifies the provider that a synchronization session to which it was enlisted has finished.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iknowledgesyncprovider-endsession
     */
    EndSession(pSessionState) {
        result := ComCall(10, this, "ptr", pSessionState, "HRESULT")
        return result
    }
}
