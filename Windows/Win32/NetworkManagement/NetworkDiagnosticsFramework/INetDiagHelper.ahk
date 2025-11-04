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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetDiagnosticsInfo", "GetKeyAttributes", "LowHealth", "HighUtilization", "GetLowerHypotheses", "GetDownStreamHypotheses", "GetHigherHypotheses", "GetUpStreamHypotheses", "Repair", "Validate", "GetRepairInfo", "GetLifeTime", "SetLifeTime", "GetCacheTime", "GetAttributes", "Cancel", "Cleanup"]

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
        result := ComCall(3, this, "uint", celt, "ptr", rgAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<DiagnosticsInfo>>} ppInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getdiagnosticsinfo
     */
    GetDiagnosticsInfo(ppInfo) {
        ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppInfoMarshal, ppInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<HELPER_ATTRIBUTE>>} pprgAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getkeyattributes
     */
    GetKeyAttributes(pcelt, pprgAttributes) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgAttributesMarshal := pprgAttributes is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pceltMarshal, pcelt, pprgAttributesMarshal, pprgAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInstanceDescription 
     * @param {Pointer<PWSTR>} ppwszDescription 
     * @param {Pointer<Integer>} pDeferredTime 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-lowhealth
     */
    LowHealth(pwszInstanceDescription, ppwszDescription, pDeferredTime, pStatus) {
        pwszInstanceDescription := pwszInstanceDescription is String ? StrPtr(pwszInstanceDescription) : pwszInstanceDescription

        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pwszInstanceDescription, "ptr", ppwszDescription, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInstanceDescription 
     * @param {Pointer<PWSTR>} ppwszDescription 
     * @param {Pointer<Integer>} pDeferredTime 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-highutilization
     */
    HighUtilization(pwszInstanceDescription, ppwszDescription, pDeferredTime, pStatus) {
        pwszInstanceDescription := pwszInstanceDescription is String ? StrPtr(pwszInstanceDescription) : pwszInstanceDescription

        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pwszInstanceDescription, "ptr", ppwszDescription, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<HYPOTHESIS>>} pprgHypotheses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getlowerhypotheses
     */
    GetLowerHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<HYPOTHESIS>>} pprgHypotheses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getdownstreamhypotheses
     */
    GetDownStreamHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<HYPOTHESIS>>} pprgHypotheses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-gethigherhypotheses
     */
    GetHigherHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<HYPOTHESIS>>} pprgHypotheses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getupstreamhypotheses
     */
    GetUpStreamHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RepairInfo>} pInfo 
     * @param {Pointer<Integer>} pDeferredTime 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-repair
     */
    Repair(pInfo, pDeferredTime, pStatus) {
        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", pInfo, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} problem 
     * @param {Pointer<Integer>} pDeferredTime 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-validate
     */
    Validate(problem, pDeferredTime, pStatus) {
        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "int", problem, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} problem 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<RepairInfo>>} ppInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getrepairinfo
     */
    GetRepairInfo(problem, pcelt, ppInfo) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "int", problem, pceltMarshal, pcelt, ppInfoMarshal, ppInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LIFE_TIME>} pLifeTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getlifetime
     */
    GetLifeTime(pLifeTime) {
        result := ComCall(15, this, "ptr", pLifeTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {LIFE_TIME} lifeTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-setlifetime
     */
    SetLifeTime(lifeTime) {
        result := ComCall(16, this, "ptr", lifeTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pCacheTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getcachetime
     */
    GetCacheTime(pCacheTime) {
        result := ComCall(17, this, "ptr", pCacheTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<HELPER_ATTRIBUTE>>} pprgAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getattributes
     */
    GetAttributes(pcelt, pprgAttributes) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgAttributesMarshal := pprgAttributes is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, pceltMarshal, pcelt, pprgAttributesMarshal, pprgAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-cancel
     */
    Cancel() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-cleanup
     */
    Cleanup() {
        result := ComCall(20, this, "HRESULT")
        return result
    }
}
