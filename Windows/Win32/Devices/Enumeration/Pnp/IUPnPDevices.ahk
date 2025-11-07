#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IUPnPDevice.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPDevices interface enumerates a collection of devices.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdevices
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDevices extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDevices
     * @type {Guid}
     */
    static IID => Guid("{fdbc0c73-bda3-4c66-ac4f-f2d96fdad68c}")

    /**
     * The class identifier for UPnPDevices
     * @type {Guid}
     */
    static CLSID => Guid("{b9e84ffd-ad3c-40a4-b835-0882ebcbaaa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Item"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevices-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {BSTR} bstrUDN 
     * @returns {IUPnPDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevices-get_item
     */
    get_Item(bstrUDN) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(9, this, "ptr", bstrUDN, "ptr*", &ppDevice := 0, "HRESULT")
        return IUPnPDevice(ppDevice)
    }
}
