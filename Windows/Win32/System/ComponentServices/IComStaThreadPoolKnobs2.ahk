#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IComStaThreadPoolKnobs.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComStaThreadPoolKnobs2 extends IComStaThreadPoolKnobs{
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
     * 
     * @param {Pointer<UInt32>} pdwLoad 
     * @returns {HRESULT} 
     */
    GetMaxCPULoad(pdwLoad) {
        result := ComCall(14, this, "uint*", pdwLoad, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pdwLoad 
     * @returns {HRESULT} 
     */
    SetMaxCPULoad(pdwLoad) {
        result := ComCall(15, this, "int", pdwLoad, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbMetricEnabled 
     * @returns {HRESULT} 
     */
    GetCPUMetricEnabled(pbMetricEnabled) {
        result := ComCall(16, this, "ptr", pbMetricEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bMetricEnabled 
     * @returns {HRESULT} 
     */
    SetCPUMetricEnabled(bMetricEnabled) {
        result := ComCall(17, this, "int", bMetricEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbMetricEnabled 
     * @returns {HRESULT} 
     */
    GetCreateThreadsAggressively(pbMetricEnabled) {
        result := ComCall(18, this, "ptr", pbMetricEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bMetricEnabled 
     * @returns {HRESULT} 
     */
    SetCreateThreadsAggressively(bMetricEnabled) {
        result := ComCall(19, this, "int", bMetricEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCSR 
     * @returns {HRESULT} 
     */
    GetMaxCSR(pdwCSR) {
        result := ComCall(20, this, "uint*", pdwCSR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCSR 
     * @returns {HRESULT} 
     */
    SetMaxCSR(dwCSR) {
        result := ComCall(21, this, "int", dwCSR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwThreadCleanupWaitTime 
     * @returns {HRESULT} 
     */
    GetWaitTimeForThreadCleanup(pdwThreadCleanupWaitTime) {
        result := ComCall(22, this, "uint*", pdwThreadCleanupWaitTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwThreadCleanupWaitTime 
     * @returns {HRESULT} 
     */
    SetWaitTimeForThreadCleanup(dwThreadCleanupWaitTime) {
        result := ComCall(23, this, "int", dwThreadCleanupWaitTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
