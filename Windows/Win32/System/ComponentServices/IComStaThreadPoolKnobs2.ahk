#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IComStaThreadPoolKnobs.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComStaThreadPoolKnobs2 extends IComStaThreadPoolKnobs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComStaThreadPoolKnobs2
     * @type {Guid}
     */
    static IID => Guid("{73707523-ff9a-4974-bf84-2108dc213740}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxCPULoad", "SetMaxCPULoad", "GetCPUMetricEnabled", "SetCPUMetricEnabled", "GetCreateThreadsAggressively", "SetCreateThreadsAggressively", "GetMaxCSR", "SetMaxCSR", "GetWaitTimeForThreadCleanup", "SetWaitTimeForThreadCleanup"]

    /**
     * 
     * @param {Pointer<Integer>} pdwLoad 
     * @returns {HRESULT} 
     */
    GetMaxCPULoad(pdwLoad) {
        pdwLoadMarshal := pdwLoad is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pdwLoadMarshal, pdwLoad, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pdwLoad 
     * @returns {HRESULT} 
     */
    SetMaxCPULoad(pdwLoad) {
        result := ComCall(15, this, "int", pdwLoad, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbMetricEnabled 
     * @returns {HRESULT} 
     */
    GetCPUMetricEnabled(pbMetricEnabled) {
        result := ComCall(16, this, "ptr", pbMetricEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bMetricEnabled 
     * @returns {HRESULT} 
     */
    SetCPUMetricEnabled(bMetricEnabled) {
        result := ComCall(17, this, "int", bMetricEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbMetricEnabled 
     * @returns {HRESULT} 
     */
    GetCreateThreadsAggressively(pbMetricEnabled) {
        result := ComCall(18, this, "ptr", pbMetricEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bMetricEnabled 
     * @returns {HRESULT} 
     */
    SetCreateThreadsAggressively(bMetricEnabled) {
        result := ComCall(19, this, "int", bMetricEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCSR 
     * @returns {HRESULT} 
     */
    GetMaxCSR(pdwCSR) {
        pdwCSRMarshal := pdwCSR is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pdwCSRMarshal, pdwCSR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCSR 
     * @returns {HRESULT} 
     */
    SetMaxCSR(dwCSR) {
        result := ComCall(21, this, "int", dwCSR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwThreadCleanupWaitTime 
     * @returns {HRESULT} 
     */
    GetWaitTimeForThreadCleanup(pdwThreadCleanupWaitTime) {
        pdwThreadCleanupWaitTimeMarshal := pdwThreadCleanupWaitTime is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, pdwThreadCleanupWaitTimeMarshal, pdwThreadCleanupWaitTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThreadCleanupWaitTime 
     * @returns {HRESULT} 
     */
    SetWaitTimeForThreadCleanup(dwThreadCleanupWaitTime) {
        result := ComCall(23, this, "int", dwThreadCleanupWaitTime, "HRESULT")
        return result
    }
}
