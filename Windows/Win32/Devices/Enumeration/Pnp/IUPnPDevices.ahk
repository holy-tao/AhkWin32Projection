#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevices-get_count
     */
    get_Count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevices-get__newenum
     */
    get__NewEnum(ppunk) {
        result := ComCall(8, this, "ptr*", ppunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUDN 
     * @param {Pointer<IUPnPDevice>} ppDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevices-get_item
     */
    get_Item(bstrUDN, ppDevice) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(9, this, "ptr", bstrUDN, "ptr*", ppDevice, "HRESULT")
        return result
    }
}
