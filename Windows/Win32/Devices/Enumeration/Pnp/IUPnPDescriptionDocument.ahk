#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPDescriptionDocument interface enables an application to load a device description.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdescriptiondocument
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDescriptionDocument extends IDispatch{
    /**
     * The interface identifier for IUPnPDescriptionDocument
     * @type {Guid}
     */
    static IID => Guid("{11d1c1b2-7daa-4c9e-9595-7f82ed206d1e}")

    /**
     * The class identifier for UPnPDescriptionDocument
     * @type {Guid}
     */
    static CLSID => Guid("{1d8a9b47-3a28-4ce2-8a4b-bd34e45bceeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plReadyState 
     * @returns {HRESULT} 
     */
    get_ReadyState(plReadyState) {
        result := ComCall(7, this, "int*", plReadyState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {HRESULT} 
     */
    Load(bstrUrl) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(8, this, "ptr", bstrUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<IUnknown>} punkCallback 
     * @returns {HRESULT} 
     */
    LoadAsync(bstrUrl, punkCallback) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(9, this, "ptr", bstrUrl, "ptr", punkCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} phrError 
     * @returns {HRESULT} 
     */
    get_LoadResult(phrError) {
        result := ComCall(10, this, "int*", phrError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPDevice>} ppudRootDevice 
     * @returns {HRESULT} 
     */
    RootDevice(ppudRootDevice) {
        result := ComCall(12, this, "ptr", ppudRootDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUDN 
     * @param {Pointer<IUPnPDevice>} ppudDevice 
     * @returns {HRESULT} 
     */
    DeviceByUDN(bstrUDN, ppudDevice) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(13, this, "ptr", bstrUDN, "ptr", ppudDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
