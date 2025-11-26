#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IUPnPDevices.ahk
#Include .\IUPnPDevice.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPDeviceFinder interface enables an application to find a device.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdevicefinder
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceFinder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceFinder
     * @type {Guid}
     */
    static IID => Guid("{adda3d55-6f72-4319-bff9-18600a539b10}")

    /**
     * The class identifier for UPnPDeviceFinder
     * @type {Guid}
     */
    static CLSID => Guid("{e2085f28-feb7-404a-b8e7-e659bdeaaa02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindByType", "CreateAsyncFind", "StartAsyncFind", "CancelAsyncFind", "FindByUDN"]

    /**
     * The FindByType method searches synchronously for devices by device type or service type.
     * @param {BSTR} bstrTypeURI Specifies the type URI for the device or service type for which to search.
     * @param {Integer} dwFlags Must be zero. This parameter is reserved for future use.
     * @returns {IUPnPDevices} Receives a reference to a collection of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevices">IUPnPDevices</a> devices that were found.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevicefinder-findbytype
     */
    FindByType(bstrTypeURI, dwFlags) {
        bstrTypeURI := bstrTypeURI is String ? BSTR.Alloc(bstrTypeURI).Value : bstrTypeURI

        result := ComCall(7, this, "ptr", bstrTypeURI, "uint", dwFlags, "ptr*", &pDevices := 0, "HRESULT")
        return IUPnPDevices(pDevices)
    }

    /**
     * The CreateAsyncFind method creates an asynchronous search operation.
     * @param {BSTR} bstrTypeURI Specifies the uniform resource identifier (URI) for which to search.
     * @param {Integer} dwFlags Specify zero. This parameter is reserved for future use.
     * @param {IUnknown} punkDeviceFinderCallback Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface object that specifies the callback that the UPnP framework must use to communicate the results of this asynchronous search.
     * 
     * The object referred to by <i>pUnkCallback</i> must support either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefindercallback">IUPnPDeviceFinderCallback</a> interface or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface. The object referred to by <i>pUnkCallback</i> might support the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefinderaddcallbackwithinterface">IUPnPDeviceFinderAddCallbackWithInterface</a> interface, in addition to the <b>IUPnPDeviceFinderCallback</b> interface.
     * @returns {Integer} Reference to a <b>LONG</b> that receives the identifier for this particular search. The application must supply this identifier to other asynchronous search methods that are called.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevicefinder-createasyncfind
     */
    CreateAsyncFind(bstrTypeURI, dwFlags, punkDeviceFinderCallback) {
        bstrTypeURI := bstrTypeURI is String ? BSTR.Alloc(bstrTypeURI).Value : bstrTypeURI

        result := ComCall(8, this, "ptr", bstrTypeURI, "uint", dwFlags, "ptr", punkDeviceFinderCallback, "int*", &plFindData := 0, "HRESULT")
        return plFindData
    }

    /**
     * The StartAsyncFind method starts an asynchronous search operation.
     * @param {Integer} lFindData Specifies the search to start. The value of <i>lFindData</i> is the value returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevicefinder-startasyncfind
     */
    StartAsyncFind(lFindData) {
        result := ComCall(9, this, "int", lFindData, "HRESULT")
        return result
    }

    /**
     * The CancelAsyncFind method cancels an asynchronous search.
     * @param {Integer} lFindData Specifies the search to cancel. The value of <i>lFindData</i> is the value returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevicefinder-cancelasyncfind
     */
    CancelAsyncFind(lFindData) {
        result := ComCall(10, this, "int", lFindData, "HRESULT")
        return result
    }

    /**
     * The FindByUDN method searches synchronously for a device by its unique device name (UDN).
     * @param {BSTR} bstrUDN Specifies the UDN for which to search. This value is case sensitive, and should be provided as  lower-case (e.g. uuid:e8f85dfd-ff...).
     * @returns {IUPnPDevice} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that contains the requested device. Receives <b>NULL</b> if the specified device is not found.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevicefinder-findbyudn
     */
    FindByUDN(bstrUDN) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(11, this, "ptr", bstrUDN, "ptr*", &pDevice := 0, "HRESULT")
        return IUPnPDevice(pDevice)
    }
}
