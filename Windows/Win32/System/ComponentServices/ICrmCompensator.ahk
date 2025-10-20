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
     * 
     * @param {Pointer<ICrmLogControl>} pLogControl 
     * @returns {HRESULT} 
     */
    SetLogControl(pLogControl) {
        result := ComCall(3, this, "ptr", pLogControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginPrepare() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {CrmLogRecordRead} crmLogRec 
     * @param {Pointer<BOOL>} pfForget 
     * @returns {HRESULT} 
     */
    PrepareRecord(crmLogRec, pfForget) {
        result := ComCall(5, this, "ptr", crmLogRec, "ptr", pfForget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfOkToPrepare 
     * @returns {HRESULT} 
     */
    EndPrepare(pfOkToPrepare) {
        result := ComCall(6, this, "ptr", pfOkToPrepare, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fRecovery 
     * @returns {HRESULT} 
     */
    BeginCommit(fRecovery) {
        result := ComCall(7, this, "int", fRecovery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {CrmLogRecordRead} crmLogRec 
     * @param {Pointer<BOOL>} pfForget 
     * @returns {HRESULT} 
     */
    CommitRecord(crmLogRec, pfForget) {
        result := ComCall(8, this, "ptr", crmLogRec, "ptr", pfForget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndCommit() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fRecovery 
     * @returns {HRESULT} 
     */
    BeginAbort(fRecovery) {
        result := ComCall(10, this, "int", fRecovery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {CrmLogRecordRead} crmLogRec 
     * @param {Pointer<BOOL>} pfForget 
     * @returns {HRESULT} 
     */
    AbortRecord(crmLogRec, pfForget) {
        result := ComCall(11, this, "ptr", crmLogRec, "ptr", pfForget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndAbort() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
