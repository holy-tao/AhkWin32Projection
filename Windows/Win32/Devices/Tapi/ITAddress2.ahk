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
     * @type {VARIANT} 
     */
    Phones {
        get => this.get_Phones()
    }

    /**
     * @type {VARIANT} 
     */
    PreferredPhones {
        get => this.get_PreferredPhones()
    }

    /**
     * The get_Phones method returns a VARIANT pointer to an ITCollection of phone objects corresponding to the phone devices that can be used with this address.
     * @returns {VARIANT} Pointer to a VARIANT containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-get_phones
     */
    get_Phones() {
        pPhones := VARIANT()
        result := ComCall(22, this, "ptr", pPhones, "HRESULT")
        return pPhones
    }

    /**
     * The EnumeratePhones method enumerates the phone objects corresponding to the phone devices that can be used with this address.
     * @returns {IEnumPhone} Pointer to the new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumphone">IEnumPhone</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-enumeratephones
     */
    EnumeratePhones() {
        result := ComCall(23, this, "ptr*", &ppEnumPhone := 0, "HRESULT")
        return IEnumPhone(ppEnumPhone)
    }

    /**
     * The GetPhoneFromTerminal method returns the phone object associated with the terminal. Only one phone can be associated with a terminal.
     * @param {ITTerminal} pTerminal Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @returns {ITPhone} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-getphonefromterminal
     */
    GetPhoneFromTerminal(pTerminal) {
        result := ComCall(24, this, "ptr", pTerminal, "ptr*", &ppPhone := 0, "HRESULT")
        return ITPhone(ppPhone)
    }

    /**
     * The get_PreferredPhones method returns a collection of phone objects corresponding to the phone devices that are preferred for use with this address.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-get_preferredphones
     */
    get_PreferredPhones() {
        pPhones := VARIANT()
        result := ComCall(25, this, "ptr", pPhones, "HRESULT")
        return pPhones
    }

    /**
     * The EnumeratePreferredPhones method enumerates the preferred phone objects for this address.
     * @returns {IEnumPhone} Pointer to the location where, on success, this method will place a pointer to an enumeration object that contains the returned list of phones.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-enumeratepreferredphones
     */
    EnumeratePreferredPhones() {
        result := ComCall(26, this, "ptr*", &ppEnumPhone := 0, "HRESULT")
        return IEnumPhone(ppEnumPhone)
    }

    /**
     * The get_EventFilter method retrieves the current filter settings for the current address and a given TAPI_EVENT value.
     * @param {Integer} TapiEvent The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapi_event">TAPI_EVENT</a> descriptor of event type information being checked.
     * @param {Integer} lSubEvent Subevent value. <b>NULL</b> if not applicable.
     * @returns {VARIANT_BOOL} Pointer to VARIANT_BOOL indicating whether the current event is required by the application.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-get_eventfilter
     */
    get_EventFilter(TapiEvent, lSubEvent) {
        result := ComCall(27, this, "int", TapiEvent, "int", lSubEvent, "short*", &pEnable := 0, "HRESULT")
        return pEnable
    }

    /**
     * The put_EventFilter method sets an event filter for the current address. If no event filters are set, the application will not be notified of events on this address.
     * @param {Integer} TapiEvent The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapi_event">TAPI_EVENT</a> descriptor of the event type.
     * @param {Integer} lSubEvent Subevent descriptor.
     * @param {VARIANT_BOOL} bEnable VARIANT_TRUE if the application requires notification of this event type. VARIANT_FALSE if the application does not require notifications for this event.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-put_eventfilter
     */
    put_EventFilter(TapiEvent, lSubEvent, bEnable) {
        result := ComCall(28, this, "int", TapiEvent, "int", lSubEvent, "short", bEnable, "HRESULT")
        return result
    }

    /**
     * The DeviceSpecific method enables service providers to provide access to features not offered by other TAPI functions.
     * @param {ITCallInfo} pCall Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface of the call object.
     * @param {Pointer<Integer>} pParams Pointer to a memory area used to hold a parameter block. The format of this parameter block is device specific; TAPI passes its contents between the application and the service provider.
     * @param {Integer} dwSize Size, in bytes, of the parameter block area.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pParams</i> or <i>pCall</i> parameter is not a valid pointer.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-devicespecific
     */
    DeviceSpecific(pCall, pParams, dwSize) {
        pParamsMarshal := pParams is VarRef ? "char*" : "ptr"

        result := ComCall(29, this, "ptr", pCall, pParamsMarshal, pParams, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * The DeviceSpecificVariant method enables service providers to provide access to features not offered by other TAPI functions.
     * @param {ITCallInfo} pCall Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface of the call object.
     * @param {VARIANT} varDevSpecificByteArray VARIANT containing the parameter block. The format of this parameter block is device specific; TAPI passes its contents between the application and the service provider.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCall</i> parameter is not a valid pointer.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-devicespecificvariant
     */
    DeviceSpecificVariant(pCall, varDevSpecificByteArray) {
        result := ComCall(30, this, "ptr", pCall, "ptr", varDevSpecificByteArray, "HRESULT")
        return result
    }

    /**
     * The NegotiateExtVersion method allows an application to negotiate an extension version to use with the specified line device. This method need not be called if the application does not support provider-specific extensions.
     * @param {Integer} lLowVersion Least recent extension version of the extension identifier returned by 
     * <b>NegotiateExtVersion</b> that the application is compliant with. The high-order word is the major version number; the low-order word is the minor version number.
     * @param {Integer} lHighVersion Most recent extension version of the extension identifier returned by 
     * <b>NegotiateExtVersion</b> that the application is compliant with. The high-order word is the major version number; the low-order word is the minor version number.
     * @returns {Integer} Pointer to a <b>long</b> that contains the extension version number that was negotiated. If negotiation succeeds, this number is in the range between <i>lLowVersion</i> and <i>lHighVersion</i>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddress2-negotiateextversion
     */
    NegotiateExtVersion(lLowVersion, lHighVersion) {
        result := ComCall(31, this, "int", lLowVersion, "int", lHighVersion, "int*", &plExtVersion := 0, "HRESULT")
        return plExtVersion
    }
}
