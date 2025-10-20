#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncKnowledge.ahk

/**
 * Represents additional information about the knowledge that a replica has about its item store.
 * @remarks
 * 
  * An <b>ISyncKnowledge2</b> object can be obtained by passing <b>IID_ISyncKnowledge2</b> to the <b>QueryInterface</b> method of an <b>ISyncKnowledge</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncknowledge2
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncKnowledge2 extends ISyncKnowledge{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncKnowledge2
     * @type {Guid}
     */
    static IID => Guid("{ed0addc0-3b4b-46a1-9a45-45661d2114c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdParameters", "ProjectOntoColumnSet", "SerializeWithOptions", "GetLowestUncontainedId", "GetInspector", "GetMinimumSupportedVersion", "GetStatistics", "ContainsKnowledgeForItem", "ContainsKnowledgeForChangeUnit", "ProjectOntoKnowledgeWithPrerequisite", "Complement", "IntersectsWithKnowledge", "GetKnowledgeCookie", "CompareToKnowledgeCookie"]

    /**
     * 
     * @param {Pointer<ID_PARAMETERS>} pIdParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-getidparameters
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(27, this, "ptr", pIdParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppColumns 
     * @param {Integer} count 
     * @param {Pointer<ISyncKnowledge2>} ppiKnowledgeOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-projectontocolumnset
     */
    ProjectOntoColumnSet(ppColumns, count, ppiKnowledgeOut) {
        result := ComCall(28, this, "ptr*", ppColumns, "uint", count, "ptr*", ppiKnowledgeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} targetFormatVersion 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Pointer<Integer>} pdwSerializedSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-serializewithoptions
     */
    SerializeWithOptions(targetFormatVersion, dwFlags, pbBuffer, pdwSerializedSize) {
        result := ComCall(29, this, "int", targetFormatVersion, "uint", dwFlags, "char*", pbBuffer, "uint*", pdwSerializedSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge2} piSyncKnowledge 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Integer>} pcbItemIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-getlowestuncontainedid
     */
    GetLowestUncontainedId(piSyncKnowledge, pbItemId, pcbItemIdSize) {
        result := ComCall(30, this, "ptr", piSyncKnowledge, "char*", pbItemId, "uint*", pcbItemIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppiInspector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-getinspector
     */
    GetInspector(riid, ppiInspector) {
        result := ComCall(31, this, "ptr", riid, "ptr*", ppiInspector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-getminimumsupportedversion
     */
    GetMinimumSupportedVersion(pVersion) {
        result := ComCall(32, this, "int*", pVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} which 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-getstatistics
     */
    GetStatistics(which, pValue) {
        result := ComCall(33, this, "int", which, "uint*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pKnowledge 
     * @param {Pointer<Integer>} pbItemId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-containsknowledgeforitem
     */
    ContainsKnowledgeForItem(pKnowledge, pbItemId) {
        result := ComCall(34, this, "ptr", pKnowledge, "char*", pbItemId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pKnowledge 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Integer>} pbChangeUnitId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-containsknowledgeforchangeunit
     */
    ContainsKnowledgeForChangeUnit(pKnowledge, pbItemId, pbChangeUnitId) {
        result := ComCall(35, this, "ptr", pKnowledge, "char*", pbItemId, "char*", pbChangeUnitId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pPrerequisiteKnowledge 
     * @param {ISyncKnowledge} pTemplateKnowledge 
     * @param {Pointer<ISyncKnowledge>} ppProjectedKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-projectontoknowledgewithprerequisite
     */
    ProjectOntoKnowledgeWithPrerequisite(pPrerequisiteKnowledge, pTemplateKnowledge, ppProjectedKnowledge) {
        result := ComCall(36, this, "ptr", pPrerequisiteKnowledge, "ptr", pTemplateKnowledge, "ptr*", ppProjectedKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pSyncKnowledge 
     * @param {Pointer<ISyncKnowledge>} ppComplementedKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-complement
     */
    Complement(pSyncKnowledge, ppComplementedKnowledge) {
        result := ComCall(37, this, "ptr", pSyncKnowledge, "ptr*", ppComplementedKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pSyncKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-intersectswithknowledge
     */
    IntersectsWithKnowledge(pSyncKnowledge) {
        result := ComCall(38, this, "ptr", pSyncKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppKnowledgeCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-getknowledgecookie
     */
    GetKnowledgeCookie(ppKnowledgeCookie) {
        result := ComCall(39, this, "ptr*", ppKnowledgeCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pKnowledgeCookie 
     * @param {Pointer<Integer>} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge2-comparetoknowledgecookie
     */
    CompareToKnowledgeCookie(pKnowledgeCookie, pResult) {
        result := ComCall(40, this, "ptr", pKnowledgeCookie, "int*", pResult, "HRESULT")
        return result
    }
}
