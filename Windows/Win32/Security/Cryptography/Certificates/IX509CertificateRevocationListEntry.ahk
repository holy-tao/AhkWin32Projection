#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Extensions.ahk
#Include .\IObjectIds.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRevocationListEntry extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRevocationListEntry
     * @type {Guid}
     */
    static IID => Guid("{728ab35e-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_SerialNumber", "get_RevocationDate", "get_RevocationReason", "put_RevocationReason", "get_X509Extensions", "get_CriticalExtensions"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} Encoding 
     * @param {BSTR} SerialNumber 
     * @param {Float} RevocationDate 
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
    Initialize(Encoding, SerialNumber, RevocationDate) {
        SerialNumber := SerialNumber is String ? BSTR.Alloc(SerialNumber).Value : SerialNumber

        result := ComCall(7, this, "int", Encoding, "ptr", SerialNumber, "double", RevocationDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     */
    get_SerialNumber(Encoding) {
        pValue := BSTR()
        result := ComCall(8, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RevocationDate() {
        result := ComCall(9, this, "double*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RevocationReason() {
        result := ComCall(10, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    put_RevocationReason(Value) {
        result := ComCall(11, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509Extensions} 
     */
    get_X509Extensions() {
        result := ComCall(12, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509Extensions(ppValue)
    }

    /**
     * 
     * @returns {IObjectIds} 
     */
    get_CriticalExtensions() {
        result := ComCall(13, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }
}
