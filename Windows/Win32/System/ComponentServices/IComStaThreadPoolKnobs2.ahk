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
     * @returns {Integer} 
     */
    GetMaxCPULoad() {
        result := ComCall(14, this, "uint*", &pdwLoad := 0, "HRESULT")
        return pdwLoad
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
     * @returns {BOOL} 
     */
    GetCPUMetricEnabled() {
        result := ComCall(16, this, "int*", &pbMetricEnabled := 0, "HRESULT")
        return pbMetricEnabled
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
     * @returns {BOOL} 
     */
    GetCreateThreadsAggressively() {
        result := ComCall(18, this, "int*", &pbMetricEnabled := 0, "HRESULT")
        return pbMetricEnabled
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
     * @returns {Integer} 
     */
    GetMaxCSR() {
        result := ComCall(20, this, "uint*", &pdwCSR := 0, "HRESULT")
        return pdwCSR
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
     * @returns {Integer} 
     */
    GetWaitTimeForThreadCleanup() {
        result := ComCall(22, this, "uint*", &pdwThreadCleanupWaitTime := 0, "HRESULT")
        return pdwThreadCleanupWaitTime
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
