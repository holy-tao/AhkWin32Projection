#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ADDRESS_CAPABILITY_STRING.ahk" { ADDRESS_CAPABILITY_STRING }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ADDRESS_CAPABILITY.ahk" { ADDRESS_CAPABILITY }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IEnumBstr.ahk" { IEnumBstr }

/**
 * The ITAddressCapabilities interface is used to obtain information about an address's capabilities. It is on the Address object, and an application can access it by calling QueryInterface on the Address object.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itaddresscapabilities
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAddressCapabilities extends IDispatch {
    /**
     * The interface identifier for ITAddressCapabilities
     * @type {Guid}
     */
    static IID := Guid("{8df232f5-821b-11d1-bb5c-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAddressCapabilities interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AddressCapability       : IntPtr
        get_AddressCapabilityString : IntPtr
        get_CallTreatments          : IntPtr
        EnumerateCallTreatments     : IntPtr
        get_CompletionMessages      : IntPtr
        EnumerateCompletionMessages : IntPtr
        get_DeviceClasses           : IntPtr
        EnumerateDeviceClasses      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAddressCapabilities.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {ADDRESS_CAPABILITY} AddressCap Descriptor for desired address capability.
     * @returns {Integer} Value of address capability.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_addresscapability
     */
    get_AddressCapability(AddressCap) {
        result := ComCall(7, this, ADDRESS_CAPABILITY, AddressCap, "int*", &plCapability := 0, "HRESULT")
        return plCapability
    }

    /**
     * The get_AddressCapabilityString method gets the capability string for a given ADDRESS_CAPABILITY_STRING.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppCapabilityString</i> parameter.
     * @param {ADDRESS_CAPABILITY_STRING} AddressCapString Descriptor for desired address capability string.
     * @returns {BSTR} Pointer to <b>BSTR</b> value of address capability. <b>NULL</b> is a possible return value if the TSP does not provide a value for <i>AddressCapString</i>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_addresscapabilitystring
     */
    get_AddressCapabilityString(AddressCapString) {
        ppCapabilityString := BSTR.Owned()
        result := ComCall(8, this, ADDRESS_CAPABILITY_STRING, AddressCapString, BSTR.Ptr, ppCapabilityString, "HRESULT")
        return ppCapabilityString
    }

    /**
     * The get_CallTreatments method gets call treatments. This method is provided for Automation client applications, such as those written in Visual Basic and scripting languages.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface returned by <b>ITAddressCapabilities::get_CallTreatments</b>. The application must call <b>Release</b> on the 
     * <b>ITCallInfo</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of call treatments.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_calltreatments
     */
    get_CallTreatments() {
        pVariant := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateCallTreatments method gets call treatments. This method is provided for applications written in C/C++ and Java.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumbstr">IEnumBstr</a> interface returned by <b>ITAddressCapabilities::EnumerateCallTreatments</b>. The application must call <b>Release</b> on the 
     * <b>IEnumBstr</b> interface to free resources associated with it.
     * @returns {IEnumBstr} Pointer to call treatment enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-enumeratecalltreatments
     */
    EnumerateCallTreatments() {
        result := ComCall(10, this, "ptr*", &ppEnumCallTreatment := 0, "HRESULT")
        return IEnumBstr(ppEnumCallTreatment)
    }

    /**
     * The get_CompletionMessages gets completion messages. This method is provided for Automation client applications, such as those written in Visual Basic and scripting languages.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing completion messages.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_completionmessages
     */
    get_CompletionMessages() {
        pVariant := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateCompletionMessages method gets completion messages. This method is provided for applications written in C/C++ and Java.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumbstr">IEnumBstr</a> interface returned by <b>ITAddressCapabilities::EnumerateCompletionMessages</b>. The application must call <b>Release</b> on the 
     * <b>IEnumBstr</b> interface to free resources associated with it.
     * @returns {IEnumBstr} Pointer to enumeration of completion messages.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-enumeratecompletionmessages
     */
    EnumerateCompletionMessages() {
        result := ComCall(12, this, "ptr*", &ppEnumCompletionMessage := 0, "HRESULT")
        return IEnumBstr(ppEnumCompletionMessage)
    }

    /**
     * The get_DeviceClasses method gets device classes. This method is provided for Automation client applications, such as those written in Visual Basic and scripting languages.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">device classes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_deviceclasses
     */
    get_DeviceClasses() {
        pVariant := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateDeviceClasses method gets device classes. This method is provided for applications written in C/C++ and Java.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumbstr">IEnumBstr</a> interface returned by <b>ITAddressCapabilities::EnumerateDeviceClasses</b>. The application must call <b>Release</b> on the 
     * <b>IEnumBstr</b> interface to free resources associated with it.
     * @returns {IEnumBstr} Pointer to enumeration of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">device classes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresscapabilities-enumeratedeviceclasses
     */
    EnumerateDeviceClasses() {
        result := ComCall(14, this, "ptr*", &ppEnumDeviceClass := 0, "HRESULT")
        return IEnumBstr(ppEnumDeviceClass)
    }

    Query(iid) {
        if (ITAddressCapabilities.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AddressCapability := CallbackCreate(GetMethod(implObj, "get_AddressCapability"), flags, 3)
        this.vtbl.get_AddressCapabilityString := CallbackCreate(GetMethod(implObj, "get_AddressCapabilityString"), flags, 3)
        this.vtbl.get_CallTreatments := CallbackCreate(GetMethod(implObj, "get_CallTreatments"), flags, 2)
        this.vtbl.EnumerateCallTreatments := CallbackCreate(GetMethod(implObj, "EnumerateCallTreatments"), flags, 2)
        this.vtbl.get_CompletionMessages := CallbackCreate(GetMethod(implObj, "get_CompletionMessages"), flags, 2)
        this.vtbl.EnumerateCompletionMessages := CallbackCreate(GetMethod(implObj, "EnumerateCompletionMessages"), flags, 2)
        this.vtbl.get_DeviceClasses := CallbackCreate(GetMethod(implObj, "get_DeviceClasses"), flags, 2)
        this.vtbl.EnumerateDeviceClasses := CallbackCreate(GetMethod(implObj, "EnumerateDeviceClasses"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AddressCapability)
        CallbackFree(this.vtbl.get_AddressCapabilityString)
        CallbackFree(this.vtbl.get_CallTreatments)
        CallbackFree(this.vtbl.EnumerateCallTreatments)
        CallbackFree(this.vtbl.get_CompletionMessages)
        CallbackFree(this.vtbl.EnumerateCompletionMessages)
        CallbackFree(this.vtbl.get_DeviceClasses)
        CallbackFree(this.vtbl.EnumerateDeviceClasses)
    }
}
