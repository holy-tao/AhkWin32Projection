#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Delivers structured log records to the CRM Compensator when using Microsoft Visual Basic.
 * @remarks
 * 
  * The CRM clerk determines the CLSID of the CRM Compensator using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">ICrmLogControl::RegisterCompensator</a> method. It next calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> specifying the CLSID of this CRM Compensator, and then it calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for both the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmcompensator">ICrmCompensator</a> interface and the <b>ICrmCompensatorVariants</b> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmcompensatorvariants
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmCompensatorVariants extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICrmCompensatorVariants
     * @type {Guid}
     */
    static IID => Guid("{f0baf8e4-7804-11d1-82e9-00a0c91eede9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLogControlVariants", "BeginPrepareVariants", "PrepareRecordVariants", "EndPrepareVariants", "BeginCommitVariants", "CommitRecordVariants", "EndCommitVariants", "BeginAbortVariants", "AbortRecordVariants", "EndAbortVariants"]

    /**
     * 
     * @param {ICrmLogControl} pLogControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-setlogcontrolvariants
     */
    SetLogControlVariants(pLogControl) {
        result := ComCall(3, this, "ptr", pLogControl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-beginpreparevariants
     */
    BeginPrepareVariants() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-preparerecordvariants
     */
    PrepareRecordVariants(pLogRecord) {
        result := ComCall(5, this, "ptr", pLogRecord, "short*", &pbForget := 0, "HRESULT")
        return pbForget
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-endpreparevariants
     */
    EndPrepareVariants() {
        result := ComCall(6, this, "short*", &pbOkToPrepare := 0, "HRESULT")
        return pbOkToPrepare
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRecovery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-begincommitvariants
     */
    BeginCommitVariants(bRecovery) {
        result := ComCall(7, this, "short", bRecovery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-commitrecordvariants
     */
    CommitRecordVariants(pLogRecord) {
        result := ComCall(8, this, "ptr", pLogRecord, "short*", &pbForget := 0, "HRESULT")
        return pbForget
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-endcommitvariants
     */
    EndCommitVariants() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRecovery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-beginabortvariants
     */
    BeginAbortVariants(bRecovery) {
        result := ComCall(10, this, "short", bRecovery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-abortrecordvariants
     */
    AbortRecordVariants(pLogRecord) {
        result := ComCall(11, this, "ptr", pLogRecord, "short*", &pbForget := 0, "HRESULT")
        return pbForget
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-endabortvariants
     */
    EndAbortVariants() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
