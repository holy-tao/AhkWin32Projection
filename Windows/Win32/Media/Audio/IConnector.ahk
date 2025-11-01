#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-gettype
     */
    GetType(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-getdataflow
     */
    GetDataFlow(pFlow) {
        pFlowMarshal := pFlow is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pFlowMarshal, pFlow, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-isconnected
     */
    IsConnected(pbConnected) {
        result := ComCall(7, this, "ptr", pbConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IConnector>} ppConTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-getconnectedto
     */
    GetConnectedTo(ppConTo) {
        result := ComCall(8, this, "ptr*", ppConTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwstrConnectorId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-getconnectoridconnectedto
     */
    GetConnectorIdConnectedTo(ppwstrConnectorId) {
        result := ComCall(9, this, "ptr", ppwstrConnectorId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwstrDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iconnector-getdeviceidconnectedto
     */
    GetDeviceIdConnectedTo(ppwstrDeviceId) {
        result := ComCall(10, this, "ptr", ppwstrDeviceId, "HRESULT")
        return result
    }
}
