#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITTAPI.ahk
#Include .\ITBasicCallControl.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumCall.ahk
#Include .\ITForwardInformation.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAddress interface is the base interface for the Address object. Applications use this interface to get information about and use the Address object.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddress
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddress extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAddress
     * @type {Guid}
     */
    static IID => Guid("{b1efc386-9355-11d0-835c-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_State", "get_AddressName", "get_ServiceProviderName", "get_TAPIObject", "CreateCall", "get_Calls", "EnumerateCalls", "get_DialableAddress", "CreateForwardInfoObject", "Forward", "get_CurrentForwardInfo", "put_MessageWaiting", "get_MessageWaiting", "put_DoNotDisturb", "get_DoNotDisturb"]

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {BSTR} 
     */
    AddressName {
        get => this.get_AddressName()
    }

    /**
     * @type {BSTR} 
     */
    ServiceProviderName {
        get => this.get_ServiceProviderName()
    }

    /**
     * @type {ITTAPI} 
     */
    TAPIObject {
        get => this.get_TAPIObject()
    }

    /**
     * @type {VARIANT} 
     */
    Calls {
        get => this.get_Calls()
    }

    /**
     * @type {BSTR} 
     */
    DialableAddress {
        get => this.get_DialableAddress()
    }

    /**
     * @type {ITForwardInformation} 
     */
    CurrentForwardInfo {
        get => this.get_CurrentForwardInfo()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MessageWaiting {
        get => this.get_MessageWaiting()
        set => this.put_MessageWaiting(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DoNotDisturb {
        get => this.get_DoNotDisturb()
        set => this.put_DoNotDisturb(value)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_state
     */
    get_State() {
        result := ComCall(7, this, "int*", &pAddressState := 0, "HRESULT")
        return pAddressState
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_addressname
     */
    get_AddressName() {
        ppName := BSTR()
        result := ComCall(8, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_serviceprovidername
     */
    get_ServiceProviderName() {
        ppName := BSTR()
        result := ComCall(9, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * 
     * @returns {ITTAPI} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_tapiobject
     */
    get_TAPIObject() {
        result := ComCall(10, this, "ptr*", &ppTapiObject := 0, "HRESULT")
        return ITTAPI(ppTapiObject)
    }

    /**
     * 
     * @param {BSTR} pDestAddress 
     * @param {Integer} lAddressType 
     * @param {Integer} lMediaTypes 
     * @returns {ITBasicCallControl} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-createcall
     */
    CreateCall(pDestAddress, lAddressType, lMediaTypes) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress

        result := ComCall(11, this, "ptr", pDestAddress, "int", lAddressType, "int", lMediaTypes, "ptr*", &ppCall := 0, "HRESULT")
        return ITBasicCallControl(ppCall)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_calls
     */
    get_Calls() {
        pVariant := VARIANT()
        result := ComCall(12, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @returns {IEnumCall} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-enumeratecalls
     */
    EnumerateCalls() {
        result := ComCall(13, this, "ptr*", &ppCallEnum := 0, "HRESULT")
        return IEnumCall(ppCallEnum)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_dialableaddress
     */
    get_DialableAddress() {
        pDialableAddress := BSTR()
        result := ComCall(14, this, "ptr", pDialableAddress, "HRESULT")
        return pDialableAddress
    }

    /**
     * 
     * @returns {ITForwardInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-createforwardinfoobject
     */
    CreateForwardInfoObject() {
        result := ComCall(15, this, "ptr*", &ppForwardInfo := 0, "HRESULT")
        return ITForwardInformation(ppForwardInfo)
    }

    /**
     * 
     * @param {ITForwardInformation} pForwardInfo 
     * @param {ITBasicCallControl} pCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-forward
     */
    Forward(pForwardInfo, pCall) {
        result := ComCall(16, this, "ptr", pForwardInfo, "ptr", pCall, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITForwardInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_currentforwardinfo
     */
    get_CurrentForwardInfo() {
        result := ComCall(17, this, "ptr*", &ppForwardInfo := 0, "HRESULT")
        return ITForwardInformation(ppForwardInfo)
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMessageWaiting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-put_messagewaiting
     */
    put_MessageWaiting(fMessageWaiting) {
        result := ComCall(18, this, "short", fMessageWaiting, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_messagewaiting
     */
    get_MessageWaiting() {
        result := ComCall(19, this, "short*", &pfMessageWaiting := 0, "HRESULT")
        return pfMessageWaiting
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDoNotDisturb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-put_donotdisturb
     */
    put_DoNotDisturb(fDoNotDisturb) {
        result := ComCall(20, this, "short", fDoNotDisturb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddress-get_donotdisturb
     */
    get_DoNotDisturb() {
        result := ComCall(21, this, "short*", &pfDoNotDisturb := 0, "HRESULT")
        return pfDoNotDisturb
    }
}
