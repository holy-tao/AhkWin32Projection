#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumBstr.ahk
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
     * @type {VARIANT} 
     */
    CallTreatments {
        get => this.get_CallTreatments()
    }

    /**
     * @type {VARIANT} 
     */
    CompletionMessages {
        get => this.get_CompletionMessages()
    }

    /**
     * @type {VARIANT} 
     */
    DeviceClasses {
        get => this.get_DeviceClasses()
    }

    /**
     * The get_AddressCapability method gets the capability value for a given ADDRESS_CAPABILITY.
     * @param {Integer} AddressCap Descriptor for desired address capability.
     * @returns {Integer} Value of address capability.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresscapabilities-get_addresscapability
     */
    get_AddressCapability(AddressCap) {
        result := ComCall(7, this, "int", AddressCap, "int*", &plCapability := 0, "HRESULT")
        return plCapability
    }

    /**
     * The get_AddressCapabilityString method gets the capability string for a given ADDRESS_CAPABILITY_STRING.
     * @param {Integer} AddressCapString Descriptor for desired address capability string.
     * @returns {BSTR} Pointer to <b>BSTR</b> value of address capability. <b>NULL</b> is a possible return value if the TSP does not provide a value for <i>AddressCapString</i>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresscapabilities-get_addresscapabilitystring
     */
    get_AddressCapabilityString(AddressCapString) {
        ppCapabilityString := BSTR()
        result := ComCall(8, this, "int", AddressCapString, "ptr", ppCapabilityString, "HRESULT")
        return ppCapabilityString
    }

    /**
     * The get_CallTreatments method gets call treatments. This method is provided for Automation client applications, such as those written in Visual Basic and scripting languages.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of call treatments.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresscapabilities-get_calltreatments
     */
    get_CallTreatments() {
        pVariant := VARIANT()
        result := ComCall(9, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateCallTreatments method gets call treatments. This method is provided for applications written in C/C++ and Java.
     * @returns {IEnumBstr} Pointer to call treatment enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresscapabilities-enumeratecalltreatments
     */
    EnumerateCallTreatments() {
        result := ComCall(10, this, "ptr*", &ppEnumCallTreatment := 0, "HRESULT")
        return IEnumBstr(ppEnumCallTreatment)
    }

    /**
     * The get_CompletionMessages gets completion messages. This method is provided for Automation client applications, such as those written in Visual Basic and scripting languages.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing completion messages.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresscapabilities-get_completionmessages
     */
    get_CompletionMessages() {
        pVariant := VARIANT()
        result := ComCall(11, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateCompletionMessages method gets completion messages. This method is provided for applications written in C/C++ and Java.
     * @returns {IEnumBstr} Pointer to enumeration of completion messages.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresscapabilities-enumeratecompletionmessages
     */
    EnumerateCompletionMessages() {
        result := ComCall(12, this, "ptr*", &ppEnumCompletionMessage := 0, "HRESULT")
        return IEnumBstr(ppEnumCompletionMessage)
    }

    /**
     * The get_DeviceClasses method gets device classes. This method is provided for Automation client applications, such as those written in Visual Basic and scripting languages.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">device classes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresscapabilities-get_deviceclasses
     */
    get_DeviceClasses() {
        pVariant := VARIANT()
        result := ComCall(13, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateDeviceClasses method gets device classes. This method is provided for applications written in C/C++ and Java.
     * @returns {IEnumBstr} Pointer to enumeration of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">device classes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresscapabilities-enumeratedeviceclasses
     */
    EnumerateDeviceClasses() {
        result := ComCall(14, this, "ptr*", &ppEnumDeviceClass := 0, "HRESULT")
        return IEnumBstr(ppEnumDeviceClass)
    }
}
