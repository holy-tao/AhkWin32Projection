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
     * 
     * @param {Pointer<BOOL>} pfIsCanceled 
     * @returns {HRESULT} 
     */
    IsCanceled(pfIsCanceled) {
        result := ComCall(3, this, "ptr", pfIsCanceled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbChangeApplierInfo 
     * @param {Pointer<UInt32>} pcbChangeApplierInfo 
     * @returns {HRESULT} 
     */
    GetInfoForChangeApplication(pbChangeApplierInfo, pcbChangeApplierInfo) {
        result := ComCall(4, this, "char*", pbChangeApplierInfo, "uint*", pcbChangeApplierInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbChangeApplierInfo 
     * @param {Integer} cbChangeApplierInfo 
     * @returns {HRESULT} 
     */
    LoadInfoFromChangeApplication(pbChangeApplierInfo, cbChangeApplierInfo) {
        result := ComCall(5, this, "char*", pbChangeApplierInfo, "uint", cbChangeApplierInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbRangeStart 
     * @param {Pointer<UInt32>} pcbRangeStart 
     * @returns {HRESULT} 
     */
    GetForgottenKnowledgeRecoveryRangeStart(pbRangeStart, pcbRangeStart) {
        result := ComCall(6, this, "char*", pbRangeStart, "uint*", pcbRangeStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbRangeEnd 
     * @param {Pointer<UInt32>} pcbRangeEnd 
     * @returns {HRESULT} 
     */
    GetForgottenKnowledgeRecoveryRangeEnd(pbRangeEnd, pcbRangeEnd) {
        result := ComCall(7, this, "char*", pbRangeEnd, "uint*", pcbRangeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYNC_RANGE>} pRange 
     * @returns {HRESULT} 
     */
    SetForgottenKnowledgeRecoveryRange(pRange) {
        result := ComCall(8, this, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} provider 
     * @param {Integer} syncStage 
     * @param {Integer} dwCompletedWork 
     * @param {Integer} dwTotalWork 
     * @returns {HRESULT} 
     */
    OnProgress(provider, syncStage, dwCompletedWork, dwTotalWork) {
        result := ComCall(9, this, "int", provider, "int", syncStage, "uint", dwCompletedWork, "uint", dwTotalWork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
