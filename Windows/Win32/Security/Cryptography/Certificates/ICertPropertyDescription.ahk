#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertProperty.ahk

/**
 * Enables you to specify and retrieve a string that contains descriptive information for a certificate.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertpropertydescription
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyDescription extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyDescription
     * @type {Guid}
     */
    static IID => Guid("{728ab331-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Description"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {BSTR} strDescription 
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
    Initialize(strDescription) {
        strDescription := strDescription is String ? BSTR.Alloc(strDescription).Value : strDescription

        result := ComCall(14, this, "ptr", strDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertydescription-get_description
     */
    get_Description(pValue) {
        result := ComCall(15, this, "ptr", pValue, "HRESULT")
        return result
    }
}
