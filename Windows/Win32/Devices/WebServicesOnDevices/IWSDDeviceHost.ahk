#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a DPWS-compliant device.
 * @remarks
 * 
  * After retrieving this interface, the application would then:
  * 
  * <ol>
  * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-registerporttype">RegisterPortType</a> method to register all necessary port types.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-setmetadata">SetMetadata</a> to describe the device and optionally call <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-registerservice">RegisterService</a> one or more times to register services described in the service host metadata.</li>
  * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-start">Start</a> method to start the device host and to publish the device using WS-Discovery.After starting the device host, you can optionally:
  * 
  * <ol>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-adddynamicservice">AddDynamicService</a> for services not described in the service host metadata (for example, an ad hoc print job).</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-retireservice">RetireService</a> to terminate action on and disconnect a service activated by the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-registerservice">RegisterService</a> method.</li>
  * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-signalevent">SignalEvent</a> method to indicate that notifications should be sent for subscriptions relating to a particular event.</li>
  * </ol>
  * </li>
  * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-stop">Stop</a> method to terminate host execution and terminate publication of the device.</li>
  * </ol>
  * 
  * 
  * An <b>IWSDDeviceHost</b> object can provide an object for a service on demand (using a notification callback) when calling the host receives a request message directed at that service.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdhost/nn-wsdhost-iwsddevicehost
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDDeviceHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDDeviceHost
     * @type {Guid}
     */
    static IID => Guid("{917fe891-3d13-4138-9809-934c8abeb12c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "Start", "Stop", "Terminate", "RegisterPortType", "SetMetadata", "RegisterService", "RetireService", "AddDynamicService", "RemoveDynamicService", "SetServiceDiscoverable", "SignalEvent"]

    /**
     * 
     * @param {PWSTR} pszLocalId 
     * @param {IWSDXMLContext} pContext 
     * @param {Pointer<IWSDAddress>} ppHostAddresses 
     * @param {Integer} dwHostAddressCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-init
     */
    Init(pszLocalId, pContext, ppHostAddresses, dwHostAddressCount) {
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := ComCall(3, this, "ptr", pszLocalId, "ptr", pContext, "ptr*", ppHostAddresses, "uint", dwHostAddressCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullInstanceId 
     * @param {Pointer<WSD_URI_LIST>} pScopeList 
     * @param {IWSDDeviceHostNotify} pNotificationSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-start
     */
    Start(ullInstanceId, pScopeList, pNotificationSink) {
        result := ComCall(4, this, "uint", ullInstanceId, "ptr", pScopeList, "ptr", pNotificationSink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-stop
     */
    Stop() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-terminate
     */
    Terminate() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_PORT_TYPE>} pPortType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-registerporttype
     */
    RegisterPortType(pPortType) {
        result := ComCall(7, this, "ptr", pPortType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_THIS_MODEL_METADATA>} pThisModelMetadata 
     * @param {Pointer<WSD_THIS_DEVICE_METADATA>} pThisDeviceMetadata 
     * @param {Pointer<WSD_HOST_METADATA>} pHostMetadata 
     * @param {Pointer<WSD_METADATA_SECTION_LIST>} pCustomMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-setmetadata
     */
    SetMetadata(pThisModelMetadata, pThisDeviceMetadata, pHostMetadata, pCustomMetadata) {
        result := ComCall(8, this, "ptr", pThisModelMetadata, "ptr", pThisDeviceMetadata, "ptr", pHostMetadata, "ptr", pCustomMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszServiceId 
     * @param {IUnknown} pService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-registerservice
     */
    RegisterService(pszServiceId, pService) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(9, this, "ptr", pszServiceId, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszServiceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-retireservice
     */
    RetireService(pszServiceId) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(10, this, "ptr", pszServiceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszServiceId 
     * @param {PWSTR} pszEndpointAddress 
     * @param {Pointer<WSD_PORT_TYPE>} pPortType 
     * @param {Pointer<WSDXML_NAME>} pPortName 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {IUnknown} pService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-adddynamicservice
     */
    AddDynamicService(pszServiceId, pszEndpointAddress, pPortType, pPortName, pAny, pService) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId
        pszEndpointAddress := pszEndpointAddress is String ? StrPtr(pszEndpointAddress) : pszEndpointAddress

        result := ComCall(11, this, "ptr", pszServiceId, "ptr", pszEndpointAddress, "ptr", pPortType, "ptr", pPortName, "ptr", pAny, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszServiceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-removedynamicservice
     */
    RemoveDynamicService(pszServiceId) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(12, this, "ptr", pszServiceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszServiceId 
     * @param {BOOL} fDiscoverable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-setservicediscoverable
     */
    SetServiceDiscoverable(pszServiceId, fDiscoverable) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(13, this, "ptr", pszServiceId, "int", fDiscoverable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszServiceId 
     * @param {Pointer<Void>} pBody 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdhost/nf-wsdhost-iwsddevicehost-signalevent
     */
    SignalEvent(pszServiceId, pBody, pOperation) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        pBodyMarshal := pBody is VarRef ? "ptr" : "ptr"

        result := ComCall(14, this, "ptr", pszServiceId, pBodyMarshal, pBody, "ptr", pOperation, "HRESULT")
        return result
    }
}
