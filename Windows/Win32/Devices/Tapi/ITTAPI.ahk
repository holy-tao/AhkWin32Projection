#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTAPI interface is the base interface for the TAPI object. The TAPI object is created by CoCreateInstance. For information on CoCreateInstance, see documentation on COM. All other TAPI 3 objects are created by TAPI 3 itself.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittapi
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPI extends IDispatch{
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
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_Addresses(pVariant) {
        result := ComCall(9, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumAddress>} ppEnumAddress 
     * @returns {HRESULT} 
     */
    EnumerateAddresses(ppEnumAddress) {
        result := ComCall(10, this, "ptr", ppEnumAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITAddress>} pAddress 
     * @param {VARIANT_BOOL} fMonitor 
     * @param {VARIANT_BOOL} fOwner 
     * @param {Integer} lMediaTypes 
     * @param {Integer} lCallbackInstance 
     * @param {Pointer<Int32>} plRegister 
     * @returns {HRESULT} 
     */
    RegisterCallNotifications(pAddress, fMonitor, fOwner, lMediaTypes, lCallbackInstance, plRegister) {
        result := ComCall(11, this, "ptr", pAddress, "short", fMonitor, "short", fOwner, "int", lMediaTypes, "int", lCallbackInstance, "int*", plRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRegister 
     * @returns {HRESULT} 
     */
    UnregisterNotifications(lRegister) {
        result := ComCall(12, this, "int", lRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_CallHubs(pVariant) {
        result := ComCall(13, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCallHub>} ppEnumCallHub 
     * @returns {HRESULT} 
     */
    EnumerateCallHubs(ppEnumCallHub) {
        result := ComCall(14, this, "ptr", ppEnumCallHub, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} pAddresses 
     * @param {VARIANT_BOOL} bTracking 
     * @returns {HRESULT} 
     */
    SetCallHubTracking(pAddresses, bTracking) {
        result := ComCall(15, this, "ptr", pAddresses, "short", bTracking, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumUnknown>} ppEnumUnknown 
     * @returns {HRESULT} 
     */
    EnumeratePrivateTAPIObjects(ppEnumUnknown) {
        result := ComCall(16, this, "ptr", ppEnumUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_PrivateTAPIObjects(pVariant) {
        result := ComCall(17, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRegistrationInstance 
     * @param {Integer} lRequestMode 
     * @param {VARIANT_BOOL} fEnable 
     * @returns {HRESULT} 
     */
    RegisterRequestRecipient(lRegistrationInstance, lRequestMode, fEnable) {
        result := ComCall(18, this, "int", lRegistrationInstance, "int", lRequestMode, "short", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pAppFilename 
     * @param {VARIANT_BOOL} fPriority 
     * @returns {HRESULT} 
     */
    SetAssistedTelephonyPriority(pAppFilename, fPriority) {
        pAppFilename := pAppFilename is String ? BSTR.Alloc(pAppFilename).Value : pAppFilename

        result := ComCall(19, this, "ptr", pAppFilename, "short", fPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pAppFilename 
     * @param {Integer} lMediaType 
     * @param {VARIANT_BOOL} fPriority 
     * @returns {HRESULT} 
     */
    SetApplicationPriority(pAppFilename, lMediaType, fPriority) {
        pAppFilename := pAppFilename is String ? BSTR.Alloc(pAppFilename).Value : pAppFilename

        result := ComCall(20, this, "ptr", pAppFilename, "int", lMediaType, "short", fPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFilterMask 
     * @returns {HRESULT} 
     */
    put_EventFilter(lFilterMask) {
        result := ComCall(21, this, "int", lFilterMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plFilterMask 
     * @returns {HRESULT} 
     */
    get_EventFilter(plFilterMask) {
        result := ComCall(22, this, "int*", plFilterMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
