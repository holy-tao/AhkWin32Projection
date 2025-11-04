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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "Cancel", "GetProperty", "SetProperty", "GetPnPID"]

    /**
     * 
     * @param {IConnectionRequestCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-connect
     */
    Connect(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IConnectionRequestCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-disconnect
     */
    Disconnect(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IConnectionRequestCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-cancel
     */
    Cancel(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVPROPKEY>} pPropertyKey 
     * @param {Pointer<Integer>} pPropertyType 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-getproperty
     */
    GetProperty(pPropertyKey, pPropertyType, ppData, pcbData) {
        pPropertyTypeMarshal := pPropertyType is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pPropertyKey, pPropertyTypeMarshal, pPropertyType, ppDataMarshal, ppData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVPROPKEY>} pPropertyKey 
     * @param {Integer} PropertyType 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-setproperty
     */
    SetProperty(pPropertyKey, PropertyType, pData, cbData) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pPropertyKey, "uint", PropertyType, pDataMarshal, pData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszPnPID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceconnectapi/nf-portabledeviceconnectapi-iportabledeviceconnector-getpnpid
     */
    GetPnPID(ppwszPnPID) {
        result := ComCall(8, this, "ptr", ppwszPnPID, "HRESULT")
        return result
    }
}
