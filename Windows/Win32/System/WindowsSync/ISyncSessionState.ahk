#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SYNC_PROGRESS_STAGE.ahk" { SYNC_PROGRESS_STAGE }
#Import ".\SYNC_PROVIDER_ROLE.ahk" { SYNC_PROVIDER_ROLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNC_RANGE.ahk" { SYNC_RANGE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents information about the current synchronization session.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncsessionstate
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncSessionState extends IUnknown {
    /**
     * The interface identifier for ISyncSessionState
     * @type {Guid}
     */
    static IID := Guid("{b8a940fe-9f01-483b-9434-c37d361225d9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncSessionState interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsCanceled                              : IntPtr
        GetInfoForChangeApplication             : IntPtr
        LoadInfoFromChangeApplication           : IntPtr
        GetForgottenKnowledgeRecoveryRangeStart : IntPtr
        GetForgottenKnowledgeRecoveryRangeEnd   : IntPtr
        SetForgottenKnowledgeRecoveryRange      : IntPtr
        OnProgress                              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncSessionState.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-iscanceled
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-getinfoforchangeapplication
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-loadinfofromchangeapplication
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-getforgottenknowledgerecoveryrangestart
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-getforgottenknowledgerecoveryrangeend
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-setforgottenknowledgerecoveryrange
     */
    SetForgottenKnowledgeRecoveryRange(pRange) {
        result := ComCall(8, this, SYNC_RANGE.Ptr, pRange, "HRESULT")
        return result
    }

    /**
     * Reports synchronization progress to the application.
     * @remarks
     * This method can be used to report custom progress to the application. When a provider calls this method, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isynccallback-onprogress">ISyncCallback::OnProgress</a> event is raised.
     * @param {SYNC_PROVIDER_ROLE} provider The role of the provider that is sending this event.
     * @param {SYNC_PROGRESS_STAGE} syncStage The current stage of the synchronization session.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-onprogress
     */
    OnProgress(provider, syncStage, dwCompletedWork, dwTotalWork) {
        result := ComCall(9, this, SYNC_PROVIDER_ROLE, provider, SYNC_PROGRESS_STAGE, syncStage, "uint", dwCompletedWork, "uint", dwTotalWork, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncSessionState.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsCanceled := CallbackCreate(GetMethod(implObj, "IsCanceled"), flags, 2)
        this.vtbl.GetInfoForChangeApplication := CallbackCreate(GetMethod(implObj, "GetInfoForChangeApplication"), flags, 3)
        this.vtbl.LoadInfoFromChangeApplication := CallbackCreate(GetMethod(implObj, "LoadInfoFromChangeApplication"), flags, 3)
        this.vtbl.GetForgottenKnowledgeRecoveryRangeStart := CallbackCreate(GetMethod(implObj, "GetForgottenKnowledgeRecoveryRangeStart"), flags, 3)
        this.vtbl.GetForgottenKnowledgeRecoveryRangeEnd := CallbackCreate(GetMethod(implObj, "GetForgottenKnowledgeRecoveryRangeEnd"), flags, 3)
        this.vtbl.SetForgottenKnowledgeRecoveryRange := CallbackCreate(GetMethod(implObj, "SetForgottenKnowledgeRecoveryRange"), flags, 2)
        this.vtbl.OnProgress := CallbackCreate(GetMethod(implObj, "OnProgress"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsCanceled)
        CallbackFree(this.vtbl.GetInfoForChangeApplication)
        CallbackFree(this.vtbl.LoadInfoFromChangeApplication)
        CallbackFree(this.vtbl.GetForgottenKnowledgeRecoveryRangeStart)
        CallbackFree(this.vtbl.GetForgottenKnowledgeRecoveryRangeEnd)
        CallbackFree(this.vtbl.SetForgottenKnowledgeRecoveryRange)
        CallbackFree(this.vtbl.OnProgress)
    }
}
