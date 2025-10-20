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
     * 
     * @param {Pointer<ICrmLogControl>} pLogControl 
     * @returns {HRESULT} 
     */
    SetLogControlVariants(pLogControl) {
        result := ComCall(3, this, "ptr", pLogControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginPrepareVariants() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @param {Pointer<VARIANT_BOOL>} pbForget 
     * @returns {HRESULT} 
     */
    PrepareRecordVariants(pLogRecord, pbForget) {
        result := ComCall(5, this, "ptr", pLogRecord, "ptr", pbForget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbOkToPrepare 
     * @returns {HRESULT} 
     */
    EndPrepareVariants(pbOkToPrepare) {
        result := ComCall(6, this, "ptr", pbOkToPrepare, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRecovery 
     * @returns {HRESULT} 
     */
    BeginCommitVariants(bRecovery) {
        result := ComCall(7, this, "short", bRecovery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @param {Pointer<VARIANT_BOOL>} pbForget 
     * @returns {HRESULT} 
     */
    CommitRecordVariants(pLogRecord, pbForget) {
        result := ComCall(8, this, "ptr", pLogRecord, "ptr", pbForget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndCommitVariants() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRecovery 
     * @returns {HRESULT} 
     */
    BeginAbortVariants(bRecovery) {
        result := ComCall(10, this, "short", bRecovery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @param {Pointer<VARIANT_BOOL>} pbForget 
     * @returns {HRESULT} 
     */
    AbortRecordVariants(pLogRecord, pbForget) {
        result := ComCall(11, this, "ptr", pLogRecord, "ptr", pbForget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndAbortVariants() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
