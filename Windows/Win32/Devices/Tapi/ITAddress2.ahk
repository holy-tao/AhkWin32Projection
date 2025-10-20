#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAddress.ahk

/**
 * The ITAddress2 interface derives from the ITAddress interface. ITAddress2 adds methods to the Address object in order to support phone devices. All Address objects enumerated from TAPI 3.1 automatically implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddress2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddress2 extends ITAddress{
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
     * 
     * @param {Pointer<VARIANT>} pPhones 
     * @returns {HRESULT} 
     */
    get_Phones(pPhones) {
        result := ComCall(22, this, "ptr", pPhones, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumPhone>} ppEnumPhone 
     * @returns {HRESULT} 
     */
    EnumeratePhones(ppEnumPhone) {
        result := ComCall(23, this, "ptr", ppEnumPhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITTerminal>} pTerminal 
     * @param {Pointer<ITPhone>} ppPhone 
     * @returns {HRESULT} 
     */
    GetPhoneFromTerminal(pTerminal, ppPhone) {
        result := ComCall(24, this, "ptr", pTerminal, "ptr", ppPhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pPhones 
     * @returns {HRESULT} 
     */
    get_PreferredPhones(pPhones) {
        result := ComCall(25, this, "ptr", pPhones, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumPhone>} ppEnumPhone 
     * @returns {HRESULT} 
     */
    EnumeratePreferredPhones(ppEnumPhone) {
        result := ComCall(26, this, "ptr", ppEnumPhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TapiEvent 
     * @param {Integer} lSubEvent 
     * @param {Pointer<VARIANT_BOOL>} pEnable 
     * @returns {HRESULT} 
     */
    get_EventFilter(TapiEvent, lSubEvent, pEnable) {
        result := ComCall(27, this, "int", TapiEvent, "int", lSubEvent, "ptr", pEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TapiEvent 
     * @param {Integer} lSubEvent 
     * @param {VARIANT_BOOL} bEnable 
     * @returns {HRESULT} 
     */
    put_EventFilter(TapiEvent, lSubEvent, bEnable) {
        result := ComCall(28, this, "int", TapiEvent, "int", lSubEvent, "short", bEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} pCall 
     * @param {Pointer<Byte>} pParams 
     * @param {Integer} dwSize 
     * @returns {HRESULT} 
     */
    DeviceSpecific(pCall, pParams, dwSize) {
        result := ComCall(29, this, "ptr", pCall, "char*", pParams, "uint", dwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} pCall 
     * @param {VARIANT} varDevSpecificByteArray 
     * @returns {HRESULT} 
     */
    DeviceSpecificVariant(pCall, varDevSpecificByteArray) {
        result := ComCall(30, this, "ptr", pCall, "ptr", varDevSpecificByteArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLowVersion 
     * @param {Integer} lHighVersion 
     * @param {Pointer<Int32>} plExtVersion 
     * @returns {HRESULT} 
     */
    NegotiateExtVersion(lLowVersion, lHighVersion, plExtVersion) {
        result := ComCall(31, this, "int", lLowVersion, "int", lHighVersion, "int*", plExtVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
