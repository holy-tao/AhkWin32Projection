#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceServiceActivation extends IUnknown{
    /**
     * The interface identifier for IPortableDeviceServiceActivation
     * @type {Guid}
     */
    static IID => Guid("{e56b0534-d9b9-425c-9b99-75f97cb3d7c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszPnPServiceID 
     * @param {Pointer<IPortableDeviceValues>} pClientInfo 
     * @param {Pointer<IPortableDeviceServiceOpenCallback>} pCallback 
     * @returns {HRESULT} 
     */
    OpenAsync(pszPnPServiceID, pClientInfo, pCallback) {
        pszPnPServiceID := pszPnPServiceID is String ? StrPtr(pszPnPServiceID) : pszPnPServiceID

        result := ComCall(3, this, "ptr", pszPnPServiceID, "ptr", pClientInfo, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelOpenAsync() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
