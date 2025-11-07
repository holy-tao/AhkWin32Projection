#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAsyncResult.ahk
#Include .\IWSDEndpointProxy.ahk
#Include .\IWSDMetadataExchange.ahk

/**
 * Represents a remote WSD service for client applications and middleware.
 * @remarks
 * 
 * Service proxy objects may reside on multiple endpoints. An endpoint more completely represents a URL (contains additional useful data). For example, one endpoint may support HTTP on IPv4 addresses and another may support HTTPS on IPv6 addresses. Since the same service lives on both endpoints, it is important that the service have underlying endpoint proxy objects, with each endpoint proxy corresponding to a single endpoint at which the service is available. The endpoint proxy takes care of simple messaging requests to the service, for example, sending one-way or two-way messages.
 * 
 * <b>IWSDServiceProxy</b> objects are employed to obtain service metadata, send messages to the service through a service proxy, subscribe to events on the service, and bind to proxies that provide type-specific semantics.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsdserviceproxy
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDServiceProxy extends IWSDMetadataExchange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDServiceProxy
     * @type {Guid}
     */
    static IID => Guid("{d4c7fb9c-03ab-4175-9d67-094fafebf487}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginGetMetadata", "EndGetMetadata", "GetServiceMetadata", "SubscribeToOperation", "UnsubscribeToOperation", "SetEventingStatusCallback", "GetEndpointProxy"]

    /**
     * 
     * @returns {IWSDAsyncResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxy-begingetmetadata
     */
    BeginGetMetadata() {
        result := ComCall(4, this, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * 
     * @param {IWSDAsyncResult} pResult 
     * @returns {Pointer<WSD_METADATA_SECTION_LIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxy-endgetmetadata
     */
    EndGetMetadata(pResult) {
        result := ComCall(5, this, "ptr", pResult, "ptr*", &ppMetadata := 0, "HRESULT")
        return ppMetadata
    }

    /**
     * 
     * @returns {Pointer<WSD_SERVICE_METADATA>} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxy-getservicemetadata
     */
    GetServiceMetadata() {
        result := ComCall(6, this, "ptr*", &ppServiceMetadata := 0, "HRESULT")
        return ppServiceMetadata
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @returns {Pointer<WSDXML_ELEMENT>} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxy-subscribetooperation
     */
    SubscribeToOperation(pOperation, pUnknown, pAny) {
        result := ComCall(7, this, "ptr", pOperation, "ptr", pUnknown, "ptr", pAny, "ptr*", &ppAny := 0, "HRESULT")
        return ppAny
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxy-unsubscribetooperation
     */
    UnsubscribeToOperation(pOperation) {
        result := ComCall(8, this, "ptr", pOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWSDEventingStatus} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxy-seteventingstatuscallback
     */
    SetEventingStatusCallback(pStatus) {
        result := ComCall(9, this, "ptr", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWSDEndpointProxy} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxy-getendpointproxy
     */
    GetEndpointProxy() {
        result := ComCall(10, this, "ptr*", &ppProxy := 0, "HRESULT")
        return IWSDEndpointProxy(ppProxy)
    }
}
