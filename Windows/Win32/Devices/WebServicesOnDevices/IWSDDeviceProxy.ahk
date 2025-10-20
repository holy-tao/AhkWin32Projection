#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a remote Devices Profile for Web Services (DPWS) device for client applications and middleware.
 * @remarks
 * 
  * This interface is a client-side representation of a remote device. The proxy provides basic access to device metadata (<a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_device_metadata">WSD_THIS_DEVICE_METADATA</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_this_model_metadata">WSD_THIS_MODEL_METADATA</a>), in addition to providing methods for creating service proxy objects. The service proxy objects correspond to service hosted on the device. For example, a television is a device and the tuner portion of the television is a service hosted on the device that has an accessible, atomic set of functions.
  * 
  * The <b>IWSDDeviceProxy</b> object exposes WSD-specific device semantics.
  * 
  * To use <b>IWSDDeviceProxy</b> in your client or middleware application: 
  * 
  * 
  * 
  * <ol>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-wsdcreatedeviceproxy">WSDCreateDeviceProxy</a>.</li>
  * <li>Call any of the four metadata methods of the device proxy object.</li>
  * <li>Get an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdserviceproxy">IWSDServiceProxy</a> object, either by calling <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsddeviceproxy-getserviceproxybyid">GetServiceProxyById</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsddeviceproxy-getserviceproxybytype">GetServiceProxyByType</a>.</li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsddeviceproxy
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDDeviceProxy extends IUnknown{
    /**
     * The interface identifier for IWSDDeviceProxy
     * @type {Guid}
     */
    static IID => Guid("{eee0c031-c578-4c0e-9a3b-973c35f409db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszDeviceId 
     * @param {Pointer<IWSDAddress>} pDeviceAddress 
     * @param {PWSTR} pszLocalId 
     * @param {Pointer<IWSDXMLContext>} pContext 
     * @param {Pointer<IWSDDeviceProxy>} pSponsor 
     * @returns {HRESULT} 
     */
    Init(pszDeviceId, pDeviceAddress, pszLocalId, pContext, pSponsor) {
        pszDeviceId := pszDeviceId is String ? StrPtr(pszDeviceId) : pszDeviceId
        pszLocalId := pszLocalId is String ? StrPtr(pszLocalId) : pszLocalId

        result := ComCall(3, this, "ptr", pszDeviceId, "ptr", pDeviceAddress, "ptr", pszLocalId, "ptr", pContext, "ptr", pSponsor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

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
     * @returns {HRESULT} 
     */
    EndGetMetadata(pResult) {
        result := ComCall(5, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_HOST_METADATA>} ppHostMetadata 
     * @returns {HRESULT} 
     */
    GetHostMetadata(ppHostMetadata) {
        result := ComCall(6, this, "ptr", ppHostMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_THIS_MODEL_METADATA>} ppManufacturerMetadata 
     * @returns {HRESULT} 
     */
    GetThisModelMetadata(ppManufacturerMetadata) {
        result := ComCall(7, this, "ptr", ppManufacturerMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_THIS_DEVICE_METADATA>} ppThisDeviceMetadata 
     * @returns {HRESULT} 
     */
    GetThisDeviceMetadata(ppThisDeviceMetadata) {
        result := ComCall(8, this, "ptr", ppThisDeviceMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_METADATA_SECTION_LIST>} ppMetadata 
     * @returns {HRESULT} 
     */
    GetAllMetadata(ppMetadata) {
        result := ComCall(9, this, "ptr", ppMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszServiceId 
     * @param {Pointer<IWSDServiceProxy>} ppServiceProxy 
     * @returns {HRESULT} 
     */
    GetServiceProxyById(pszServiceId, ppServiceProxy) {
        pszServiceId := pszServiceId is String ? StrPtr(pszServiceId) : pszServiceId

        result := ComCall(10, this, "ptr", pszServiceId, "ptr", ppServiceProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSDXML_NAME>} pType 
     * @param {Pointer<IWSDServiceProxy>} ppServiceProxy 
     * @returns {HRESULT} 
     */
    GetServiceProxyByType(pType, ppServiceProxy) {
        result := ComCall(11, this, "ptr", pType, "ptr", ppServiceProxy, "int")
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
        result := ComCall(12, this, "ptr", ppProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
