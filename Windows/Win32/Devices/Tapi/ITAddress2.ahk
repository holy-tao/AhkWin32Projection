#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumPhone.ahk
#Include .\ITPhone.ahk
#Include .\ITAddress.ahk

/**
 * The ITAddress2 interface derives from the ITAddress interface. ITAddress2 adds methods to the Address object in order to support phone devices. All Address objects enumerated from TAPI 3.1 automatically implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddress2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddress2 extends ITAddress{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAddress2
     * @type {Guid}
     */
    static IID => Guid("{b0ae5d9b-be51-46c9-b0f7-dfa8a22a8bc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Phones", "EnumeratePhones", "GetPhoneFromTerminal", "get_PreferredPhones", "EnumeratePreferredPhones", "get_EventFilter", "put_EventFilter", "DeviceSpecific", "DeviceSpecificVariant", "NegotiateExtVersion"]

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-get_phones
     */
    get_Phones() {
        pPhones := VARIANT()
        result := ComCall(22, this, "ptr", pPhones, "HRESULT")
        return pPhones
    }

    /**
     * 
     * @returns {IEnumPhone} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-enumeratephones
     */
    EnumeratePhones() {
        result := ComCall(23, this, "ptr*", &ppEnumPhone := 0, "HRESULT")
        return IEnumPhone(ppEnumPhone)
    }

    /**
     * 
     * @param {ITTerminal} pTerminal 
     * @returns {ITPhone} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-getphonefromterminal
     */
    GetPhoneFromTerminal(pTerminal) {
        result := ComCall(24, this, "ptr", pTerminal, "ptr*", &ppPhone := 0, "HRESULT")
        return ITPhone(ppPhone)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-get_preferredphones
     */
    get_PreferredPhones() {
        pPhones := VARIANT()
        result := ComCall(25, this, "ptr", pPhones, "HRESULT")
        return pPhones
    }

    /**
     * 
     * @returns {IEnumPhone} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-enumeratepreferredphones
     */
    EnumeratePreferredPhones() {
        result := ComCall(26, this, "ptr*", &ppEnumPhone := 0, "HRESULT")
        return IEnumPhone(ppEnumPhone)
    }

    /**
     * 
     * @param {Integer} TapiEvent 
     * @param {Integer} lSubEvent 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-get_eventfilter
     */
    get_EventFilter(TapiEvent, lSubEvent) {
        result := ComCall(27, this, "int", TapiEvent, "int", lSubEvent, "short*", &pEnable := 0, "HRESULT")
        return pEnable
    }

    /**
     * 
     * @param {Integer} TapiEvent 
     * @param {Integer} lSubEvent 
     * @param {VARIANT_BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-put_eventfilter
     */
    put_EventFilter(TapiEvent, lSubEvent, bEnable) {
        result := ComCall(28, this, "int", TapiEvent, "int", lSubEvent, "short", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITCallInfo} pCall 
     * @param {Pointer<Integer>} pParams 
     * @param {Integer} dwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-devicespecific
     */
    DeviceSpecific(pCall, pParams, dwSize) {
        pParamsMarshal := pParams is VarRef ? "char*" : "ptr"

        result := ComCall(29, this, "ptr", pCall, pParamsMarshal, pParams, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITCallInfo} pCall 
     * @param {VARIANT} varDevSpecificByteArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-devicespecificvariant
     */
    DeviceSpecificVariant(pCall, varDevSpecificByteArray) {
        result := ComCall(30, this, "ptr", pCall, "ptr", varDevSpecificByteArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLowVersion 
     * @param {Integer} lHighVersion 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress2-negotiateextversion
     */
    NegotiateExtVersion(lLowVersion, lHighVersion) {
        result := ComCall(31, this, "int", lLowVersion, "int", lHighVersion, "int*", &plExtVersion := 0, "HRESULT")
        return plExtVersion
    }
}
