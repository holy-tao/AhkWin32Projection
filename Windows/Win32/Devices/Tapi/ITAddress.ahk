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
     * The get_State method gets the current state of the address in pAddressState.
     * @returns {Integer} Pointer to a member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-address_state">ADDRESS_STATE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-get_state
     */
    get_State() {
        result := ComCall(7, this, "int*", &pAddressState := 0, "HRESULT")
        return pAddressState
    }

    /**
     * The get_AddressName method gets the displayable name of the address.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing a displayable address name.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-get_addressname
     */
    get_AddressName() {
        ppName := BSTR()
        result := ComCall(8, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * The get_ServiceProviderName method gets the name of the Telephony Service Provider (TSP) that supports this address:\_for example, Unimdm.tsp for the Unimodem service provider or H323.tsp for the H323 service provider.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing the service provider name.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-get_serviceprovidername
     */
    get_ServiceProviderName() {
        ppName := BSTR()
        result := ComCall(9, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * The get_TAPIObject method gets a pointer to the TAPI object that owns this address.
     * @returns {ITTAPI} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ittapi">ITTAPI</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-get_tapiobject
     */
    get_TAPIObject() {
        result := ComCall(10, this, "ptr*", &ppTapiObject := 0, "HRESULT")
        return ITTAPI(ppTapiObject)
    }

    /**
     * The CreateCall method creates a new Call object that can be used to make an outgoing call and returns a pointer to the object's ITBasicCallControl interface. The newly created call is in the CS_IDLE state and has no media or terminals selected.
     * @param {BSTR} pDestAddress This <b>BSTR</b> string contains a destination address. The format is provider-specific. This pointer can be <b>NULL</b> for non-dialed addresses (such as with a hot phone) or when all dialing is performed using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itbasiccallcontrol-dial">ITBasicCallControl::Dial</a>. <b>NULL</b> in combination with a <b>NULL</b><i>pGroupID</i> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itbasiccallcontrol-pickup">ITBasicCallControl::Pickup</a> results in a group pickup. Service providers that have inverse multiplexing capabilities can allow an application to specify multiple addresses at once.
     * @param {Integer} lAddressType Contains an 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">address type</a> constant, such as LINEADDRESSTYPE_PHONENUMBER, which describes the format of the address. The value must be valid for this address. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itaddresscapabilities-get_addresscapability">ITAddressCapabilities::get_AddressCapability</a> with <i>AddressCap</i> set to AC_ADDRESSTYPES to verify the value.
     * @param {Integer} lMediaTypes Identifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a> or types that will be involved in the call session.
     * @returns {ITBasicCallControl} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itbasiccallcontrol">ITBasicCallControl</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-createcall
     */
    CreateCall(pDestAddress, lAddressType, lMediaTypes) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress

        result := ComCall(11, this, "ptr", pDestAddress, "int", lAddressType, "int", lMediaTypes, "ptr*", &ppCall := 0, "HRESULT")
        return ITBasicCallControl(ppCall)
    }

    /**
     * The get_Calls method creates a collection of calls currently active on the address. This method is provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateCalls method.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface pointers (call objects).
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-get_calls
     */
    get_Calls() {
        pVariant := VARIANT()
        result := ComCall(12, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateCalls method enumerates calls on the current address. This method is provided for C and C++ applications. Automation client applications, such as those written in Visual Basic, must use the get_Calls method.
     * @returns {IEnumCall} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumcall">IEnumCall</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-enumeratecalls
     */
    EnumerateCalls() {
        result := ComCall(13, this, "ptr*", &ppCallEnum := 0, "HRESULT")
        return IEnumCall(ppCallEnum)
    }

    /**
     * The get_DialableAddress method gets the BSTR which can be used to connect to this address. The BSTR corresponds to the destination address string that another application would use to connect to this address, such as a phone number or an e-mail name.
     * @returns {BSTR} Pointer to <b>BSTR</b> containing the dialable address string. This will match the <i>pDestAddress</i> argument of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itaddress-createcall">ITAddress::CreateCall</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-get_dialableaddress
     */
    get_DialableAddress() {
        pDialableAddress := BSTR()
        result := ComCall(14, this, "ptr", pDialableAddress, "HRESULT")
        return pDialableAddress
    }

    /**
     * The CreateForwardInfoObject method creates the forwarding information object and returns an ITForwardInformation interface pointer.
     * @returns {ITForwardInformation} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itforwardinformation">ITForwardInformation</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-createforwardinfoobject
     */
    CreateForwardInfoObject() {
        result := ComCall(15, this, "ptr*", &ppForwardInfo := 0, "HRESULT")
        return ITForwardInformation(ppForwardInfo)
    }

    /**
     * The Forward method forwards calls destined for the address according to the forwarding instructions contained in ITForwardInformation. If pForwardInfo is set to NULL, forwarding is canceled.
     * @param {ITForwardInformation} pForwardInfo Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itforwardinformation">ITForwardInformation</a> interface, or set to <b>NULL</b> to cancel forwarding.
     * @param {ITBasicCallControl} pCall Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itbasiccallcontrol">ITBasicCallControl</a> interface for the consultation call, if required by the telephony environment. May be <b>NULL</b> if not required.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address does not support forwarding, or <i>pCall</i> does not point to a valid call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pForwardInfo</i> or <i>pCall</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed because the TAPI 3 DLL timed it out. The timeout interval is two minutes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>LINEERR_</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See 
     * <a href="/windows/desktop/api/tapi/nf-tapi-lineforward">LineForward</a> for error codes returned from this TAPI 2.1 function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-forward
     */
    Forward(pForwardInfo, pCall) {
        result := ComCall(16, this, "ptr", pForwardInfo, "ptr", pCall, "HRESULT")
        return result
    }

    /**
     * The get_CurrentForwardInfo method gets a pointer to the current forwarding information object.
     * @returns {ITForwardInformation} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itforwardinformation">ITForwardInformation</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-get_currentforwardinfo
     */
    get_CurrentForwardInfo() {
        result := ComCall(17, this, "ptr*", &ppForwardInfo := 0, "HRESULT")
        return ITForwardInformation(ppForwardInfo)
    }

    /**
     * The put_MessageWaiting method sets the status of the message waiting on the address.
     * @param {VARIANT_BOOL} fMessageWaiting Status of message waiting to be set.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>fMessageWaiting</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed because the TAPI 3 DLL timed it out. The timeout interval is two minutes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-put_messagewaiting
     */
    put_MessageWaiting(fMessageWaiting) {
        result := ComCall(18, this, "short", fMessageWaiting, "HRESULT")
        return result
    }

    /**
     * The get_MessageWaiting method determines if the address has a message waiting.
     * @returns {VARIANT_BOOL} If VARIANT_TRUE is returned, a message is waiting; if VARIANT_FALSE is returned, no message is waiting.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-get_messagewaiting
     */
    get_MessageWaiting() {
        result := ComCall(19, this, "short*", &pfMessageWaiting := 0, "HRESULT")
        return pfMessageWaiting
    }

    /**
     * The put_DoNotDisturb method sets the do not disturb status. The do not disturb feature may not be available on all addresses.
     * @param {VARIANT_BOOL} fDoNotDisturb If VARIANT_TRUE, the do not disturb feature will be activated. If VARIANT_FALSE, the do not disturb feature will be deactivated and all forwarding canceled.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>fDoNotDisturb</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed because the TAPI 3 DLL timed it out. The timeout interval is two minutes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-put_donotdisturb
     */
    put_DoNotDisturb(fDoNotDisturb) {
        result := ComCall(20, this, "short", fDoNotDisturb, "HRESULT")
        return result
    }

    /**
     * The get_DoNotDisturb method gets the current status of the do not disturb feature on the address. The do not disturb feature may not be available on all addresses.
     * @returns {VARIANT_BOOL} If VARIANT_TRUE, the do not disturb feature has been activated. If VARIANT_FALSE, the do not disturb feature is not active.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress-get_donotdisturb
     */
    get_DoNotDisturb() {
        result := ComCall(21, this, "short*", &pfDoNotDisturb := 0, "HRESULT")
        return pfDoNotDisturb
    }
}
