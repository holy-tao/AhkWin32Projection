#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumAddress.ahk
#Include .\IEnumCallHub.ahk
#Include ..\..\System\Com\IEnumUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTAPI interface is the base interface for the TAPI object. The TAPI object is created by CoCreateInstance. For information on CoCreateInstance, see documentation on COM. All other TAPI 3 objects are created by TAPI 3 itself.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittapi
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPI extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Shutdown", "get_Addresses", "EnumerateAddresses", "RegisterCallNotifications", "UnregisterNotifications", "get_CallHubs", "EnumerateCallHubs", "SetCallHubTracking", "EnumeratePrivateTAPIObjects", "get_PrivateTAPIObjects", "RegisterRequestRecipient", "SetAssistedTelephonyPriority", "SetApplicationPriority", "put_EventFilter", "get_EventFilter"]

    /**
     * @type {VARIANT} 
     */
    Addresses {
        get => this.get_Addresses()
    }

    /**
     * @type {VARIANT} 
     */
    CallHubs {
        get => this.get_CallHubs()
    }

    /**
     * @type {VARIANT} 
     */
    PrivateTAPIObjects {
        get => this.get_PrivateTAPIObjects()
    }

    /**
     * @type {Integer} 
     */
    EventFilter {
        get => this.get_EventFilter()
        set => this.put_EventFilter(value)
    }

    /**
     * The Initialize method initializes TAPI. This method must be called before calling any other TAPI 3 method. The application must call the Shutdown method when ending a TAPI session.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TAPI has already been initialized.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-initialize
     */
    Initialize() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Shutdown method shuts down a TAPI session.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TAPI session has already been shut down.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-shutdown
     */
    Shutdown() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The get_Addresses method creates a collection of addresses that are currently available. Provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateAddresses method.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface pointers (address objects).
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-get_addresses
     */
    get_Addresses() {
        pVariant := VARIANT()
        result := ComCall(9, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateAddresses method enumerates the addresses that are currently available. Provided for C and C++ applications. Automation client applications, such as those written in Visual Basic, must use the get_Addresses method.
     * @returns {IEnumAddress} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumaddress">IEnumAddress</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-enumerateaddresses
     */
    EnumerateAddresses() {
        result := ComCall(10, this, "ptr*", &ppEnumAddress := 0, "HRESULT")
        return IEnumAddress(ppEnumAddress)
    }

    /**
     * The RegisterCallNotifications method sets which new call notifications an application will receive. The application must call the method for each address, indicating media type or types it can handle, and specifying the privileges it requests.
     * @param {ITAddress} pAddress Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface.
     * @param {VARIANT_BOOL} fMonitor Boolean value indicating whether the application will monitor calls. VARIANT_TRUE indicates that the application will monitor calls; VARIANT_FALSE that it will not.
     * @param {VARIANT_BOOL} fOwner Boolean value indicating whether the application will own incoming calls. VARIANT_TRUE indicates that the application will own incoming calls; VARIANT_FALSE indicates that it will not.
     * @param {Integer} lMediaTypes <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">Media types</a> that can be handled by the application.
     * @param {Integer} lCallbackInstance Callback instance to be used by the TAPI 3 DLL. Can be the gulAdvise value returned by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">IConnectionPoint::Advise</a> during registration of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ittapieventnotification">ITTAPIEventNotification</a> outgoing interface.
     * @returns {Integer} On success, the returned value that is used by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-unregisternotifications">ITTAPI::UnregisterNotifications</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-registercallnotifications
     */
    RegisterCallNotifications(pAddress, fMonitor, fOwner, lMediaTypes, lCallbackInstance) {
        result := ComCall(11, this, "ptr", pAddress, "short", fMonitor, "short", fOwner, "int", lMediaTypes, "int", lCallbackInstance, "int*", &plRegister := 0, "HRESULT")
        return plRegister
    }

    /**
     * The UnregisterNotifications method removes any incoming call notification registrations that have been performed using ITTAPI::RegisterCallNotifications.
     * @param {Integer} lRegister The value returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">RegisterCallNotifications</a> method in the <i>plRegister</i> parameter.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TAPI object has not yet been initialized or the <i>lRegister</i> parameter is not valid.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-unregisternotifications
     */
    UnregisterNotifications(lRegister) {
        result := ComCall(12, this, "int", lRegister, "HRESULT")
        return result
    }

    /**
     * The get_CallHubs method creates a collection of the currently available call hubs. Provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateCallHubs method.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallhub">ITCallHub</a> interface pointers (CallHub objects).
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-get_callhubs
     */
    get_CallHubs() {
        pVariant := VARIANT()
        result := ComCall(13, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateCallHubs method enumerates the currently available call hubs. Provided for C and C++ applications. Automation client applications, such as those written in Visual Basic, must use the get_Callhubs method.
     * @returns {IEnumCallHub} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumcallhub">IEnumCallHub</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-enumeratecallhubs
     */
    EnumerateCallHubs() {
        result := ComCall(14, this, "ptr*", &ppEnumCallHub := 0, "HRESULT")
        return IEnumCallHub(ppEnumCallHub)
    }

    /**
     * The SetCallHubTracking method enables or disables CallHub tracking.
     * @param {VARIANT} pAddresses Pointer to a <b>VARIANT</b> containing a <b>SAFEARRAY</b> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface pointers.
     * @param {VARIANT_BOOL} bTracking VARIANT_TRUE to enable tracking, VARIANT_FALSE to disable.
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
     * The TAPI object has not been initialized.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-setcallhubtracking
     */
    SetCallHubTracking(pAddresses, bTracking) {
        result := ComCall(15, this, "ptr", pAddresses, "short", bTracking, "HRESULT")
        return result
    }

    /**
     * The EnumeratePrivateTAPIObjects method of the ITTAPI interface is not implemented and will return E_NOTIMPL.
     * @returns {IEnumUnknown} This method is not implemented.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-enumerateprivatetapiobjects
     */
    EnumeratePrivateTAPIObjects() {
        result := ComCall(16, this, "ptr*", &ppEnumUnknown := 0, "HRESULT")
        return IEnumUnknown(ppEnumUnknown)
    }

    /**
     * The get_PrivateTAPIObjects method of the ITTAPI interface is not implemented and will return E_NOTIMPL.
     * @returns {VARIANT} This method is not implemented.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-get_privatetapiobjects
     */
    get_PrivateTAPIObjects() {
        pVariant := VARIANT()
        result := ComCall(17, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The RegisterRequestRecipient method registers an application instance as being the proper one to handle assisted telephony requests.
     * @param {Integer} lRegistrationInstance Pointer to registration instance.
     * @param {Integer} lRequestMode Request mode.
     * @param {VARIANT_BOOL} fEnable VARIANT_TRUE indicates that the caller wants to register as the handler; VARIANT_FALSE that it wants to unregister as the handler.
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
     * The TAPI object has not been initialized.
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-registerrequestrecipient
     */
    RegisterRequestRecipient(lRegistrationInstance, lRequestMode, fEnable) {
        result := ComCall(18, this, "int", lRegistrationInstance, "int", lRequestMode, "short", fEnable, "HRESULT")
        return result
    }

    /**
     * The SetAssistedTelephonyPriority method sets the application priority to handle assisted telephony requests.
     * @param {BSTR} pAppFilename Pointer to a <b>BSTR</b> containing the name of the application.
     * @param {VARIANT_BOOL} fPriority Set to VARIANT_FALSE to disable, VARIANT_TRUE to enable.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-setassistedtelephonypriority
     */
    SetAssistedTelephonyPriority(pAppFilename, fPriority) {
        pAppFilename := pAppFilename is String ? BSTR.Alloc(pAppFilename).Value : pAppFilename

        result := ComCall(19, this, "ptr", pAppFilename, "short", fPriority, "HRESULT")
        return result
    }

    /**
     * The SetApplicationPriority method allows an application to set its priority in the handoff priority list for a particular media type or Assisted Telephony request mode, or to remove itself from the priority list.
     * @param {BSTR} pAppFilename Pointer to <b>BSTR</b> containing name of application.
     * @param {Integer} lMediaType Media associated with application.
     * @param {VARIANT_BOOL} fPriority The new priority for the application. If the value VARIANT_FALSE is passed, the application is removed from the priority list for the specified media or request mode (if it was already not present, no error is generated). If the value VARIANT_TRUE is passed, the application is inserted as the highest-priority application for the media or request mode (and removed from a lower-priority position, if it was already in the list).
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-setapplicationpriority
     */
    SetApplicationPriority(pAppFilename, lMediaType, fPriority) {
        pAppFilename := pAppFilename is String ? BSTR.Alloc(pAppFilename).Value : pAppFilename

        result := ComCall(20, this, "ptr", pAppFilename, "int", lMediaType, "short", fPriority, "HRESULT")
        return result
    }

    /**
     * The put_EventFilter method sets the event filter mask. The mask is a series of ORed members of the TAPI_EVENT enumeration.
     * @param {Integer} lFilterMask Event filter mask.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-put_eventfilter
     */
    put_EventFilter(lFilterMask) {
        result := ComCall(21, this, "int", lFilterMask, "HRESULT")
        return result
    }

    /**
     * The get_EventFilter method gets the current event filter mask. The mask is a series of ORed members of the TAPI_EVENT enumeration.
     * @returns {Integer} Pointer to the event filter mask.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi-get_eventfilter
     */
    get_EventFilter() {
        result := ComCall(22, this, "int*", &plFilterMask := 0, "HRESULT")
        return plFilterMask
    }
}
