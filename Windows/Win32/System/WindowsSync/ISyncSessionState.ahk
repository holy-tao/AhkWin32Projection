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
     * 
     * @param {Pointer<BOOL>} pfIsCanceled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-iscanceled
     */
    IsCanceled(pfIsCanceled) {
        pfIsCanceledMarshal := pfIsCanceled is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pfIsCanceledMarshal, pfIsCanceled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbChangeApplierInfo 
     * @param {Pointer<Integer>} pcbChangeApplierInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-getinfoforchangeapplication
     */
    GetInfoForChangeApplication(pbChangeApplierInfo, pcbChangeApplierInfo) {
        pbChangeApplierInfoMarshal := pbChangeApplierInfo is VarRef ? "char*" : "ptr"
        pcbChangeApplierInfoMarshal := pcbChangeApplierInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbChangeApplierInfoMarshal, pbChangeApplierInfo, pcbChangeApplierInfoMarshal, pcbChangeApplierInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbChangeApplierInfo 
     * @param {Integer} cbChangeApplierInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-loadinfofromchangeapplication
     */
    LoadInfoFromChangeApplication(pbChangeApplierInfo, cbChangeApplierInfo) {
        pbChangeApplierInfoMarshal := pbChangeApplierInfo is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbChangeApplierInfoMarshal, pbChangeApplierInfo, "uint", cbChangeApplierInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbRangeStart 
     * @param {Pointer<Integer>} pcbRangeStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-getforgottenknowledgerecoveryrangestart
     */
    GetForgottenKnowledgeRecoveryRangeStart(pbRangeStart, pcbRangeStart) {
        pbRangeStartMarshal := pbRangeStart is VarRef ? "char*" : "ptr"
        pcbRangeStartMarshal := pcbRangeStart is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pbRangeStartMarshal, pbRangeStart, pcbRangeStartMarshal, pcbRangeStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbRangeEnd 
     * @param {Pointer<Integer>} pcbRangeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-getforgottenknowledgerecoveryrangeend
     */
    GetForgottenKnowledgeRecoveryRangeEnd(pbRangeEnd, pcbRangeEnd) {
        pbRangeEndMarshal := pbRangeEnd is VarRef ? "char*" : "ptr"
        pcbRangeEndMarshal := pcbRangeEnd is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pbRangeEndMarshal, pbRangeEnd, pcbRangeEndMarshal, pcbRangeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYNC_RANGE>} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-setforgottenknowledgerecoveryrange
     */
    SetForgottenKnowledgeRecoveryRange(pRange) {
        result := ComCall(8, this, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} provider 
     * @param {Integer} syncStage 
     * @param {Integer} dwCompletedWork 
     * @param {Integer} dwTotalWork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate-onprogress
     */
    OnProgress(provider, syncStage, dwCompletedWork, dwTotalWork) {
        result := ComCall(9, this, "int", provider, "int", syncStage, "uint", dwCompletedWork, "uint", dwTotalWork, "HRESULT")
        return result
    }
}
