#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Can be used to define an extension for a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509extension
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509Extension extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509Extension
     * @type {Guid}
     */
    static IID => Guid("{728ab30d-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_ObjectId", "get_RawData", "get_Critical", "put_Critical"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IObjectId} pObjectId 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
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
    Initialize(pObjectId, Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(7, this, "ptr", pObjectId, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extension-get_objectid
     */
    get_ObjectId() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extension-get_rawdata
     */
    get_RawData(Encoding) {
        pValue := BSTR()
        result := ComCall(9, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extension-get_critical
     */
    get_Critical() {
        result := ComCall(10, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extension-put_critical
     */
    put_Critical(Value) {
        result := ComCall(11, this, "short", Value, "HRESULT")
        return result
    }
}
