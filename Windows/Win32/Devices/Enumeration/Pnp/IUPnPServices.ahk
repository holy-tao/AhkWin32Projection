#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IUPnPService.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPServices interface enumerates a collection of services.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpservices
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPServices extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPServices
     * @type {Guid}
     */
    static IID => Guid("{3f8c8e9e-9a7a-4dc8-bc41-ff31fa374956}")

    /**
     * The class identifier for UPnPServices
     * @type {Guid}
     */
    static CLSID => Guid("{c0bc4b4a-a406-4efc-932f-b8546b8100cc}")

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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservices-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {BSTR} bstrServiceId 
     * @returns {IUPnPService} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservices-get_item
     */
    get_Item(bstrServiceId) {
        bstrServiceId := bstrServiceId is String ? BSTR.Alloc(bstrServiceId).Value : bstrServiceId

        result := ComCall(9, this, "ptr", bstrServiceId, "ptr*", &ppService := 0, "HRESULT")
        return IUPnPService(ppService)
    }
}
