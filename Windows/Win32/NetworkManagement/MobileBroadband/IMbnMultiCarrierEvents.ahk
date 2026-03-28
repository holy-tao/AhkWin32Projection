#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is a notification interface used to handle asynchronous IMbnMultiCarrier method calls.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnmulticarrierevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnMultiCarrierEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnMultiCarrierEvents
     * @type {Guid}
     */
    static IID => Guid("{dcdddab6-2021-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSetHomeProviderComplete", "OnCurrentCellularClassChange", "OnPreferredProvidersChange", "OnScanNetworkComplete", "OnInterfaceCapabilityChange"]

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a SetHomeProvider operation.
     * @remarks
     * If <i>status</i> is <b>S_OK</b>, the home provider for the interface has been successfully set to the new provider by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a>. Otherwise, the original home provider is not changed and the previous states, such as connection, packet service etc, of the interface remain unchanged.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a> operation.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a> operation.
     * @param {HRESULT} _status 
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onsethomeprovidercomplete
     */
    OnSetHomeProviderComplete(mbnInterface, requestID, _status) {
        result := ComCall(3, this, "ptr", mbnInterface, "uint", requestID, "int", _status, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a GetCurrentCellularClass operation.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getcurrentcellularclass">GetCurrentCellularClass</a> operation.
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
     * The operation  was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-oncurrentcellularclasschange
     */
    OnCurrentCellularClassChange(mbnInterface) {
        result := ComCall(4, this, "ptr", mbnInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a GetPreferredProviders operation and a change in a device's preferred provider list.
     * @remarks
     * A device's preferred provider list can be updated by the network by SMS or OTA (over The air) update. The Mobile Broadband service will call this method to notify the application about any change in the preferred provider list. The application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getpreferredproviders">GetPreferredProviders</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object to get the updated list of preferred providers.
     * @param {IMbnMultiCarrier} mbnInterface <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a>
     * 
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getpreferredproviders">GetPreferredProviders</a> operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onpreferredproviderschange
     */
    OnPreferredProvidersChange(mbnInterface) {
        result := ComCall(5, this, "ptr", mbnInterface, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a ScanNetwork operation.
     * @remarks
     * If <i>status</i> is <b>S_OK</b>, the Mobile Broadband service successfully updated the cached list of visible providers. An application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-getvisibleproviders">GetVisibleProviders</a> method of the passed <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> to get the list of visible providers.
     * 
     * If multiple applications registered for notifications, then this method will be called on all registered applications. This means that an application that did not initiate the update operation will receive a notification.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork">ScanNetwork</a> operation.
     * @param {Integer} requestID The request ID assigned by the Mobile Broadband service to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork">ScanNetwork</a> operation.
     * @param {HRESULT} _status 
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onscannetworkcomplete
     */
    OnScanNetworkComplete(mbnInterface, requestID, _status) {
        result := ComCall(6, this, "ptr", mbnInterface, "uint", requestID, "int", _status, "HRESULT")
        return result
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate the completion of a SetHomeProvider operation that updates the interface capabilities.
     * @remarks
     * When a network carrier is changed due to a call to <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider">SetHomeProvider</a>, <b>OnInterfaceCapabilityChange</b>  is called when the interface capabilities are updated with the capabilities of the new carrier. An application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getinterfacecapability">GetInterfaceCapability</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> object passed to <b>SetHomeProvider</b> to get the available capability information. The <b>IMbnInterface</b> can be retrieved by calling <b>QueryInterface</b> on the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object passed to <b>OnInterfaceCapabilityChange</b>. For a list of interface capabilities, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a>.
     * @param {IMbnMultiCarrier} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnmulticarrier">IMbnMultiCarrier</a> object that represents the Mobile Broadband device.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-oninterfacecapabilitychange
     */
    OnInterfaceCapabilityChange(mbnInterface) {
        result := ComCall(7, this, "ptr", mbnInterface, "HRESULT")
        return result
    }
}
