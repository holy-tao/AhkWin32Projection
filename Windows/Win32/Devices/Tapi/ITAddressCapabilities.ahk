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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AddressCapability", "get_AddressCapabilityString", "get_CallTreatments", "EnumerateCallTreatments", "get_CompletionMessages", "EnumerateCompletionMessages", "get_DeviceClasses", "EnumerateDeviceClasses"]

    /**
     * 
     * @param {Integer} AddressCap 
     * @param {Pointer<Integer>} plCapability 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_addresscapability
     */
    get_AddressCapability(AddressCap, plCapability) {
        plCapabilityMarshal := plCapability is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", AddressCap, plCapabilityMarshal, plCapability, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AddressCapString 
     * @param {Pointer<BSTR>} ppCapabilityString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_addresscapabilitystring
     */
    get_AddressCapabilityString(AddressCapString, ppCapabilityString) {
        result := ComCall(8, this, "int", AddressCapString, "ptr", ppCapabilityString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_calltreatments
     */
    get_CallTreatments(pVariant) {
        result := ComCall(9, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBstr>} ppEnumCallTreatment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-enumeratecalltreatments
     */
    EnumerateCallTreatments(ppEnumCallTreatment) {
        result := ComCall(10, this, "ptr*", ppEnumCallTreatment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_completionmessages
     */
    get_CompletionMessages(pVariant) {
        result := ComCall(11, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBstr>} ppEnumCompletionMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-enumeratecompletionmessages
     */
    EnumerateCompletionMessages(ppEnumCompletionMessage) {
        result := ComCall(12, this, "ptr*", ppEnumCompletionMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_deviceclasses
     */
    get_DeviceClasses(pVariant) {
        result := ComCall(13, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBstr>} ppEnumDeviceClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-enumeratedeviceclasses
     */
    EnumerateDeviceClasses(ppEnumDeviceClass) {
        result := ComCall(14, this, "ptr*", ppEnumDeviceClass, "HRESULT")
        return result
    }
}
