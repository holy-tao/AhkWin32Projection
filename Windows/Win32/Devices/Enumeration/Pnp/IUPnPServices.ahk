#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPServices interface enumerates a collection of services.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpservices
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPServices extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(7, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppunk) {
        result := ComCall(8, this, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrServiceId 
     * @param {Pointer<IUPnPService>} ppService 
     * @returns {HRESULT} 
     */
    get_Item(bstrServiceId, ppService) {
        bstrServiceId := bstrServiceId is String ? BSTR.Alloc(bstrServiceId).Value : bstrServiceId

        result := ComCall(9, this, "ptr", bstrServiceId, "ptr", ppService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
