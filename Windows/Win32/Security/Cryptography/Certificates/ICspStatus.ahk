#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICspAlgorithm.ahk
#Include .\ICspInformation.ahk
#Include .\IX509EnrollmentStatus.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Contains information about a cryptographic provider/algorithm pair.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icspstatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICspStatus extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICspStatus
     * @type {Guid}
     */
    static IID => Guid("{728ab309-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Ordinal", "put_Ordinal", "get_CspAlgorithm", "get_CspInformation", "get_EnrollmentStatus", "get_DisplayName"]

    /**
     * @type {Integer} 
     */
    Ordinal {
        get => this.get_Ordinal()
        set => this.put_Ordinal(value)
    }

    /**
     * @type {ICspAlgorithm} 
     */
    CspAlgorithm {
        get => this.get_CspAlgorithm()
    }

    /**
     * @type {ICspInformation} 
     */
    CspInformation {
        get => this.get_CspInformation()
    }

    /**
     * @type {IX509EnrollmentStatus} 
     */
    EnrollmentStatus {
        get => this.get_EnrollmentStatus()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {ICspInformation} pCsp 
     * @param {ICspAlgorithm} pAlgorithm 
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
    Initialize(pCsp, pAlgorithm) {
        result := ComCall(7, this, "ptr", pCsp, "ptr", pAlgorithm, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatus-get_ordinal
     */
    get_Ordinal() {
        result := ComCall(8, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatus-put_ordinal
     */
    put_Ordinal(Value) {
        result := ComCall(9, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ICspAlgorithm} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatus-get_cspalgorithm
     */
    get_CspAlgorithm() {
        result := ComCall(10, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspAlgorithm(ppValue)
    }

    /**
     * 
     * @returns {ICspInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatus-get_cspinformation
     */
    get_CspInformation() {
        result := ComCall(11, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspInformation(ppValue)
    }

    /**
     * 
     * @returns {IX509EnrollmentStatus} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatus-get_enrollmentstatus
     */
    get_EnrollmentStatus() {
        result := ComCall(12, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509EnrollmentStatus(ppValue)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatus-get_displayname
     */
    get_DisplayName() {
        pValue := BSTR()
        result := ComCall(13, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
