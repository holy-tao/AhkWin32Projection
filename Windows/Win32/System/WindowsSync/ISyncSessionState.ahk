#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents information about the current synchronization session.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncsessionstate
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncSessionState extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncSessionState
     * @type {Guid}
     */
    static IID => Guid("{b8a940fe-9f01-483b-9434-c37d361225d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsCanceled", "GetInfoForChangeApplication", "LoadInfoFromChangeApplication", "GetForgottenKnowledgeRecoveryRangeStart", "GetForgottenKnowledgeRecoveryRangeEnd", "SetForgottenKnowledgeRecoveryRange", "OnProgress"]

    /**
     * Indicates whether the synchronization session has been canceled.
     * @param {Pointer<BOOL>} pfIsCanceled Returns <b>TRUE</b> if the synchronization session has been canceled; otherwise, returns <b>FALSE</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionstate-iscanceled
     */
    IsCanceled(pfIsCanceled) {
        pfIsCanceledMarshal := pfIsCanceled is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pfIsCanceledMarshal, pfIsCanceled, "HRESULT")
        return result
    }

    /**
     * Retrieves stored data for a serialized change applier.
     * @param {Pointer<Integer>} pbChangeApplierInfo Returns the serialized change applier data.
     * @param {Pointer<Integer>} pcbChangeApplierInfo Specifies the number of bytes in <i>pbChangeApplierInfo</i>. Returns the number of bytes required to retrieve the change applier data when <i>pcbChangeApplierInfo</i> is too small, or returns the number of bytes written.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbChangeApplierInfo</i> is too small. In this case, the required number of bytes is returned in <i>pcbChangeApplierInfo</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionstate-getinfoforchangeapplication
     */
    GetInfoForChangeApplication(pbChangeApplierInfo, pcbChangeApplierInfo) {
        pbChangeApplierInfoMarshal := pbChangeApplierInfo is VarRef ? "char*" : "ptr"
        pcbChangeApplierInfoMarshal := pcbChangeApplierInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbChangeApplierInfoMarshal, pbChangeApplierInfo, pcbChangeApplierInfoMarshal, pcbChangeApplierInfo, "HRESULT")
        return result
    }

    /**
     * Stores data for a serialized change applier.
     * @param {Pointer<Integer>} pbChangeApplierInfo The serialized change applier data.
     * @param {Integer} cbChangeApplierInfo Specifies the number of bytes in <i>pbChangeApplierInfo</i>.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbChangeApplierInfo</i> is not <b>NULL</b> and <i>cbChangeApplierInfo</i> is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_DESERIALIZATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The serialized data is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionstate-loadinfofromchangeapplication
     */
    LoadInfoFromChangeApplication(pbChangeApplierInfo, cbChangeApplierInfo) {
        pbChangeApplierInfoMarshal := pbChangeApplierInfo is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbChangeApplierInfoMarshal, pbChangeApplierInfo, "uint", cbChangeApplierInfo, "HRESULT")
        return result
    }

    /**
     * Gets the lower bound of the recovery range when the session is performing forgotten knowledge recovery.
     * @param {Pointer<Integer>} pbRangeStart Returns the lower bound of the recovery range when the session is performing forgotten knowledge recovery.
     * @param {Pointer<Integer>} pcbRangeStart Specifies the number of bytes in <i>pbRangeStart</i>. Returns the number of bytes required to retrieve the range value when <i>pcbRangeStart</i> is too small, or the number of bytes written.
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
     * <i>pcbRangeStart</i> is too small. In this case, the required number of bytes is returned in <i>pcbRangeStart</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionstate-getforgottenknowledgerecoveryrangestart
     */
    GetForgottenKnowledgeRecoveryRangeStart(pbRangeStart, pcbRangeStart) {
        pbRangeStartMarshal := pbRangeStart is VarRef ? "char*" : "ptr"
        pcbRangeStartMarshal := pcbRangeStart is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pbRangeStartMarshal, pbRangeStart, pcbRangeStartMarshal, pcbRangeStart, "HRESULT")
        return result
    }

    /**
     * Gets the upper bound of the recovery range when the session is performing forgotten knowledge recovery.
     * @param {Pointer<Integer>} pbRangeEnd Returns the upper bound of the recovery range when the session is performing forgotten knowledge recovery.
     * @param {Pointer<Integer>} pcbRangeEnd Specifies the number of bytes in <i>pbRangeEnd</i>. Returns the number of bytes required to retrieve the range value when <i>pcbRangeEnd</i> is too small, or the number of bytes written.
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
     * <i>pcbRangeEnd</i> is too small. In this case, the required number of bytes is returned in <i>pcbRangeEnd</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionstate-getforgottenknowledgerecoveryrangeend
     */
    GetForgottenKnowledgeRecoveryRangeEnd(pbRangeEnd, pcbRangeEnd) {
        pbRangeEndMarshal := pbRangeEnd is VarRef ? "char*" : "ptr"
        pcbRangeEndMarshal := pcbRangeEnd is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pbRangeEndMarshal, pbRangeEnd, pcbRangeEndMarshal, pcbRangeEnd, "HRESULT")
        return result
    }

    /**
     * Sets the recovery range when the session is performing forgotten knowledge recovery.
     * @param {Pointer<SYNC_RANGE>} pRange The lower and upper bounds that define the range of IDs to be recovered.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ID_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An item ID in <i>pRange</i> is not in the format that is specified by the ID format schema of the provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionstate-setforgottenknowledgerecoveryrange
     */
    SetForgottenKnowledgeRecoveryRange(pRange) {
        result := ComCall(8, this, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * Reports synchronization progress to the application.
     * @param {Integer} provider The role of the provider that is sending this event.
     * @param {Integer} syncStage The current stage of the synchronization session.
     * @param {Integer} dwCompletedWork The amount of work that is currently completed in the session. This value is interpreted as being a part of <i>dwTotalWork</i>.
     * @param {Integer} dwTotalWork The total work for the session.
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
     * <i>provider</i> or <i>syncStage</i> is not a valid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionstate-onprogress
     */
    OnProgress(provider, syncStage, dwCompletedWork, dwTotalWork) {
        result := ComCall(9, this, "int", provider, "int", syncStage, "uint", dwCompletedWork, "uint", dwTotalWork, "HRESULT")
        return result
    }
}
