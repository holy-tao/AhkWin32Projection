#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncKnowledge2.ahk
#Include .\ISyncKnowledge.ahk
#Include ..\Com\IUnknown.ahk

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
     * Gets the ID format schema of the provider.
     * @param {Pointer<ID_PARAMETERS>} pIdParameters The ID format schema of the provider.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSize</i> member of <i>pIdParameters</i> is not equal to <code>sizeof(ID_PARAMETERS)</code>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-getidparameters
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(27, this, "ptr", pIdParameters, "HRESULT")
        return result
    }

    /**
     * Returns the knowledge for the specified set of change units for all the items that are contained in this object.
     * @param {Pointer<Pointer<Integer>>} ppColumns The set of change unit IDs to look up.
     * @param {Integer} count The number of change unit IDs that are contained in <i>ppColumns</i>.
     * @returns {ISyncKnowledge2} A knowledge object that contains only the change units that are specified by <i>ppColumns</i> for all items contained in this object.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-projectontocolumnset
     */
    ProjectOntoColumnSet(ppColumns, count) {
        ppColumnsMarshal := ppColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(28, this, ppColumnsMarshal, ppColumns, "uint", count, "ptr*", &ppiKnowledgeOut := 0, "HRESULT")
        return ISyncKnowledge2(ppiKnowledgeOut)
    }

    /**
     * Serializes the knowledge object data to a byte array based on the specified version and serialization options.
     * @param {Integer} targetFormatVersion The serialized knowledge is compatible with this version.
     * @param {Integer} dwFlags Options that specify additional information about how to serialize the object. Must be zero or a combination of the values specified by the <b>SYNC_SERIALIZE</b> flags (see Remarks). When zero is specified, the replica key map is not included as part of the serialized knowledge data.
     * @param {Pointer<Integer>} pbBuffer The serialized knowledge object data is serialized to this buffer.
     * @param {Pointer<Integer>} pdwSerializedSize Specifies the number of bytes in <i>pBuffer</i>. Returns either the number of bytes that are required to serialize the knowledge data when <i>pBuffer</i> is too small, or the number of bytes written.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pBuffer</i> is too small. In this situation, the required number of bytes is returned in <i>pdwSerializedSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>targetFormatVersion</i> is higher than the version of the object, or the object contains elements that are not compatible with <i>targetFormatVersion</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-serializewithoptions
     */
    SerializeWithOptions(targetFormatVersion, dwFlags, pbBuffer, pdwSerializedSize) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwSerializedSizeMarshal := pdwSerializedSize is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, "int", targetFormatVersion, "uint", dwFlags, pbBufferMarshal, pbBuffer, pdwSerializedSizeMarshal, pdwSerializedSize, "HRESULT")
        return result
    }

    /**
     * Returns the lowest item ID that is not contained in this knowledge and that is contained in the specified knowledge.
     * @param {ISyncKnowledge2} piSyncKnowledge The item ID that is returned in <i>pbItemId</i> is contained in <i>piSyncKnowledge</i>.
     * @param {Pointer<Integer>} pbItemId The lowest item ID that  is contained in <i>piSyncKnowledge</i> and is not contained in this knowledge.
     * @param {Pointer<Integer>} pcbItemIdSize The number of bytes in <i>pbItemId</i>. Returns either the number of bytes that are required to retrieve the ID when <i>pbItemId</i> is too small, or the number of bytes written.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>piSyncKnowledge</i> is contained in this knowledge. In this situation, there is no uncontained item ID to return.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ID format schema of <i>piSyncKnowledge</i> is not the same as the ID format schema of this knowledge.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbItemId</i> is too small. In this situation, the required number of bytes is returned in <i>pcbItemIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-getlowestuncontainedid
     */
    GetLowestUncontainedId(piSyncKnowledge, pbItemId, pcbItemIdSize) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pcbItemIdSizeMarshal := pcbItemIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "ptr", piSyncKnowledge, pbItemIdMarshal, pbItemId, pcbItemIdSizeMarshal, pcbItemIdSize, "HRESULT")
        return result
    }

    /**
     * Returns an object that can be used to retrieve the contents of the knowledge object.
     * @param {Pointer<Guid>} riid The IID of the requested inspector. Must be <b>IID_ICoreFragmentInspector</b>.
     * @param {Pointer<Pointer<Void>>} ppiInspector An object that implements <i>riid</i>, and that can retrieve the contents of the knowledge object.
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
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>riid</i> is not <b>IID_ICoreFragmentInspector</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-getinspector
     */
    GetInspector(riid, ppiInspector) {
        ppiInspectorMarshal := ppiInspector is VarRef ? "ptr*" : "ptr"

        result := ComCall(31, this, "ptr", riid, ppiInspectorMarshal, ppiInspector, "HRESULT")
        return result
    }

    /**
     * Gets the minimum supported version of Microsoft Sync Framework components that can be used with this object.
     * @param {Pointer<Integer>} pVersion The minimum supported version of Microsoft Sync Framework components that can be used with this object.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-getminimumsupportedversion
     */
    GetMinimumSupportedVersion(pVersion) {
        pVersionMarshal := pVersion is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, pVersionMarshal, pVersion, "HRESULT")
        return result
    }

    /**
     * Gets the specified statistic data that is contained in this object.
     * @param {Integer} which Specifies which statistic to retrieve.
     * @param {Pointer<Integer>} pValue The specified statistic data.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>which</i> is not a member of the <b>SYNC_STATISTICS</b> enumeration.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-getstatistics
     */
    GetStatistics(which, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, "int", which, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * Indicates whether the specified knowledge of the specified item is known by this knowledge.
     * @param {ISyncKnowledge} pKnowledge The knowledge object that contains knowledge about <i>pbItemId</i>.
     * @param {Pointer<Integer>} pbItemId The ID of the item to look up.
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
     * This object contains the knowledge known by <i>pKnowledge</i> about <i>pbItemId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This object does not contain the knowledge known by <i>pKnowledge</i> about <i>pbItemId</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ID_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbItemId</i> is not of the format specified by the provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-containsknowledgeforitem
     */
    ContainsKnowledgeForItem(pKnowledge, pbItemId) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(34, this, "ptr", pKnowledge, pbItemIdMarshal, pbItemId, "HRESULT")
        return result
    }

    /**
     * Indicates whether the specified knowledge of the specified change unit is known by this knowledge.
     * @param {ISyncKnowledge} pKnowledge The knowledge object that contains knowledge about <i>pbChangeUnitId</i>.
     * @param {Pointer<Integer>} pbItemId The ID of the item that contains the change unit to look up.
     * @param {Pointer<Integer>} pbChangeUnitId The ID of the change unit to look up.
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
     * This object contains the knowledge known by <i>pKnowledge</i> about <i>pbChangeUnitId</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This object does not contain the knowledge known by <i>pKnowledge</i> about <i>pbChangeUnitId</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ID_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbChangeUnitId</i> is not of the format specified by the provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-containsknowledgeforchangeunit
     */
    ContainsKnowledgeForChangeUnit(pKnowledge, pbItemId, pbChangeUnitId) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(35, this, "ptr", pKnowledge, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, "HRESULT")
        return result
    }

    /**
     * Returns knowledge about the knowledge fragments that are specified by the template knowledge, when the template knowledge contains the prerequisite knowledge for the specified fragments.
     * @param {ISyncKnowledge} pPrerequisiteKnowledge Specifies the knowledge that <i>pTemplateKnowledge</i> must contain for knowledge to be added to <i>ppProjectedKnowledge</i>.
     * @param {ISyncKnowledge} pTemplateKnowledge Specifies the set of knowledge fragments to be added to <i>ppProjectedKnowledge</i>.
     * @returns {ISyncKnowledge} A knowledge object that contains the knowledge fragments that are specified by <i>pTemplateKnowledge</i> when <i>pTemplateKnowledge</i> contains the knowledge that is contained in <i>pPrerequisiteKnowledge</i> for the specified fragments.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-projectontoknowledgewithprerequisite
     */
    ProjectOntoKnowledgeWithPrerequisite(pPrerequisiteKnowledge, pTemplateKnowledge) {
        result := ComCall(36, this, "ptr", pPrerequisiteKnowledge, "ptr", pTemplateKnowledge, "ptr*", &ppProjectedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppProjectedKnowledge)
    }

    /**
     * Returns the knowledge that is contained in this object but that is not contained in the specified knowledge.
     * @param {ISyncKnowledge} pSyncKnowledge The knowledge to remove from this object to calculate the result of the complement operation.
     * @returns {ISyncKnowledge} The knowledge that is contained in this object but that is not contained in the specified knowledge.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-complement
     */
    Complement(pSyncKnowledge) {
        result := ComCall(37, this, "ptr", pSyncKnowledge, "ptr*", &ppComplementedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppComplementedKnowledge)
    }

    /**
     * Indicates whether the specified knowledge intersects with this knowledge.
     * @param {ISyncKnowledge} pSyncKnowledge The knowledge that is checked against this object to determine whether there is an intersection.
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
     * The specified knowledge intersects with this knowledge.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified knowledge does not intersect with this knowledge.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-intersectswithknowledge
     */
    IntersectsWithKnowledge(pSyncKnowledge) {
        result := ComCall(38, this, "ptr", pSyncKnowledge, "HRESULT")
        return result
    }

    /**
     * Gets a lightweight, read-only representation of this knowledge object that can be used for fast comparisons.
     * @returns {IUnknown} A lightweight, read-only representation of this knowledge object that can be used for fast comparisons.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-getknowledgecookie
     */
    GetKnowledgeCookie() {
        result := ComCall(39, this, "ptr*", &ppKnowledgeCookie := 0, "HRESULT")
        return IUnknown(ppKnowledgeCookie)
    }

    /**
     * Performs a fast comparison between the specified knowledge cookie and this knowledge object.
     * @param {IUnknown} pKnowledgeCookie The knowledge cookie to compare against this object.
     * @param {Pointer<Integer>} pResult The result of the comparison.
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
     * <dt><b>E_POINTER
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge2-comparetoknowledgecookie
     */
    CompareToKnowledgeCookie(pKnowledgeCookie, pResult) {
        pResultMarshal := pResult is VarRef ? "int*" : "ptr"

        result := ComCall(40, this, "ptr", pKnowledgeCookie, pResultMarshal, pResult, "HRESULT")
        return result
    }
}
