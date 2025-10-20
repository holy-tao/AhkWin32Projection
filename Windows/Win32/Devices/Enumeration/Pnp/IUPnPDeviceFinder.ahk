#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPDeviceFinder interface enables an application to find a device.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdevicefinder
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceFinder extends IDispatch{
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
     * 
     * @param {BSTR} bstrTypeURI 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUPnPDevices>} pDevices 
     * @returns {HRESULT} 
     */
    FindByType(bstrTypeURI, dwFlags, pDevices) {
        bstrTypeURI := bstrTypeURI is String ? BSTR.Alloc(bstrTypeURI).Value : bstrTypeURI

        result := ComCall(7, this, "ptr", bstrTypeURI, "uint", dwFlags, "ptr", pDevices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTypeURI 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUnknown>} punkDeviceFinderCallback 
     * @param {Pointer<Int32>} plFindData 
     * @returns {HRESULT} 
     */
    CreateAsyncFind(bstrTypeURI, dwFlags, punkDeviceFinderCallback, plFindData) {
        bstrTypeURI := bstrTypeURI is String ? BSTR.Alloc(bstrTypeURI).Value : bstrTypeURI

        result := ComCall(8, this, "ptr", bstrTypeURI, "uint", dwFlags, "ptr", punkDeviceFinderCallback, "int*", plFindData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFindData 
     * @returns {HRESULT} 
     */
    StartAsyncFind(lFindData) {
        result := ComCall(9, this, "int", lFindData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFindData 
     * @returns {HRESULT} 
     */
    CancelAsyncFind(lFindData) {
        result := ComCall(10, this, "int", lFindData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUDN 
     * @param {Pointer<IUPnPDevice>} pDevice 
     * @returns {HRESULT} 
     */
    FindByUDN(bstrUDN, pDevice) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(11, this, "ptr", bstrUDN, "ptr", pDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
