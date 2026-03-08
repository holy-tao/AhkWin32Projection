#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface exposes the multi-carrier functionality of a capable Mobile Broadband device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnmulticarrier
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnMultiCarrier extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnMultiCarrier
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2020-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHomeProvider", "GetPreferredProviders", "GetVisibleProviders", "GetSupportedCellularClasses", "GetCurrentCellularClass", "ScanNetwork"]

    /**
     * Updates the home provider for a multi-carrier device.
     * @remarks
     * The <b>SetHomeProvider</b> method initiates an update of the home provider for the interface. This is an asynchronous operation, and the method call returns immediately. If this method returns successfully with <b>S_OK</b>, then Windows will notify the calling application about the completion status of this operation by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onsethomeprovidercomplete">OnSetHomeProviderComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrierevents">IMbnMultiCarrierEvents</a>.
     * 
     * The device will then automatically come up registered to the new network and indicate a registration state change. The device will continue to come up registered to this new home network across Windows reboots unless <b>SetHomeProvider</b> is used again to set a new home provider.
     * 
     * If the device is removed from the system before this operation is complete, there is no guarantee that the completion notification will be received by the calling application.
     * @param {Pointer<MBN_PROVIDER2>} homeProvider An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider2">MBN_PROVIDER2</a> structure that contains the home provider.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The  <b>SignalStrength</b> and <b>SignalError</b> members must be 0.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} A pointer to the request ID set by the operating system for this request.  The asynchronous response from <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onsethomeprovidercomplete">OnSetHomeProviderComplete</a> will contain this same <i>requestID</i>.
     * 
     * Pointer to the request ID set by the operating system for this request. The asynchronous response will contain this same requestID.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider
     */
    SetHomeProvider(homeProvider) {
        result := ComCall(3, this, "ptr", homeProvider, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the list of subscribed providers visible in the current area for a multi-carrier device minus the current registered provider.
     * @remarks
     * <b>GetPreferredProviders</b> returns the list of providers that are stored in the interface's preferred provider list.
     * 
     * For the recoverable errors <b>E_MBN_PIN_REQUIRED</b>, <b>E_MBN_SIM_NOT_INSERTED</b>, and <b>E_MBN_BAD_SIM</b>, the Mobile Broadband service will query the device again for the provider list when the error condition is over. For example, if the device requires a PIN to be entered to get the provider list, then <b>GetPreferredProviders</b> will return <b>E_MBN_PIN_REQUIRED</b>. When an application enters a PIN to unlock the device, the Mobile Broadband service will again try to get this information from the device.
     * 
     * When Windows is querying the device to get the provider list after a recoverable error has occurred, <b>GetPreferredProviders</b> immediately returns <b>E_PENDING</b>. Once the new query has completed, a notification is sent to the calling application using the appropriate callback method. For example, after a successful PIN unlock operation, the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinevents-onentercomplete">OnEnterComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinevents">IMbnPinEvents</a> would be called.
     * 
     * The Mobile Broadband service will update the application about the status of any new query by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onpreferredproviderschange">OnPreferredProvidersChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a>.
     * 
     * In some cases, the device's preferred provider list can be updated through the network by SMS or OTA (over-the-air update). Windows will notify the application of any change in the preferred provider list by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onpreferredproviderschange">OnPreferredProvidersChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a>.
     * 
     * A preferred list of providers is available if the user has multiple subscriptions (at least more than one) or the device has pre-provisioned for preferred networks and is in the coverage area of any of the networks.  This list may be empty even if the user has subscribed to multiple networks and is outside of those coverage areas.   This list will contain all of the currently visible networks that the user has subscribed to or the device has pre-provisioned for except for the currently registered network.
     * 
     * Provisioning can also result in a new home provider being added to the existing preferred list on a multi-carrier device. This is accomplished using <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a>.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider2">MBN_PROVIDER2</a> structures that contain the list of preferred providers. If this method returns any value other than <b>S_OK</b>, <i>preferredMultiCarrierProviders</i> is <b>NULL</b>. When <b>GetPreferredProviders</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getpreferredproviders
     */
    GetPreferredProviders() {
        result := ComCall(4, this, "ptr*", &preferredMulticarrierProviders := 0, "HRESULT")
        return preferredMulticarrierProviders
    }

    /**
     * Gets the list of visible providers in the current area for a multi-carrier device minus preferred and registered providers.
     * @remarks
     * This method returns the list of currently visible providers. CDMA devices will report only their home provider if any network in their preferred roaming list (PRL) is available.
     * 
     * To avoid frequent network scan operations,  Windows maintains a list of recent scan operations and the provider list is returned from the cached list.
     * 
     * An application can call this method to get a list of visible providers upon the completion of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork">ScanNetwork</a>.
     * 
     * This list contains all the currently visible networks available at the user’s location excluding the ones reported by current registered provider and the list of preferred providers.  This list contains network entries that users have not subscribed to.  This list providers the user with an additional set of network choices they can potentially sign up for.
     * @param {Pointer<Integer>} age A pointer to the time, in seconds, since the last refresh of the visible provider list for the device.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider2">MBN_PROVIDER2</a> structures that contains the list of providers for the interface. If this method returns any value other than <b>S_OK</b>, <i>visibleProviders</i> is <b>NULL</b>. When <b>GetVisibleProviders</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getvisibleproviders
     */
    GetVisibleProviders(age) {
        ageMarshal := age is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ageMarshal, age, "ptr*", &visibleProviders := 0, "HRESULT")
        return visibleProviders
    }

    /**
     * Gets the list of supported cellular classes for a multi-carrier device.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_cellular_class">MBN_CELLULAR_CLASS</a> enumerations that contain the list of supported cellular classes. If this method returns any value other than <b>S_OK</b>, <i>cellularClass</i> is <b>NULL</b>. When <b>GetSupportedCellularClasses</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getsupportedcellularclasses
     */
    GetSupportedCellularClasses() {
        result := ComCall(6, this, "ptr*", &cellularClasses := 0, "HRESULT")
        return cellularClasses
    }

    /**
     * Gets the current cellular classes for a multi-carrier device.
     * @returns {Integer} <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_cellular_class">MBN_CELLULAR_CLASS</a>
     * 
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_cellular_class">MBN_CELLULAR_CLASS</a> enumeration that specifies the current cellular class. If this method returns any value other than <b>S_OK</b>, <i>currentCellularClass</i> is <b>NULL</b>. When <b>GetCurrentCellularClass</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getcurrentcellularclass
     */
    GetCurrentCellularClass() {
        result := ComCall(7, this, "int*", &currentCellularClass := 0, "HRESULT")
        return currentCellularClass
    }

    /**
     * Scans the network to get a list of visible providers for a multi-carrier device.
     * @remarks
     * This method initiates a network scan operation. When completed successfully, it populates the operating system's cache of visible providers and applications can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getvisibleproviders">GetVisibleProviders</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> to get a list of visible networks.
     * 
     * This is a time consuming operation. Therefore, applications should first call <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getvisibleproviders">GetVisibleProviders</a> and should call <b>ScanNetwork</b> only when the cached information is old.
     * 
     * This is an asynchronous operation and <b>ScanNetwork</b> will return immediately. If this method returns successfully (with <b>S_OK</b>),  then upon completion of the scan operation, the operating system will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onscannetworkcomplete">OnScanNetworkComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrierevents">IMbnMultiCarrierEvents</a> to notify the application of operation completion.
     * 
     * If the device is removed from the system before this operation is complete, there is no guarantee that the completion notification will be received by the application.
     * @returns {Integer} Pointer to the request ID set by the operating system for this request.  The asynchronous response from <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onscannetworkcomplete">OnScanNetworkComplete</a> will contain this same <i>requestID</i>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork
     */
    ScanNetwork() {
        result := ComCall(8, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
