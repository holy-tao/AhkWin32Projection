#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\LIFE_TIME.ahk
#Include ..\..\Foundation\FILETIME.ahk
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
     * The Initialize method passes in attributes to the Helper Class Extension from the hypothesis. The helper class should store these parameters for use in the main diagnostics functions. This method must be called before any diagnostics function.
     * @param {Integer} celt A pointer to a count of elements in <b>HELPER_ATTRIBUTE</b> array.
     * @param {Pointer<HELPER_ATTRIBUTE>} rgAttributes A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-helper_attribute">HELPER_ATTRIBUTE</a> array.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-initialize
     */
    Initialize(celt, rgAttributes) {
        result := ComCall(3, this, "uint", celt, "ptr", rgAttributes, "HRESULT")
        return result
    }

    /**
     * Enables the Helper Class Extension instance to provide an estimate.
     * @returns {Pointer<DiagnosticsInfo>} A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-diagnosticsinfo">DiagnosticsInfo</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-getdiagnosticsinfo
     */
    GetDiagnosticsInfo() {
        result := ComCall(4, this, "ptr*", &ppInfo := 0, "HRESULT")
        return ppInfo
    }

    /**
     * Retrieves the key attributes of the Helper Class Extension.
     * @param {Pointer<Integer>} pcelt A pointer to a count of elements in the <b>HELPER_ATTRIBUTE</b> array.
     * @param {Pointer<Pointer<HELPER_ATTRIBUTE>>} pprgAttributes A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-helper_attribute">HELPER_ATTRIBUTE</a> structures.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-getkeyattributes
     */
    GetKeyAttributes(pcelt, pprgAttributes) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgAttributesMarshal := pprgAttributes is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pceltMarshal, pcelt, pprgAttributesMarshal, pprgAttributes, "HRESULT")
        return result
    }

    /**
     * Check whether the component being diagnosed is healthy.
     * @param {PWSTR} pwszInstanceDescription A pointer to a null-terminated string containing the user-friendly description of the information being diagnosed.  For example, if a class were to diagnosis a connectivity issue with an IP address, the <i>pwszInstanceDescription</i> parameter would contain the host name.
     * @param {Pointer<PWSTR>} ppwszDescription A pointer to a null-terminated string containing the description of the issue found if the component is found to be unhealthy.
     * @param {Pointer<Integer>} pDeferredTime A pointer to the time, in seconds, to be deferred if the diagnosis cannot be started immediately.  This is used when the <i>pStatus</i> parameter is set to <b>DS_DEFERRED</b>.
     * @param {Pointer<Integer>} pStatus A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-diagnosis_status">DIAGNOSIS_STATUS</a> that is returned from the diagnosis.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-lowhealth
     */
    LowHealth(pwszInstanceDescription, ppwszDescription, pDeferredTime, pStatus) {
        pwszInstanceDescription := pwszInstanceDescription is String ? StrPtr(pwszInstanceDescription) : pwszInstanceDescription

        ppwszDescriptionMarshal := ppwszDescription is VarRef ? "ptr*" : "ptr"
        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pwszInstanceDescription, ppwszDescriptionMarshal, ppwszDescription, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * Check whether the corresponding component is highly utilized.
     * @param {PWSTR} pwszInstanceDescription A pointer to a null-terminated string containing the user-friendly description of the information being diagnosed.  For example, if a class were to diagnosis a connectivity issue with an IP address, the <i>pwszInstanceDescription</i> parameter would contain the host name.
     * @param {Pointer<PWSTR>} ppwszDescription A pointer to a null-terminated string containing the description of high utilization diagnosis result.
     * @param {Pointer<Integer>} pDeferredTime A pointer to the time, in seconds, to be deferred if the diagnosis cannot be started immediately. This is used when the <i>pStatus</i> parameter is set to <b>DS_DEFERRED</b>.
     * @param {Pointer<Integer>} pStatus A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-diagnosis_status">DIAGNOSIS_STATUS</a> that is returned from the diagnosis.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-highutilization
     */
    HighUtilization(pwszInstanceDescription, ppwszDescription, pDeferredTime, pStatus) {
        pwszInstanceDescription := pwszInstanceDescription is String ? StrPtr(pwszInstanceDescription) : pwszInstanceDescription

        ppwszDescriptionMarshal := ppwszDescription is VarRef ? "ptr*" : "ptr"
        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pwszInstanceDescription, ppwszDescriptionMarshal, ppwszDescription, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * Generate hypotheses for possible causes of low health in the local components.
     * @param {Pointer<Integer>} pcelt A pointer to a count of elements in the <b>HYPOTHESIS</b> array.
     * @param {Pointer<Pointer<HYPOTHESIS>>} pprgHypotheses A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-hypothesis">HYPOTHESIS</a> array.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-getlowerhypotheses
     */
    GetLowerHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * Asks the Helper Class Extension to generate hypotheses.
     * @param {Pointer<Integer>} pcelt A pointer to a count of elements in the HYPOTHESIS array.
     * @param {Pointer<Pointer<HYPOTHESIS>>} pprgHypotheses A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-hypothesis">HYPOTHESIS</a> structures.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-getdownstreamhypotheses
     */
    GetDownStreamHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * Generate hypotheses for possible causes of high utilization.
     * @param {Pointer<Integer>} pcelt A pointer to a count of elements in the HYPOTHESIS array.
     * @param {Pointer<Pointer<HYPOTHESIS>>} pprgHypotheses A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-hypothesis">HYPOTHESIS</a> structures.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-gethigherhypotheses
     */
    GetHigherHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * Generate hypotheses for possible causes of high utilization in the upstream network components.
     * @param {Pointer<Integer>} pcelt A pointer to a count of elements in the <b>HYPOTHESIS</b> array.
     * @param {Pointer<Pointer<HYPOTHESIS>>} pprgHypotheses A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-hypothesis">HYPOTHESIS</a> array.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-getupstreamhypotheses
     */
    GetUpStreamHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * Performs a repair specified by the input parameter.
     * @param {Pointer<RepairInfo>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-repairinfo">RepairInfo</a> structure.
     * @param {Pointer<Integer>} pDeferredTime A pointer to the time, in seconds, to be deferred if the repair cannot be started immediately. This is only valid when the pStatus parameter is set to <b>DS_DEFERRED</b>.
     * @param {Pointer<Integer>} pStatus A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-repair_status">REPAIR_STATUS</a> that is returned from the repair.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-repair
     */
    Repair(pInfo, pDeferredTime, pStatus) {
        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", pInfo, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * Called by NDF after a repair is successfully completed.
     * @param {Integer} problem The <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-problem_type">PROBLEM_TYPE</a> that the helper class has previously diagnosed.
     * @param {Pointer<Integer>} pDeferredTime A pointer to the time to be deferred, in seconds, if the diagnosis cannot be started immediately. This is used only when the pStatus member is set to <b>DS_DEFERRED</b>.
     * @param {Pointer<Integer>} pStatus A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-diagnosis_status">DIAGNOSIS_STATUS</a> that is returned from the diagnosis.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-validate
     */
    Validate(problem, pDeferredTime, pStatus) {
        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "int", problem, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * Retrieves the repair information that the Helper Class Extension has for a given problem type.
     * @param {Integer} problem A <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-problem_type">PROBLEM_TYPE</a> value that specifies the problem type that the helper class has previously diagnosed.
     * @param {Pointer<Integer>} pcelt A pointer to a count of elements in the <b>RepairInfo</b> array.
     * @param {Pointer<Pointer<RepairInfo>>} ppInfo A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-repairinfo">RepairInfo</a> structures.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-getrepairinfo
     */
    GetRepairInfo(problem, pcelt, ppInfo) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "int", problem, pceltMarshal, pcelt, ppInfoMarshal, ppInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves the lifetime of the Helper Class Extension instance.
     * @returns {LIFE_TIME} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-life_time">LIFE_TIME</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-getlifetime
     */
    GetLifeTime() {
        pLifeTime := LIFE_TIME()
        result := ComCall(15, this, "ptr", pLifeTime, "HRESULT")
        return pLifeTime
    }

    /**
     * The Helper Class Extension can limit its diagnosis to events within that time period.
     * @param {LIFE_TIME} lifeTime A <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-life_time">LIFE_TIME</a> structure.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-setlifetime
     */
    SetLifeTime(lifeTime) {
        result := ComCall(16, this, "ptr", lifeTime, "HRESULT")
        return result
    }

    /**
     * Specifies the time when cached results of a diagnosis and repair operation have expired.
     * @returns {FILETIME} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-getcachetime
     */
    GetCacheTime() {
        pCacheTime := FILETIME()
        result := ComCall(17, this, "ptr", pCacheTime, "HRESULT")
        return pCacheTime
    }

    /**
     * Retrieves additional information about a problem that the helper class extension has diagnosed.
     * @param {Pointer<Integer>} pcelt A pointer to a count of elements in the <b>HELPER_ATTRIBUTE</b> array.
     * @param {Pointer<Pointer<HELPER_ATTRIBUTE>>} pprgAttributes A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-helper_attribute">HELPER_ATTRIBUTE</a> structures.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This optional method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-getattributes
     */
    GetAttributes(pcelt, pprgAttributes) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgAttributesMarshal := pprgAttributes is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, pceltMarshal, pcelt, pprgAttributesMarshal, pprgAttributes, "HRESULT")
        return result
    }

    /**
     * Cancels an ongoing diagnosis or repair.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-cancel
     */
    Cancel() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Allows the Helper Class Extension to clean up resources following a diagnosis or repair operation.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnosis or repair operation has been canceled.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the failures encountered in the function.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelper-cleanup
     */
    Cleanup() {
        result := ComCall(20, this, "HRESULT")
        return result
    }
}
