#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICertProperty.ahk

/**
 * Represents an external certificate property that identifies whether a certificate has been backed up and, if so, the date and time that it was saved.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertpropertybackedup
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyBackedUp extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyBackedUp
     * @type {Guid}
     */
    static IID => Guid("{728ab338-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromCurrentTime", "Initialize", "get_BackedUpValue", "get_BackedUpTime"]

    /**
     * @type {VARIANT_BOOL} 
     */
    BackedUpValue {
        get => this.get_BackedUpValue()
    }

    /**
     * @type {Float} 
     */
    BackedUpTime {
        get => this.get_BackedUpTime()
    }

    /**
     * 
     * @param {VARIANT_BOOL} BackedUpValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertybackedup-initializefromcurrenttime
     */
    InitializeFromCurrentTime(BackedUpValue) {
        result := ComCall(14, this, "short", BackedUpValue, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {VARIANT_BOOL} BackedUpValue 
     * @param {Float} Date 
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
    Initialize(BackedUpValue, Date) {
        result := ComCall(15, this, "short", BackedUpValue, "double", Date, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertybackedup-get_backedupvalue
     */
    get_BackedUpValue() {
        result := ComCall(16, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertybackedup-get_backeduptime
     */
    get_BackedUpTime() {
        result := ComCall(17, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }
}
