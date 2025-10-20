#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INetDiagHelper interface provides methods that capture and provide information associated with diagnoses and resolution of network-related issues.
 * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nn-ndhelper-inetdiaghelper
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class INetDiagHelper extends IUnknown{
    /**
     * The interface identifier for INetDiagHelper
     * @type {Guid}
     */
    static IID => Guid("{c0b35746-ebf5-11d8-bbe9-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} celt 
     * @param {Pointer<HELPER_ATTRIBUTE>} rgAttributes 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(celt, rgAttributes) {
        result := ComCall(3, this, "uint", celt, "ptr", rgAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DiagnosticsInfo>} ppInfo 
     * @returns {HRESULT} 
     */
    GetDiagnosticsInfo(ppInfo) {
        result := ComCall(4, this, "ptr", ppInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @param {Pointer<HELPER_ATTRIBUTE>} pprgAttributes 
     * @returns {HRESULT} 
     */
    GetKeyAttributes(pcelt, pprgAttributes) {
        result := ComCall(5, this, "uint*", pcelt, "ptr", pprgAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInstanceDescription 
     * @param {Pointer<PWSTR>} ppwszDescription 
     * @param {Pointer<Int32>} pDeferredTime 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    LowHealth(pwszInstanceDescription, ppwszDescription, pDeferredTime, pStatus) {
        pwszInstanceDescription := pwszInstanceDescription is String ? StrPtr(pwszInstanceDescription) : pwszInstanceDescription

        result := ComCall(6, this, "ptr", pwszInstanceDescription, "ptr", ppwszDescription, "int*", pDeferredTime, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInstanceDescription 
     * @param {Pointer<PWSTR>} ppwszDescription 
     * @param {Pointer<Int32>} pDeferredTime 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    HighUtilization(pwszInstanceDescription, ppwszDescription, pDeferredTime, pStatus) {
        pwszInstanceDescription := pwszInstanceDescription is String ? StrPtr(pwszInstanceDescription) : pwszInstanceDescription

        result := ComCall(7, this, "ptr", pwszInstanceDescription, "ptr", ppwszDescription, "int*", pDeferredTime, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @param {Pointer<HYPOTHESIS>} pprgHypotheses 
     * @returns {HRESULT} 
     */
    GetLowerHypotheses(pcelt, pprgHypotheses) {
        result := ComCall(8, this, "uint*", pcelt, "ptr", pprgHypotheses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @param {Pointer<HYPOTHESIS>} pprgHypotheses 
     * @returns {HRESULT} 
     */
    GetDownStreamHypotheses(pcelt, pprgHypotheses) {
        result := ComCall(9, this, "uint*", pcelt, "ptr", pprgHypotheses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @param {Pointer<HYPOTHESIS>} pprgHypotheses 
     * @returns {HRESULT} 
     */
    GetHigherHypotheses(pcelt, pprgHypotheses) {
        result := ComCall(10, this, "uint*", pcelt, "ptr", pprgHypotheses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @param {Pointer<HYPOTHESIS>} pprgHypotheses 
     * @returns {HRESULT} 
     */
    GetUpStreamHypotheses(pcelt, pprgHypotheses) {
        result := ComCall(11, this, "uint*", pcelt, "ptr", pprgHypotheses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RepairInfo>} pInfo 
     * @param {Pointer<Int32>} pDeferredTime 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    Repair(pInfo, pDeferredTime, pStatus) {
        result := ComCall(12, this, "ptr", pInfo, "int*", pDeferredTime, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} problem 
     * @param {Pointer<Int32>} pDeferredTime 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    Validate(problem, pDeferredTime, pStatus) {
        result := ComCall(13, this, "int", problem, "int*", pDeferredTime, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} problem 
     * @param {Pointer<UInt32>} pcelt 
     * @param {Pointer<RepairInfo>} ppInfo 
     * @returns {HRESULT} 
     */
    GetRepairInfo(problem, pcelt, ppInfo) {
        result := ComCall(14, this, "int", problem, "uint*", pcelt, "ptr", ppInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LIFE_TIME>} pLifeTime 
     * @returns {HRESULT} 
     */
    GetLifeTime(pLifeTime) {
        result := ComCall(15, this, "ptr", pLifeTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {LIFE_TIME} lifeTime 
     * @returns {HRESULT} 
     */
    SetLifeTime(lifeTime) {
        result := ComCall(16, this, "ptr", lifeTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pCacheTime 
     * @returns {HRESULT} 
     */
    GetCacheTime(pCacheTime) {
        result := ComCall(17, this, "ptr", pCacheTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @param {Pointer<HELPER_ATTRIBUTE>} pprgAttributes 
     * @returns {HRESULT} 
     */
    GetAttributes(pcelt, pprgAttributes) {
        result := ComCall(18, this, "uint*", pcelt, "ptr", pprgAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cleanup() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
