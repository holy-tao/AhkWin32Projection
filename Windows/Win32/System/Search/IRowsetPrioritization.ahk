#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Sets or retrieves the current indexer prioritization level for the scope specified by this query.
 * @remarks
 * 
  * This interface is acquired with <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface Method</a> on an indexer rowset. <b>DBPROP_ENABLEROWSETEVENTS</b> must be set to <b>TRUE</b> with the OLE DB <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms711497(v=vs.85)">ICommandProperties::SetProperties</a> method prior to executing the query in order to use rowset prioritization.
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetprioritization-setscopepriority">IRowsetPrioritization::SetScopePriority</a> sets the prioritization for the scopes belonging to the query, and the interval the scope statistics event is raised when there are outstanding documents to be indexed within the query scopes. This event is raised if the priority level is set to default.
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetprioritization-getscopestatistics">IRowsetPrioritization::GetScopeStatistics</a> can be used to get the number of indexed items in the scope, the number of outstanding documents to be added in the scope, and the number of documents that need to be re-indexed within this scope.
  * 
  * For a sample that demonstrates how to prioritize indexing events, see the [SearchEvents](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/SearchEvents) sample.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-irowsetprioritization
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetPrioritization extends IUnknown{
    /**
     * The interface identifier for IRowsetPrioritization
     * @type {Guid}
     */
    static IID => Guid("{42811652-079d-481b-87a2-09a69ecc5f44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} priority 
     * @param {Integer} scopeStatisticsEventFrequency 
     * @returns {HRESULT} 
     */
    SetScopePriority(priority, scopeStatisticsEventFrequency) {
        result := ComCall(3, this, "int", priority, "uint", scopeStatisticsEventFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} priority 
     * @param {Pointer<UInt32>} scopeStatisticsEventFrequency 
     * @returns {HRESULT} 
     */
    GetScopePriority(priority, scopeStatisticsEventFrequency) {
        result := ComCall(4, this, "int*", priority, "uint*", scopeStatisticsEventFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} indexedDocumentCount 
     * @param {Pointer<UInt32>} oustandingAddCount 
     * @param {Pointer<UInt32>} oustandingModifyCount 
     * @returns {HRESULT} 
     */
    GetScopeStatistics(indexedDocumentCount, oustandingAddCount, oustandingModifyCount) {
        result := ComCall(5, this, "uint*", indexedDocumentCount, "uint*", oustandingAddCount, "uint*", oustandingModifyCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
