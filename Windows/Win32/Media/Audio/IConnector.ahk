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
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetType(pType) {
        result := ComCall(3, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFlow 
     * @returns {HRESULT} 
     */
    GetDataFlow(pFlow) {
        result := ComCall(4, this, "int*", pFlow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IConnector>} pConnectTo 
     * @returns {HRESULT} 
     */
    ConnectTo(pConnectTo) {
        result := ComCall(5, this, "ptr", pConnectTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbConnected 
     * @returns {HRESULT} 
     */
    IsConnected(pbConnected) {
        result := ComCall(7, this, "ptr", pbConnected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IConnector>} ppConTo 
     * @returns {HRESULT} 
     */
    GetConnectedTo(ppConTo) {
        result := ComCall(8, this, "ptr", ppConTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwstrConnectorId 
     * @returns {HRESULT} 
     */
    GetConnectorIdConnectedTo(ppwstrConnectorId) {
        result := ComCall(9, this, "ptr", ppwstrConnectorId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwstrDeviceId 
     * @returns {HRESULT} 
     */
    GetDeviceIdConnectedTo(ppwstrDeviceId) {
        result := ComCall(10, this, "ptr", ppwstrDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
