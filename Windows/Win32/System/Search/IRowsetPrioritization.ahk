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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetScopePriority", "GetScopePriority", "GetScopeStatistics"]

    /**
     * Sets the current indexer prioritization level for the scope specified by this query.
     * @param {Integer} priority Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-priority_level">PRIORITY_LEVEL</a></b>
     * 
     * Specifies the new indexer prioritization level to be set as the <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-priority_level">PRIORITY_LEVEL</a> enumeration.
     * @param {Integer} scopeStatisticsEventFrequency Type: <b>DWORD</b>
     * 
     * Specifies the occurrence interval of the scope statistics event when there are outstanding documents to be indexed within the query scopes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-irowsetprioritization-setscopepriority
     */
    SetScopePriority(priority, scopeStatisticsEventFrequency) {
        result := ComCall(3, this, "int", priority, "uint", scopeStatisticsEventFrequency, "HRESULT")
        return result
    }

    /**
     * Retrieves the current indexer prioritization level for the scope specified by this query.
     * @param {Pointer<Integer>} priority Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-priority_level">PRIORITY_LEVEL</a>*</b>
     * 
     * The current indexer prioritization level as the <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-priority_level">PRIORITY_LEVEL</a> enumeration.
     * @param {Pointer<Integer>} scopeStatisticsEventFrequency Type: <b>DWORD*</b>
     * 
     * The occurrence interval of the scope statistics event when there are outstanding documents to be indexed within the query scopes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-irowsetprioritization-getscopepriority
     */
    GetScopePriority(priority, scopeStatisticsEventFrequency) {
        priorityMarshal := priority is VarRef ? "int*" : "ptr"
        scopeStatisticsEventFrequencyMarshal := scopeStatisticsEventFrequency is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, priorityMarshal, priority, scopeStatisticsEventFrequencyMarshal, scopeStatisticsEventFrequency, "HRESULT")
        return result
    }

    /**
     * Gets information describing the scope specified by this query.
     * @param {Pointer<Integer>} indexedDocumentCount Type: <b>DWORD*</b>
     * 
     * The total number of documents currently indexed in the scope.
     * @param {Pointer<Integer>} oustandingAddCount Type: <b>DWORD*</b>
     * 
     * The total number of documents yet to be indexed in the scope. These documents are not yet included in <i>indexedDocumentCount</i>.
     * @param {Pointer<Integer>} oustandingModifyCount Type: <b>DWORD*</b>
     * 
     * The total number of documents indexed in the scope that need to be re-indexed. These documents are included in <i>indexedDocumentCount</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-irowsetprioritization-getscopestatistics
     */
    GetScopeStatistics(indexedDocumentCount, oustandingAddCount, oustandingModifyCount) {
        indexedDocumentCountMarshal := indexedDocumentCount is VarRef ? "uint*" : "ptr"
        oustandingAddCountMarshal := oustandingAddCount is VarRef ? "uint*" : "ptr"
        oustandingModifyCountMarshal := oustandingModifyCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, indexedDocumentCountMarshal, indexedDocumentCount, oustandingAddCountMarshal, oustandingAddCount, oustandingModifyCountMarshal, oustandingModifyCount, "HRESULT")
        return result
    }
}
