#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509PolicyServerUrl interface can be used to set or retrieve property values associated with the certificate enrollment policy (CEP) server and to update associated registry values.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509policyserverurl
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509PolicyServerUrl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509PolicyServerUrl
     * @type {Guid}
     */
    static IID => Guid("{884e204a-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Url", "put_Url", "get_Default", "put_Default", "get_Flags", "put_Flags", "get_AuthFlags", "put_AuthFlags", "get_Cost", "put_Cost", "GetStringProperty", "SetStringProperty", "UpdateRegistry", "RemoveFromRegistry"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} context 
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
    Initialize(context) {
        result := ComCall(7, this, "int", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_url
     */
    get_Url(ppValue) {
        result := ComCall(8, this, "ptr", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_url
     */
    put_Url(pValue) {
        pValue := pValue is String ? BSTR.Alloc(pValue).Value : pValue

        result := ComCall(9, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_default
     */
    get_Default(pValue) {
        result := ComCall(10, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_default
     */
    put_Default(value) {
        result := ComCall(11, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_flags
     */
    get_Flags(pValue) {
        result := ComCall(12, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_flags
     */
    put_Flags(Flags) {
        result := ComCall(13, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_authflags
     */
    get_AuthFlags(pValue) {
        result := ComCall(14, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_authflags
     */
    put_AuthFlags(Flags) {
        result := ComCall(15, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_cost
     */
    get_Cost(pValue) {
        result := ComCall(16, this, "uint*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_cost
     */
    put_Cost(value) {
        result := ComCall(17, this, "uint", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<BSTR>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-getstringproperty
     */
    GetStringProperty(propertyId, ppValue) {
        result := ComCall(18, this, "int", propertyId, "ptr", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {BSTR} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-setstringproperty
     */
    SetStringProperty(propertyId, pValue) {
        pValue := pValue is String ? BSTR.Alloc(pValue).Value : pValue

        result := ComCall(19, this, "int", propertyId, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-updateregistry
     */
    UpdateRegistry(context) {
        result := ComCall(20, this, "int", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-removefromregistry
     */
    RemoveFromRegistry(context) {
        result := ComCall(21, this, "int", context, "HRESULT")
        return result
    }
}
