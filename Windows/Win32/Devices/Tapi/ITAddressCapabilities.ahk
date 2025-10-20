#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAddressCapabilities interface is used to obtain information about an address's capabilities. It is on the Address object, and an application can access it by calling QueryInterface on the Address object.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddresscapabilities
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddressCapabilities extends IDispatch{
    /**
     * The interface identifier for ITAddressCapabilities
     * @type {Guid}
     */
    static IID => Guid("{8df232f5-821b-11d1-bb5c-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} AddressCap 
     * @param {Pointer<Int32>} plCapability 
     * @returns {HRESULT} 
     */
    get_AddressCapability(AddressCap, plCapability) {
        result := ComCall(7, this, "int", AddressCap, "int*", plCapability, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AddressCapString 
     * @param {Pointer<BSTR>} ppCapabilityString 
     * @returns {HRESULT} 
     */
    get_AddressCapabilityString(AddressCapString, ppCapabilityString) {
        result := ComCall(8, this, "int", AddressCapString, "ptr", ppCapabilityString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_CallTreatments(pVariant) {
        result := ComCall(9, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBstr>} ppEnumCallTreatment 
     * @returns {HRESULT} 
     */
    EnumerateCallTreatments(ppEnumCallTreatment) {
        result := ComCall(10, this, "ptr", ppEnumCallTreatment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_CompletionMessages(pVariant) {
        result := ComCall(11, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBstr>} ppEnumCompletionMessage 
     * @returns {HRESULT} 
     */
    EnumerateCompletionMessages(ppEnumCompletionMessage) {
        result := ComCall(12, this, "ptr", ppEnumCompletionMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_DeviceClasses(pVariant) {
        result := ComCall(13, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBstr>} ppEnumDeviceClass 
     * @returns {HRESULT} 
     */
    EnumerateDeviceClasses(ppEnumDeviceClass) {
        result := ComCall(14, this, "ptr", ppEnumDeviceClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
