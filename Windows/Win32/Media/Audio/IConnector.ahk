#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConnector.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IConnector interface represents a point of connection between components.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iconnector
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IConnector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnector
     * @type {Guid}
     */
    static IID => Guid("{9c2c4058-23f5-41de-877a-df3af236a09e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetDataFlow", "ConnectTo", "Disconnect", "IsConnected", "GetConnectedTo", "GetConnectorIdConnectedTo", "GetDeviceIdConnectedTo"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-gettype
     */
    GetType() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-getdataflow
     */
    GetDataFlow() {
        result := ComCall(4, this, "int*", &pFlow := 0, "HRESULT")
        return pFlow
    }

    /**
     * 
     * @param {IConnector} pConnectTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-connectto
     */
    ConnectTo(pConnectTo) {
        result := ComCall(5, this, "ptr", pConnectTo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-disconnect
     */
    Disconnect() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-isconnected
     */
    IsConnected() {
        result := ComCall(7, this, "int*", &pbConnected := 0, "HRESULT")
        return pbConnected
    }

    /**
     * 
     * @returns {IConnector} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-getconnectedto
     */
    GetConnectedTo() {
        result := ComCall(8, this, "ptr*", &ppConTo := 0, "HRESULT")
        return IConnector(ppConTo)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-getconnectoridconnectedto
     */
    GetConnectorIdConnectedTo() {
        result := ComCall(9, this, "ptr*", &ppwstrConnectorId := 0, "HRESULT")
        return ppwstrConnectorId
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-getdeviceidconnectedto
     */
    GetDeviceIdConnectedTo() {
        result := ComCall(10, this, "ptr*", &ppwstrDeviceId := 0, "HRESULT")
        return ppwstrDeviceId
    }
}
