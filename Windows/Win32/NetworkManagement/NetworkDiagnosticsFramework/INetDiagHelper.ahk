#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\HYPOTHESIS.ahk" { HYPOTHESIS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\REPAIR_STATUS.ahk" { REPAIR_STATUS }
#Import ".\DIAGNOSIS_STATUS.ahk" { DIAGNOSIS_STATUS }
#Import ".\PROBLEM_TYPE.ahk" { PROBLEM_TYPE }
#Import ".\DiagnosticsInfo.ahk" { DiagnosticsInfo }
#Import ".\LIFE_TIME.ahk" { LIFE_TIME }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\HELPER_ATTRIBUTE.ahk" { HELPER_ATTRIBUTE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\RepairInfo.ahk" { RepairInfo }

/**
 * The INetDiagHelper interface provides methods that capture and provide information associated with diagnoses and resolution of network-related issues.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nn-ndhelper-inetdiaghelper
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct INetDiagHelper extends IUnknown {
    /**
     * The interface identifier for INetDiagHelper
     * @type {Guid}
     */
    static IID := Guid("{c0b35746-ebf5-11d8-bbe9-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetDiagHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize              : IntPtr
        GetDiagnosticsInfo      : IntPtr
        GetKeyAttributes        : IntPtr
        LowHealth               : IntPtr
        HighUtilization         : IntPtr
        GetLowerHypotheses      : IntPtr
        GetDownStreamHypotheses : IntPtr
        GetHigherHypotheses     : IntPtr
        GetUpStreamHypotheses   : IntPtr
        Repair                  : IntPtr
        Validate                : IntPtr
        GetRepairInfo           : IntPtr
        GetLifeTime             : IntPtr
        SetLifeTime             : IntPtr
        GetCacheTime            : IntPtr
        GetAttributes           : IntPtr
        Cancel                  : IntPtr
        Cleanup                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetDiagHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Initialize method passes in attributes to the Helper Class Extension from the hypothesis. The helper class should store these parameters for use in the main diagnostics functions. This method must be called before any diagnostics function.
     * @remarks
     * The Initialize method is required when building a Helper Class Extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-initialize
     */
    Initialize(celt, rgAttributes) {
        result := ComCall(3, this, "uint", celt, HELPER_ATTRIBUTE.Ptr, rgAttributes, "HRESULT")
        return result
    }

    /**
     * Enables the Helper Class Extension instance to provide an estimate.
     * @remarks
     * The GetDiagnosticsInfo method is required when building a Helper Class Extension.
     * @returns {Pointer<DiagnosticsInfo>} A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-diagnosticsinfo">DiagnosticsInfo</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getdiagnosticsinfo
     */
    GetDiagnosticsInfo() {
        result := ComCall(4, this, "ptr*", &ppInfo := 0, "HRESULT")
        return ppInfo
    }

    /**
     * Retrieves the key attributes of the Helper Class Extension.
     * @remarks
     * This method is not required when building a Helper Class Extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getkeyattributes
     */
    GetKeyAttributes(pcelt, pprgAttributes) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgAttributesMarshal := pprgAttributes is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pceltMarshal, pcelt, pprgAttributesMarshal, pprgAttributes, "HRESULT")
        return result
    }

    /**
     * Check whether the component being diagnosed is healthy.
     * @remarks
     * The LowHealth method is required when building a Helper Class Extension.
     * 
     * If LowHealth returns <b>DS_CONFIRMED</b>, <i>ppwszDescription</i> will also contain a user-friendly description of the diagnosis result. The out parameter <i>pDeferredTime</i> contains the number of seconds this diagnosis needs to be deferred if pStatus returns <b>DS_DEFERRED</b>.
     * 
     * When LowHealth is confirmed, it may also optionally generate hypotheses in the <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/nf-ndhelper-inetdiaghelper-getlowerhypotheses">GetLowerHypotheses</a> method for other helper classes if the problem may be caused by other components.  If not confirmed, NDF may further diagnose the problem by calling <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/nf-ndhelper-inetdiaghelper-highutilization">HighUtilization</a>.
     * 
     * LowHealth may also return <b>DS_INDETERMINATE</b> if it is unable to diagnose the problem, but cannot confirm that the component is healthy. In this case, NDF will treat it as <b>DS_CONFIRMED</b> if none of the other hypotheses are confirmed.
     * @param {PWSTR} pwszInstanceDescription A pointer to a null-terminated string containing the user-friendly description of the information being diagnosed.  For example, if a class were to diagnosis a connectivity issue with an IP address, the <i>pwszInstanceDescription</i> parameter would contain the host name.
     * @param {Pointer<PWSTR>} ppwszDescription A pointer to a null-terminated string containing the description of the issue found if the component is found to be unhealthy.
     * @param {Pointer<Integer>} pDeferredTime A pointer to the time, in seconds, to be deferred if the diagnosis cannot be started immediately.  This is used when the <i>pStatus</i> parameter is set to <b>DS_DEFERRED</b>.
     * @param {Pointer<DIAGNOSIS_STATUS>} pStatus A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-diagnosis_status">DIAGNOSIS_STATUS</a> that is returned from the diagnosis.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-lowhealth
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
     * @remarks
     * This method is not required when building a Helper Class Extension.
     * @param {PWSTR} pwszInstanceDescription A pointer to a null-terminated string containing the user-friendly description of the information being diagnosed.  For example, if a class were to diagnosis a connectivity issue with an IP address, the <i>pwszInstanceDescription</i> parameter would contain the host name.
     * @param {Pointer<PWSTR>} ppwszDescription A pointer to a null-terminated string containing the description of high utilization diagnosis result.
     * @param {Pointer<Integer>} pDeferredTime A pointer to the time, in seconds, to be deferred if the diagnosis cannot be started immediately. This is used when the <i>pStatus</i> parameter is set to <b>DS_DEFERRED</b>.
     * @param {Pointer<DIAGNOSIS_STATUS>} pStatus A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-diagnosis_status">DIAGNOSIS_STATUS</a> that is returned from the diagnosis.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-highutilization
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
     * @remarks
     * This method is not required when building a Helper Class Extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getlowerhypotheses
     */
    GetLowerHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * Asks the Helper Class Extension to generate hypotheses.
     * @remarks
     * This method is not required when building a Helper Class Extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getdownstreamhypotheses
     */
    GetDownStreamHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * Generate hypotheses for possible causes of high utilization.
     * @remarks
     * This method is not required when building a Helper Class Extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-gethigherhypotheses
     */
    GetHigherHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * Generate hypotheses for possible causes of high utilization in the upstream network components.
     * @remarks
     * This method is not required when building a Helper Class Extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getupstreamhypotheses
     */
    GetUpStreamHypotheses(pcelt, pprgHypotheses) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgHypothesesMarshal := pprgHypotheses is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, pceltMarshal, pcelt, pprgHypothesesMarshal, pprgHypotheses, "HRESULT")
        return result
    }

    /**
     * Performs a repair specified by the input parameter.
     * @remarks
     * This method is not required when building a Helper Class Extension.
     * @param {Pointer<RepairInfo>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-repairinfo">RepairInfo</a> structure.
     * @param {Pointer<Integer>} pDeferredTime A pointer to the time, in seconds, to be deferred if the repair cannot be started immediately. This is only valid when the pStatus parameter is set to <b>DS_DEFERRED</b>.
     * @param {Pointer<REPAIR_STATUS>} pStatus A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-repair_status">REPAIR_STATUS</a> that is returned from the repair.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-repair
     */
    Repair(pInfo, pDeferredTime, pStatus) {
        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, RepairInfo.Ptr, pInfo, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * Called by NDF after a repair is successfully completed.
     * @remarks
     * This method is not required when building a Helper Class Extension.
     * 
     * This method only returns an error code if it encounters failures that impede validation. If necessary, the <i>pStatus</i> parameter is the expected way to communicate that the component is still in low health. <b>DS_REJECTED</b> is used to indicate that the issue has been resolved.
     * @param {PROBLEM_TYPE} problem The <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-problem_type">PROBLEM_TYPE</a> that the helper class has previously diagnosed.
     * @param {Pointer<Integer>} pDeferredTime A pointer to the time to be deferred, in seconds, if the diagnosis cannot be started immediately. This is used only when the pStatus member is set to <b>DS_DEFERRED</b>.
     * @param {Pointer<REPAIR_STATUS>} pStatus A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-diagnosis_status">DIAGNOSIS_STATUS</a> that is returned from the diagnosis.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-validate
     */
    Validate(problem, pDeferredTime, pStatus) {
        pDeferredTimeMarshal := pDeferredTime is VarRef ? "int*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, PROBLEM_TYPE, problem, pDeferredTimeMarshal, pDeferredTime, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * Retrieves the repair information that the Helper Class Extension has for a given problem type.
     * @remarks
     * This method is not required when building a Helper Class Extension.
     * @param {PROBLEM_TYPE} problem A <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-problem_type">PROBLEM_TYPE</a> value that specifies the problem type that the helper class has previously diagnosed.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getrepairinfo
     */
    GetRepairInfo(problem, pcelt, ppInfo) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, PROBLEM_TYPE, problem, pceltMarshal, pcelt, ppInfoMarshal, ppInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves the lifetime of the Helper Class Extension instance.
     * @remarks
     * This method is not required when building a Helper Class Extension.
     * 
     * Lifetime data is used to limit the time scope of a problem instance.  This is particularly useful when doing history-based diagnoses such as tracing and logging where it can be used in scoping down the diagnosis to events that occurred during the specified time interval.
     * 
     * For example, Windows Filtering Platform (WFP) helper classes use lifetime to determine  which filter blocked a packet by checking the trace log. By default, a lifetime of a helper class instance inherits the lifetime of its dependent helper class instance.
     * @returns {LIFE_TIME} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-life_time">LIFE_TIME</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getlifetime
     */
    GetLifeTime() {
        pLifeTime := LIFE_TIME()
        result := ComCall(15, this, LIFE_TIME.Ptr, pLifeTime, "HRESULT")
        return pLifeTime
    }

    /**
     * The Helper Class Extension can limit its diagnosis to events within that time period.
     * @remarks
     * This method is not required when building a Helper Class Extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-setlifetime
     */
    SetLifeTime(lifeTime) {
        result := ComCall(16, this, LIFE_TIME, lifeTime, "HRESULT")
        return result
    }

    /**
     * Specifies the time when cached results of a diagnosis and repair operation have expired.
     * @remarks
     * This method is not required when building a Helper Class Extension.
     * 
     * The default behavior is to return the current time so that the results will not be cached.  Setting a cache time can increase diagnosis efficiency since NDF will not call on the extension to re-diagnose an issue unless the cache time has expired.
     * 
     * The <b>FILETIME</b> structure is a 64-bit value representing the number of 100-nanosecond intervals since January 1, 1601 (UTC).
     * @returns {FILETIME} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getcachetime
     */
    GetCacheTime() {
        pCacheTime := FILETIME()
        result := ComCall(17, this, FILETIME.Ptr, pCacheTime, "HRESULT")
        return pCacheTime
    }

    /**
     * Retrieves additional information about a problem that the helper class extension has diagnosed.
     * @remarks
     * This method is not required when building a Helper Class Extension.
     * 
     * During the process of diagnosis and repair, a helper class may optionally return attributes to NDF that improve NDF's handling of the diagnosis.  The predefined attributes that can be returned to NDF are as follows.
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Term</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="werperameter__Type__AT_UINT32_"></a><a id="werperameter__type__at_uint32_"></a><a id="WERPERAMETER__TYPE__AT_UINT32_"></a> werperameter (Type: AT_UINT32)
     * 
     * </td>
     * <td width="60%">
     * When diagnosis fails, an optional attribute for additional helper class specific Windows Error Reporting (WER) bucketing parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="werfile__Type__AT_STRING_"></a><a id="werfile__type__at_string_"></a><a id="WERFILE__TYPE__AT_STRING_"></a> werfile (Type: AT_STRING)
     * 
     * </td>
     * <td width="60%">
     * An optional attribute for adding helper class-specific files to Windows Error Reporting (WER) reports.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="rootcauseid__Type__AT_GUID_"></a><a id="rootcauseid__type__at_guid_"></a><a id="ROOTCAUSEID__TYPE__AT_GUID_"></a> rootcauseid (Type: AT_GUID)
     * 
     * </td>
     * <td width="60%">
     * Helper Classes can often diagnose more than one problem at once.  Analysis of the problem encountered can be improved in NDF if the extension returns a HelperAttribute of type AT_GUID with the pszName parameter set to rootcauseid and the Guid field set to a GUID identifying the specific problem encountered.  These GUIDs are custom defined by the helper extension.
     * 
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-getattributes
     */
    GetAttributes(pcelt, pprgAttributes) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgAttributesMarshal := pprgAttributes is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, pceltMarshal, pcelt, pprgAttributesMarshal, pprgAttributes, "HRESULT")
        return result
    }

    /**
     * Cancels an ongoing diagnosis or repair.
     * @remarks
     * The <b>Cancel</b> method is required when building a Helper Class Extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-cancel
     */
    Cancel() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Allows the Helper Class Extension to clean up resources following a diagnosis or repair operation.
     * @remarks
     * The <b>Cleanup</b> method is required when building a Helper Class Extension.
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
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelper-cleanup
     */
    Cleanup() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetDiagHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetDiagnosticsInfo := CallbackCreate(GetMethod(implObj, "GetDiagnosticsInfo"), flags, 2)
        this.vtbl.GetKeyAttributes := CallbackCreate(GetMethod(implObj, "GetKeyAttributes"), flags, 3)
        this.vtbl.LowHealth := CallbackCreate(GetMethod(implObj, "LowHealth"), flags, 5)
        this.vtbl.HighUtilization := CallbackCreate(GetMethod(implObj, "HighUtilization"), flags, 5)
        this.vtbl.GetLowerHypotheses := CallbackCreate(GetMethod(implObj, "GetLowerHypotheses"), flags, 3)
        this.vtbl.GetDownStreamHypotheses := CallbackCreate(GetMethod(implObj, "GetDownStreamHypotheses"), flags, 3)
        this.vtbl.GetHigherHypotheses := CallbackCreate(GetMethod(implObj, "GetHigherHypotheses"), flags, 3)
        this.vtbl.GetUpStreamHypotheses := CallbackCreate(GetMethod(implObj, "GetUpStreamHypotheses"), flags, 3)
        this.vtbl.Repair := CallbackCreate(GetMethod(implObj, "Repair"), flags, 4)
        this.vtbl.Validate := CallbackCreate(GetMethod(implObj, "Validate"), flags, 4)
        this.vtbl.GetRepairInfo := CallbackCreate(GetMethod(implObj, "GetRepairInfo"), flags, 4)
        this.vtbl.GetLifeTime := CallbackCreate(GetMethod(implObj, "GetLifeTime"), flags, 2)
        this.vtbl.SetLifeTime := CallbackCreate(GetMethod(implObj, "SetLifeTime"), flags, 2)
        this.vtbl.GetCacheTime := CallbackCreate(GetMethod(implObj, "GetCacheTime"), flags, 2)
        this.vtbl.GetAttributes := CallbackCreate(GetMethod(implObj, "GetAttributes"), flags, 3)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.Cleanup := CallbackCreate(GetMethod(implObj, "Cleanup"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetDiagnosticsInfo)
        CallbackFree(this.vtbl.GetKeyAttributes)
        CallbackFree(this.vtbl.LowHealth)
        CallbackFree(this.vtbl.HighUtilization)
        CallbackFree(this.vtbl.GetLowerHypotheses)
        CallbackFree(this.vtbl.GetDownStreamHypotheses)
        CallbackFree(this.vtbl.GetHigherHypotheses)
        CallbackFree(this.vtbl.GetUpStreamHypotheses)
        CallbackFree(this.vtbl.Repair)
        CallbackFree(this.vtbl.Validate)
        CallbackFree(this.vtbl.GetRepairInfo)
        CallbackFree(this.vtbl.GetLifeTime)
        CallbackFree(this.vtbl.SetLifeTime)
        CallbackFree(this.vtbl.GetCacheTime)
        CallbackFree(this.vtbl.GetAttributes)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.Cleanup)
    }
}
