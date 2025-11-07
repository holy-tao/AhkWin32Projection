#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumAddress.ahk
#Include .\IEnumCallHub.ahk
#Include ..\..\System\Com\IEnumUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTAPI interface is the base interface for the TAPI object. The TAPI object is created by CoCreateInstance. For information on CoCreateInstance, see documentation on COM. All other TAPI 3 objects are created by TAPI 3 itself.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittapi
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPI extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTAPI
     * @type {Guid}
     */
    static IID => Guid("{b1efc382-9355-11d0-835c-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Shutdown", "get_Addresses", "EnumerateAddresses", "RegisterCallNotifications", "UnregisterNotifications", "get_CallHubs", "EnumerateCallHubs", "SetCallHubTracking", "EnumeratePrivateTAPIObjects", "get_PrivateTAPIObjects", "RegisterRequestRecipient", "SetAssistedTelephonyPriority", "SetApplicationPriority", "put_EventFilter", "get_EventFilter"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
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
    Initialize() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-shutdown
     */
    Shutdown() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-get_addresses
     */
    get_Addresses() {
        pVariant := VARIANT()
        result := ComCall(9, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @returns {IEnumAddress} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-enumerateaddresses
     */
    EnumerateAddresses() {
        result := ComCall(10, this, "ptr*", &ppEnumAddress := 0, "HRESULT")
        return IEnumAddress(ppEnumAddress)
    }

    /**
     * 
     * @param {ITAddress} pAddress 
     * @param {VARIANT_BOOL} fMonitor 
     * @param {VARIANT_BOOL} fOwner 
     * @param {Integer} lMediaTypes 
     * @param {Integer} lCallbackInstance 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications
     */
    RegisterCallNotifications(pAddress, fMonitor, fOwner, lMediaTypes, lCallbackInstance) {
        result := ComCall(11, this, "ptr", pAddress, "short", fMonitor, "short", fOwner, "int", lMediaTypes, "int", lCallbackInstance, "int*", &plRegister := 0, "HRESULT")
        return plRegister
    }

    /**
     * 
     * @param {Integer} lRegister 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-unregisternotifications
     */
    UnregisterNotifications(lRegister) {
        result := ComCall(12, this, "int", lRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-get_callhubs
     */
    get_CallHubs() {
        pVariant := VARIANT()
        result := ComCall(13, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @returns {IEnumCallHub} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-enumeratecallhubs
     */
    EnumerateCallHubs() {
        result := ComCall(14, this, "ptr*", &ppEnumCallHub := 0, "HRESULT")
        return IEnumCallHub(ppEnumCallHub)
    }

    /**
     * 
     * @param {VARIANT} pAddresses 
     * @param {VARIANT_BOOL} bTracking 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-setcallhubtracking
     */
    SetCallHubTracking(pAddresses, bTracking) {
        result := ComCall(15, this, "ptr", pAddresses, "short", bTracking, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-enumerateprivatetapiobjects
     */
    EnumeratePrivateTAPIObjects() {
        result := ComCall(16, this, "ptr*", &ppEnumUnknown := 0, "HRESULT")
        return IEnumUnknown(ppEnumUnknown)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-get_privatetapiobjects
     */
    get_PrivateTAPIObjects() {
        pVariant := VARIANT()
        result := ComCall(17, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @param {Integer} lRegistrationInstance 
     * @param {Integer} lRequestMode 
     * @param {VARIANT_BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-registerrequestrecipient
     */
    RegisterRequestRecipient(lRegistrationInstance, lRequestMode, fEnable) {
        result := ComCall(18, this, "int", lRegistrationInstance, "int", lRequestMode, "short", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pAppFilename 
     * @param {VARIANT_BOOL} fPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-setassistedtelephonypriority
     */
    SetAssistedTelephonyPriority(pAppFilename, fPriority) {
        pAppFilename := pAppFilename is String ? BSTR.Alloc(pAppFilename).Value : pAppFilename

        result := ComCall(19, this, "ptr", pAppFilename, "short", fPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pAppFilename 
     * @param {Integer} lMediaType 
     * @param {VARIANT_BOOL} fPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-setapplicationpriority
     */
    SetApplicationPriority(pAppFilename, lMediaType, fPriority) {
        pAppFilename := pAppFilename is String ? BSTR.Alloc(pAppFilename).Value : pAppFilename

        result := ComCall(20, this, "ptr", pAppFilename, "int", lMediaType, "short", fPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFilterMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-put_eventfilter
     */
    put_EventFilter(lFilterMask) {
        result := ComCall(21, this, "int", lFilterMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi-get_eventfilter
     */
    get_EventFilter() {
        result := ComCall(22, this, "int*", &plFilterMask := 0, "HRESULT")
        return plFilterMask
    }
}
