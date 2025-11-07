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
     * 
     * @param {Integer} role 
     * @param {ISyncSessionState} pSessionState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-beginsession
     */
    BeginSession(role, pSessionState) {
        result := ComCall(4, this, "int", role, "ptr", pSessionState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRequestedBatchSize 
     * @returns {ISyncKnowledge} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-getsyncbatchparameters
     */
    GetSyncBatchParameters(pdwRequestedBatchSize) {
        pdwRequestedBatchSizeMarshal := pdwRequestedBatchSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", &ppSyncKnowledge := 0, pdwRequestedBatchSizeMarshal, pdwRequestedBatchSize, "HRESULT")
        return ISyncKnowledge(ppSyncKnowledge)
    }

    /**
     * 
     * @param {Integer} dwBatchSize 
     * @param {ISyncKnowledge} pSyncKnowledge 
     * @param {Pointer<ISyncChangeBatch>} ppSyncChangeBatch 
     * @param {Pointer<IUnknown>} ppUnkDataRetriever 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-getchangebatch
     */
    GetChangeBatch(dwBatchSize, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever) {
        result := ComCall(6, this, "uint", dwBatchSize, "ptr", pSyncKnowledge, "ptr*", ppSyncChangeBatch, "ptr*", ppUnkDataRetriever, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBatchSize 
     * @param {Pointer<Integer>} pbLowerEnumerationBound 
     * @param {ISyncKnowledge} pSyncKnowledge 
     * @param {Pointer<ISyncFullEnumerationChangeBatch>} ppSyncChangeBatch 
     * @param {Pointer<IUnknown>} ppUnkDataRetriever 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-getfullenumerationchangebatch
     */
    GetFullEnumerationChangeBatch(dwBatchSize, pbLowerEnumerationBound, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever) {
        pbLowerEnumerationBoundMarshal := pbLowerEnumerationBound is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", dwBatchSize, pbLowerEnumerationBoundMarshal, pbLowerEnumerationBound, "ptr", pSyncKnowledge, "ptr*", ppSyncChangeBatch, "ptr*", ppUnkDataRetriever, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} resolutionPolicy 
     * @param {ISyncChangeBatch} pSourceChangeBatch 
     * @param {IUnknown} pUnkDataRetriever 
     * @param {ISyncCallback} pCallback 
     * @param {Pointer<SYNC_SESSION_STATISTICS>} pSyncSessionStatistics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-processchangebatch
     */
    ProcessChangeBatch(resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics) {
        result := ComCall(8, this, "int", resolutionPolicy, "ptr", pSourceChangeBatch, "ptr", pUnkDataRetriever, "ptr", pCallback, "ptr", pSyncSessionStatistics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} resolutionPolicy 
     * @param {ISyncFullEnumerationChangeBatch} pSourceChangeBatch 
     * @param {IUnknown} pUnkDataRetriever 
     * @param {ISyncCallback} pCallback 
     * @param {Pointer<SYNC_SESSION_STATISTICS>} pSyncSessionStatistics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-processfullenumerationchangebatch
     */
    ProcessFullEnumerationChangeBatch(resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics) {
        result := ComCall(9, this, "int", resolutionPolicy, "ptr", pSourceChangeBatch, "ptr", pUnkDataRetriever, "ptr", pCallback, "ptr", pSyncSessionStatistics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncSessionState} pSessionState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iknowledgesyncprovider-endsession
     */
    EndSession(pSessionState) {
        result := ComCall(10, this, "ptr", pSessionState, "HRESULT")
        return result
    }
}
