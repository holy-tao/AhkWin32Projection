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
     * 
     * @param {Integer} lFindData 
     * @param {Pointer<IUPnPDevice>} pDevice 
     * @returns {HRESULT} 
     */
    DeviceAdded(lFindData, pDevice) {
        result := ComCall(3, this, "int", lFindData, "ptr", pDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFindData 
     * @param {BSTR} bstrUDN 
     * @returns {HRESULT} 
     */
    DeviceRemoved(lFindData, bstrUDN) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(4, this, "int", lFindData, "ptr", bstrUDN, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFindData 
     * @returns {HRESULT} 
     */
    SearchComplete(lFindData) {
        result := ComCall(5, this, "int", lFindData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
