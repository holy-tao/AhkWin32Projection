#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} role 
     * @param {Pointer<ISyncSessionState>} pSessionState 
     * @returns {HRESULT} 
     */
    BeginSession(role, pSessionState) {
        result := ComCall(4, this, "int", role, "ptr", pSessionState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppSyncKnowledge 
     * @param {Pointer<UInt32>} pdwRequestedBatchSize 
     * @returns {HRESULT} 
     */
    GetSyncBatchParameters(ppSyncKnowledge, pdwRequestedBatchSize) {
        result := ComCall(5, this, "ptr", ppSyncKnowledge, "uint*", pdwRequestedBatchSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBatchSize 
     * @param {Pointer<ISyncKnowledge>} pSyncKnowledge 
     * @param {Pointer<ISyncChangeBatch>} ppSyncChangeBatch 
     * @param {Pointer<IUnknown>} ppUnkDataRetriever 
     * @returns {HRESULT} 
     */
    GetChangeBatch(dwBatchSize, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever) {
        result := ComCall(6, this, "uint", dwBatchSize, "ptr", pSyncKnowledge, "ptr", ppSyncChangeBatch, "ptr", ppUnkDataRetriever, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBatchSize 
     * @param {Pointer<Byte>} pbLowerEnumerationBound 
     * @param {Pointer<ISyncKnowledge>} pSyncKnowledge 
     * @param {Pointer<ISyncFullEnumerationChangeBatch>} ppSyncChangeBatch 
     * @param {Pointer<IUnknown>} ppUnkDataRetriever 
     * @returns {HRESULT} 
     */
    GetFullEnumerationChangeBatch(dwBatchSize, pbLowerEnumerationBound, pSyncKnowledge, ppSyncChangeBatch, ppUnkDataRetriever) {
        result := ComCall(7, this, "uint", dwBatchSize, "char*", pbLowerEnumerationBound, "ptr", pSyncKnowledge, "ptr", ppSyncChangeBatch, "ptr", ppUnkDataRetriever, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} resolutionPolicy 
     * @param {Pointer<ISyncChangeBatch>} pSourceChangeBatch 
     * @param {Pointer<IUnknown>} pUnkDataRetriever 
     * @param {Pointer<ISyncCallback>} pCallback 
     * @param {Pointer<SYNC_SESSION_STATISTICS>} pSyncSessionStatistics 
     * @returns {HRESULT} 
     */
    ProcessChangeBatch(resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics) {
        result := ComCall(8, this, "int", resolutionPolicy, "ptr", pSourceChangeBatch, "ptr", pUnkDataRetriever, "ptr", pCallback, "ptr", pSyncSessionStatistics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} resolutionPolicy 
     * @param {Pointer<ISyncFullEnumerationChangeBatch>} pSourceChangeBatch 
     * @param {Pointer<IUnknown>} pUnkDataRetriever 
     * @param {Pointer<ISyncCallback>} pCallback 
     * @param {Pointer<SYNC_SESSION_STATISTICS>} pSyncSessionStatistics 
     * @returns {HRESULT} 
     */
    ProcessFullEnumerationChangeBatch(resolutionPolicy, pSourceChangeBatch, pUnkDataRetriever, pCallback, pSyncSessionStatistics) {
        result := ComCall(9, this, "int", resolutionPolicy, "ptr", pSourceChangeBatch, "ptr", pUnkDataRetriever, "ptr", pCallback, "ptr", pSyncSessionStatistics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncSessionState>} pSessionState 
     * @returns {HRESULT} 
     */
    EndSession(pSessionState) {
        result := ComCall(10, this, "ptr", pSessionState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
