#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Delivers unstructured log records to the CRM Compensator when using Microsoft Visual C++.
 * @remarks
 * 
 * The CRM clerk determines the CLSID of the CRM Compensator using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">ICrmLogControl::RegisterCompensator</a> method. It next calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> specifying the CLSID of this CRM Compensator, and then it calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for both the <b>ICrmCompensator</b> interface and the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmcompensatorvariants">ICrmCompensatorVariants</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmcompensator
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmCompensator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICrmCompensator
     * @type {Guid}
     */
    static IID => Guid("{bbc01830-8d3b-11d1-82ec-00a0c91eede9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLogControl", "BeginPrepare", "PrepareRecord", "EndPrepare", "BeginCommit", "CommitRecord", "EndCommit", "BeginAbort", "AbortRecord", "EndAbort"]

    /**
     * 
     * @param {ICrmLogControl} pLogControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-setlogcontrol
     */
    SetLogControl(pLogControl) {
        result := ComCall(3, this, "ptr", pLogControl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-beginprepare
     */
    BeginPrepare() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {CrmLogRecordRead} crmLogRec 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-preparerecord
     */
    PrepareRecord(crmLogRec) {
        result := ComCall(5, this, "ptr", crmLogRec, "int*", &pfForget := 0, "HRESULT")
        return pfForget
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-endprepare
     */
    EndPrepare() {
        result := ComCall(6, this, "int*", &pfOkToPrepare := 0, "HRESULT")
        return pfOkToPrepare
    }

    /**
     * 
     * @param {BOOL} fRecovery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-begincommit
     */
    BeginCommit(fRecovery) {
        result := ComCall(7, this, "int", fRecovery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {CrmLogRecordRead} crmLogRec 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-commitrecord
     */
    CommitRecord(crmLogRec) {
        result := ComCall(8, this, "ptr", crmLogRec, "int*", &pfForget := 0, "HRESULT")
        return pfForget
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-endcommit
     */
    EndCommit() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fRecovery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-beginabort
     */
    BeginAbort(fRecovery) {
        result := ComCall(10, this, "int", fRecovery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {CrmLogRecordRead} crmLogRec 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-abortrecord
     */
    AbortRecord(crmLogRec) {
        result := ComCall(11, this, "ptr", crmLogRec, "int*", &pfForget := 0, "HRESULT")
        return pfForget
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmcompensator-endabort
     */
    EndAbort() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
