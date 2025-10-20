#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods used for connection-management and property-retrieval for a paired MTP/Bluetooth device.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceconnectapi/nn-portabledeviceconnectapi-iportabledeviceconnector
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceConnector extends IUnknown{
    /**
     * The interface identifier for IPortableDeviceConnector
     * @type {Guid}
     */
    static IID => Guid("{625e2df8-6392-4cf0-9ad1-3cfa5f17775c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IConnectionRequestCallback>} pCallback 
     * @returns {HRESULT} 
     */
    Connect(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IConnectionRequestCallback>} pCallback 
     * @returns {HRESULT} 
     */
    Disconnect(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IConnectionRequestCallback>} pCallback 
     * @returns {HRESULT} 
     */
    Cancel(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DEVPROPKEY>} pPropertyKey 
     * @param {Pointer<UInt32>} pPropertyType 
     * @param {Pointer<Byte>} ppData 
     * @param {Pointer<UInt32>} pcbData 
     * @returns {HRESULT} 
     */
    GetProperty(pPropertyKey, pPropertyType, ppData, pcbData) {
        result := ComCall(6, this, "ptr", pPropertyKey, "uint*", pPropertyType, "char*", ppData, "uint*", pcbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DEVPROPKEY>} pPropertyKey 
     * @param {Integer} PropertyType 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    SetProperty(pPropertyKey, PropertyType, pData, cbData) {
        result := ComCall(7, this, "ptr", pPropertyKey, "uint", PropertyType, "char*", pData, "uint", cbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszPnPID 
     * @returns {HRESULT} 
     */
    GetPnPID(ppwszPnPID) {
        result := ComCall(8, this, "ptr", ppwszPnPID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
