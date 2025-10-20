#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IWSDAsyncResult>} ppResult 
     * @returns {HRESULT} 
     */
    BeginGetMetadata(ppResult) {
        result := ComCall(4, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDAsyncResult>} pResult 
     * @param {Pointer<WSD_METADATA_SECTION_LIST>} ppMetadata 
     * @returns {HRESULT} 
     */
    EndGetMetadata(pResult, ppMetadata) {
        result := ComCall(5, this, "ptr", pResult, "ptr", ppMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_SERVICE_METADATA>} ppServiceMetadata 
     * @returns {HRESULT} 
     */
    GetServiceMetadata(ppServiceMetadata) {
        result := ComCall(6, this, "ptr", ppServiceMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @param {Pointer<IUnknown>} pUnknown 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @param {Pointer<WSDXML_ELEMENT>} ppAny 
     * @returns {HRESULT} 
     */
    SubscribeToOperation(pOperation, pUnknown, pAny, ppAny) {
        result := ComCall(7, this, "ptr", pOperation, "ptr", pUnknown, "ptr", pAny, "ptr", ppAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @returns {HRESULT} 
     */
    UnsubscribeToOperation(pOperation) {
        result := ComCall(8, this, "ptr", pOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDEventingStatus>} pStatus 
     * @returns {HRESULT} 
     */
    SetEventingStatusCallback(pStatus) {
        result := ComCall(9, this, "ptr", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDEndpointProxy>} ppProxy 
     * @returns {HRESULT} 
     */
    GetEndpointProxy(ppProxy) {
        result := ComCall(10, this, "ptr", ppProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
