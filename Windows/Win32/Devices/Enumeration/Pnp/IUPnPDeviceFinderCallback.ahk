#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPDeviceFinderCallback interface allows the UPnP framework to communicate the results of an asynchronous search to an application.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdevicefindercallback
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceFinderCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceFinderCallback
     * @type {Guid}
     */
    static IID => Guid("{415a984a-88b3-49f3-92af-0508bedf0d6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeviceAdded", "DeviceRemoved", "SearchComplete"]

    /**
     * The DeviceAdded method is invoked by the UPnP framework to notify the application that a device has been added to the network.
     * @param {Integer} lFindData Specifies the search for which the UPnP framework is returning results. The value of <i>lFindData</i> is the value returned to the caller by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @param {IUPnPDevice} pDevice Reference to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that contains the new device.
     * @returns {HRESULT} The UPnP framework does not expect the application to return any specific value; any value returned is ignored by the UPnP framework.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevicefindercallback-deviceadded
     */
    DeviceAdded(lFindData, pDevice) {
        result := ComCall(3, this, "int", lFindData, "ptr", pDevice, "HRESULT")
        return result
    }

    /**
     * The DeviceRemoved method is invoked by the UPnP framework to notify the application that a device has been removed from the network.
     * @param {Integer} lFindData Specifies the search for which the UPnP framework is returning results. The value of <i>lFindData</i> is the value returned to the caller by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @param {BSTR} bstrUDN Specifies the UDN of the device that was removed from the network.
     * @returns {HRESULT} The application should return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevicefindercallback-deviceremoved
     */
    DeviceRemoved(lFindData, bstrUDN) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(4, this, "int", lFindData, "ptr", bstrUDN, "HRESULT")
        return result
    }

    /**
     * The SearchComplete method is invoked by the UPnP framework to notify the application that the initial search for network devices has been completed.
     * @param {Integer} lFindData Specifies the search for which the UPnP framework is returning results. The value of <i>lFindData</i> is the value returned to the caller by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @returns {HRESULT} The application should return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevicefindercallback-searchcomplete
     */
    SearchComplete(lFindData) {
        result := ComCall(5, this, "int", lFindData, "HRESULT")
        return result
    }
}
