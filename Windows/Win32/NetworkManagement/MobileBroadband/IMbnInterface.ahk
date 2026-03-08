#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\MBN_INTERFACE_CAPS.ahk
#Include .\IMbnSubscriberInformation.ahk
#Include .\MBN_PROVIDER.ahk
#Include .\IMbnConnection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Mobile Broadband device.
 * @remarks
 * <b>IMbnInterface</b> objects are provided by calls to the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfacemanager-getinterface">GetInterface</a> and 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfacemanager-getinterfaces">GetInterfaces</a> methods of the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbninterface
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnInterface extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnInterface
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2001-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InterfaceID", "GetInterfaceCapability", "GetSubscriberInformation", "GetReadyState", "InEmergencyMode", "GetHomeProvider", "GetPreferredProviders", "SetPreferredProviders", "GetVisibleProviders", "ScanNetwork", "GetConnection"]

    /**
     * @type {BSTR} 
     */
    InterfaceID {
        get => this.get_InterfaceID()
    }

    /**
     * The interface ID.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-get_interfaceid
     */
    get_InterfaceID() {
        InterfaceID := BSTR()
        result := ComCall(3, this, "ptr", InterfaceID, "HRESULT")
        return InterfaceID
    }

    /**
     * Gets the capabilities of the device.
     * @remarks
     * The <b>GetInterfaceCapability</b> method returns the interface capabilities, including the cellular technology type, the type of support for voice calls, the type of SIM used, the frequency bands supported, and the availability of SMS support. It also returns the device manufacturer name, model, and firmware name, though these are optional and may not be filled for some of the devices. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a>.
     * @returns {MBN_INTERFACE_CAPS} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a> structure that contains the interface capabilities.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getinterfacecapability
     */
    GetInterfaceCapability() {
        interfaceCaps := MBN_INTERFACE_CAPS()
        result := ComCall(4, this, "ptr", interfaceCaps, "HRESULT")
        return interfaceCaps
    }

    /**
     * Gets the subscriber information.
     * @remarks
     * The <b>GetSubscriberInformation</b> method returns the subscriber-related information, including subscriber ID, SIM international circuit card number, and phone numbers associated with this interface.
     * 
     * When this method is called from a Windows Store app with mobile operator privileges  it will only return the SIM International circuit card number defined by   the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsubscriberinformation-get_simiccid">SimIccID</a> property.
     * 
     * Some of the values returned in subscriber information are populated only when the ready state which as reported by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getreadystate">GetReadyState</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> is <b>MBN_READY_STATE_INITIALIZED</b>. Whenever there is a change in the subscriber information associated with the Mobile Broadband device, the Mobile Broadband service will notify registered applications by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onsubscriberinformationchange">OnSubscriberInformationChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a>.
     * 
     * Subscriber information for a device will not change once the device ready state is <b>MBN_READY_STATE_INITIALIZED</b>.
     * @returns {IMbnSubscriberInformation} A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsubscriberinformation">IMbnSubscriberInformation</a> interface that contains subscriber information for the device.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getsubscriberinformation
     */
    GetSubscriberInformation() {
        result := ComCall(5, this, "ptr*", &subscriberInformation := 0, "HRESULT")
        return IMbnSubscriberInformation(subscriberInformation)
    }

    /**
     * Gets the ready state.
     * @remarks
     * The ready state specifies whether the interface is successfully initialized and is ready to perform connection operations. For SIM-based devices, a device is ready when the SIM has been initialized successfully by the device. The device can be used for connection only when the ready state is <b>MBN_READY_STATE_INITIALIZED</b>. For more information about other device states, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_ready_state">MBN_READY_STATE</a>.
     * 
     * The ready state of an interface can change as a result of a user operation. For example, when a user inserts a SIM into a device, the ready state changes from <b>MBN_READY_STATE_SIM_NOT_INSERTED</b> to another ready state. The ready state can also change because of other operations performed by the application. For example, when a PIN has been entered, the ready state can change from <b>MBN_READY_STATE_DEVICE_LOCKED</b> to another ready state. An application can register for event notifications whenever there is a change in the ready state of the interface. The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onreadystatechange">OnReadyStateChange</a> member of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a> is called to notify an application about any change in the ready state.
     * 
     * The device's SMS subsystem may not be ready when it reports <b>MBN_READY_STATE_INITIALIZED</b>.   A calling application should wait for  a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsconfigurationchange">OnSmsConfigurationChange</a> member of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a>, indicating that the SMS subsystem is ready.
     * @returns {Integer} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_ready_state">MBN_READY_STATE</a> structure.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getreadystate
     */
    GetReadyState() {
        result := ComCall(6, this, "int*", &readyState := 0, "HRESULT")
        return readyState
    }

    /**
     * Determines whether the device is in emergency mode.
     * @remarks
     * If a device cannot register on the network for any reason, then the device may automatically register onto a network in emergency mode. For example, a device cannot register on the network if the SIM is not inserted, user subscription validity expired, or roaming is not enabled for user.  In emergency mode, device can be used in limited mode for voice calls to emergency numbers.
     * @returns {VARIANT_BOOL} Points to VARIANT_TRUE if the device is in emergency mode, and VARIANT_FALSE if it is not.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-inemergencymode
     */
    InEmergencyMode() {
        result := ComCall(7, this, "short*", &emergencyMode := 0, "HRESULT")
        return emergencyMode
    }

    /**
     * Gets the home provider.
     * @remarks
     * <b>GetHomeProvider</b> returns the home provider information for the device. The <b>dataClass</b> field of returned <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structure should be ignored.
     * 
     * For the recoverable errors <b>E_MBN_PIN_REQUIRED</b>, <b>E_MBN_SIM_NOT_INSERTED</b>, and <b>E_MBN_BAD_SIM</b>, the Mobile Broadband service will query the device again for the home provider when the error condition is over. For example, if the device requires a PIN to be entered to retrieve this information, then it will return <b>E_MBN_PIN_REQUIRED</b>. When the application enters the PIN to unlock the device, then the Mobile Broadband service will again try to get this information from the device. The system will update the application about the status of new query by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onhomeprovideravailable">OnHomeProviderAvailable</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a>.
     * 
     * The registered <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onhomeprovideravailable">OnHomeProviderAvailable</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a> can be either called when home provider information is available or the new query completed with error. Once this function returns success then this information will never change.
     * @returns {MBN_PROVIDER} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structure that represents the home provider.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.  Upon completion, the calling application must free the memory allocated to the  <b>providerID</b> and <b>providerName</b> members of <b>MBN_PROVIDER</b> by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-gethomeprovider
     */
    GetHomeProvider() {
        homeProvider := MBN_PROVIDER()
        result := ComCall(8, this, "ptr", homeProvider, "HRESULT")
        return homeProvider
    }

    /**
     * Gets the list of preferred providers.
     * @remarks
     * <b>GetPreferredProviders</b> returns the list of providers that are stored in the interface's preferred provider list.
     * 
     * For the recoverable errors <b>E_MBN_PIN_REQUIRED</b>, <b>E_MBN_SIM_NOT_INSERTED</b>, and <b>E_MBN_BAD_SIM</b>, the Mobile Broadband service will query the device again for the provider list when the error condition is over. For example, if the device requires a PIN to be entered to get the provider list, then <b>GetPreferredProviders</b> will return <b>E_MBN_PIN_REQUIRED</b>. When an application enters a PIN to unlock the device, then the Mobile Broadband service will again try to get this information from the device.
     * 
     * When the operating system is querying the device to get the provider list after a recoverable error has occurred, <b>GetPreferredProviders</b> immediately returns <b>E_PENDING</b>. Once the new query has completed, a notification is sent to the calling application using the appropriate callback method.  For example, after a successful PIN unlock operation, the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinevents-onentercomplete">OnEnterComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinevents">IMbnPinEvents</a>  would be called. After recovering from a SIM card error, the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onreadystatechange">OnReadyStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a> would be called.
     * 
     * The Mobile Broadband service will update the application about the status of any new query by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onpreferredproviderschange">OnPreferredProvidersChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a>.
     * 
     * In some cases, the device's preferred provider list can be updated through the network by SMS or OTA (over-the-air update). The operating system will notify the application of any change in the preferred provider list by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onpreferredproviderschange">OnPreferredProvidersChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a>.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structures that contains the list of preferred providers.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.   When <b>GetPreferredProviders</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getpreferredproviders
     */
    GetPreferredProviders() {
        result := ComCall(9, this, "ptr*", &preferredProviders := 0, "HRESULT")
        return preferredProviders
    }

    /**
     * Updates the preferred providers list for the device.
     * @remarks
     * The <b>SetPreferredProviders</b> method initiates an update of the preferred provider list for the interface. This is an asynchronous operation, and the method call returns immediately. If this method returns successfully (with <b>S_OK</b>), then the operating system will notify the calling application about the completion status of this operation by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onsetpreferredproviderscomplete">OnSetPreferredProvidersComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a>.
     * 
     * 
     * If the device is removed from the system before this operation is complete, then there is no guarantee that the completion notification will be received by the calling application.
     * @param {Pointer<SAFEARRAY>} preferredProviders An array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structures that contains the list of preferred providers.
     * @returns {Integer} Pointer to the request ID set by the operating system for this request.  The asynchronous response will contain this same <i>requestID</i>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-setpreferredproviders
     */
    SetPreferredProviders(preferredProviders) {
        result := ComCall(10, this, "ptr", preferredProviders, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the list of visible providers.
     * @remarks
     * This method returns the list of currently visible providers.  CDMA devices will report only their home provider if any network in their preferred roaming list (PRL) is available.
     * 
     * To avoid frequent network scan operations, the operating system maintains a list of recent scan operations and the provider list is returned from the cached list.
     * 
     * An application can call this method to get a list of visible providers upon the completion of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-scannetwork">ScanNetwork</a>.
     * @param {Pointer<Integer>} age A pointer to the time in seconds since the last refresh of the visible provider list from the device.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structures that contains the list of providers for the interface.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.  Otherwise, upon completion, the calling program must free the allocated memory  by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getvisibleproviders
     */
    GetVisibleProviders(age) {
        ageMarshal := age is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, ageMarshal, age, "ptr*", &visibleProviders := 0, "HRESULT")
        return visibleProviders
    }

    /**
     * Asynchronously scans the network to get a list of visible providers.
     * @remarks
     * This method initiates a network scan operation. When completed successfully, it populates the operating system's cache of visible providers and applications can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getvisibleproviders">GetVisibleProviders</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> to get a list of visible networks.
     * 
     * This is a time consuming operation. Therefore, applications should first call <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getvisibleproviders">GetVisibleProviders</a> and should call <b>ScanNetwork</b> only when the cached information is old.
     * 
     * This is an asynchronous operation and <b>ScanNetwork</b> will return immediately. If this method returns successfully (with <b>S_OK</b>),  then upon completion of the scan operation, the operating system will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfaceevents-onscannetworkcomplete">OnScanNetworkComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfaceevents">IMbnInterfaceEvents</a> to notify the application of operation completion.
     * 
     * If the device is removed from the system before this operation is complete, there is no guarantee that the completion notification will be received by the application.
     * @returns {Integer} Pointer to the request ID set by the operating system for this request.  The asynchronous response will contain this same <i>requestID</i>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-scannetwork
     */
    ScanNetwork() {
        result := ComCall(12, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the IMbnConnection object.
     * @returns {IMbnConnection} The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getconnection
     */
    GetConnection() {
        result := ComCall(13, this, "ptr*", &mbnConnection := 0, "HRESULT")
        return IMbnConnection(mbnConnection)
    }
}
