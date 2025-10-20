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
     * 
     * @param {Pointer<ID_PARAMETERS>} pIdParameters 
     * @returns {HRESULT} 
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(27, this, "ptr", pIdParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppColumns 
     * @param {Integer} count 
     * @param {Pointer<ISyncKnowledge2>} ppiKnowledgeOut 
     * @returns {HRESULT} 
     */
    ProjectOntoColumnSet(ppColumns, count, ppiKnowledgeOut) {
        result := ComCall(28, this, "char*", ppColumns, "uint", count, "ptr", ppiKnowledgeOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} targetFormatVersion 
     * @param {Integer} dwFlags 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Pointer<UInt32>} pdwSerializedSize 
     * @returns {HRESULT} 
     */
    SerializeWithOptions(targetFormatVersion, dwFlags, pbBuffer, pdwSerializedSize) {
        result := ComCall(29, this, "int", targetFormatVersion, "uint", dwFlags, "char*", pbBuffer, "uint*", pdwSerializedSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge2>} piSyncKnowledge 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<UInt32>} pcbItemIdSize 
     * @returns {HRESULT} 
     */
    GetLowestUncontainedId(piSyncKnowledge, pbItemId, pcbItemIdSize) {
        result := ComCall(30, this, "ptr", piSyncKnowledge, "char*", pbItemId, "uint*", pcbItemIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppiInspector 
     * @returns {HRESULT} 
     */
    GetInspector(riid, ppiInspector) {
        result := ComCall(31, this, "ptr", riid, "ptr", ppiInspector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVersion 
     * @returns {HRESULT} 
     */
    GetMinimumSupportedVersion(pVersion) {
        result := ComCall(32, this, "int*", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} which 
     * @param {Pointer<UInt32>} pValue 
     * @returns {HRESULT} 
     */
    GetStatistics(which, pValue) {
        result := ComCall(33, this, "int", which, "uint*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pKnowledge 
     * @param {Pointer<Byte>} pbItemId 
     * @returns {HRESULT} 
     */
    ContainsKnowledgeForItem(pKnowledge, pbItemId) {
        result := ComCall(34, this, "ptr", pKnowledge, "char*", pbItemId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pKnowledge 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<Byte>} pbChangeUnitId 
     * @returns {HRESULT} 
     */
    ContainsKnowledgeForChangeUnit(pKnowledge, pbItemId, pbChangeUnitId) {
        result := ComCall(35, this, "ptr", pKnowledge, "char*", pbItemId, "char*", pbChangeUnitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pPrerequisiteKnowledge 
     * @param {Pointer<ISyncKnowledge>} pTemplateKnowledge 
     * @param {Pointer<ISyncKnowledge>} ppProjectedKnowledge 
     * @returns {HRESULT} 
     */
    ProjectOntoKnowledgeWithPrerequisite(pPrerequisiteKnowledge, pTemplateKnowledge, ppProjectedKnowledge) {
        result := ComCall(36, this, "ptr", pPrerequisiteKnowledge, "ptr", pTemplateKnowledge, "ptr", ppProjectedKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pSyncKnowledge 
     * @param {Pointer<ISyncKnowledge>} ppComplementedKnowledge 
     * @returns {HRESULT} 
     */
    Complement(pSyncKnowledge, ppComplementedKnowledge) {
        result := ComCall(37, this, "ptr", pSyncKnowledge, "ptr", ppComplementedKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pSyncKnowledge 
     * @returns {HRESULT} 
     */
    IntersectsWithKnowledge(pSyncKnowledge) {
        result := ComCall(38, this, "ptr", pSyncKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppKnowledgeCookie 
     * @returns {HRESULT} 
     */
    GetKnowledgeCookie(ppKnowledgeCookie) {
        result := ComCall(39, this, "ptr", ppKnowledgeCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pKnowledgeCookie 
     * @param {Pointer<Int32>} pResult 
     * @returns {HRESULT} 
     */
    CompareToKnowledgeCookie(pKnowledgeCookie, pResult) {
        result := ComCall(40, this, "ptr", pKnowledgeCookie, "int*", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
