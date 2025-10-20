#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetworkListManager interface provides a set of methods to perform network list management functions.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworklistmanager
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkListManager extends IDispatch{
    /**
     * The interface identifier for INetworkListManager
     * @type {Guid}
     */
    static IID => Guid("{dcb00000-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The class identifier for NetworkListManager
     * @type {Guid}
     */
    static CLSID => Guid("{dcb00c01-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<IEnumNetworks>} ppEnumNetwork 
     * @returns {HRESULT} 
     */
    GetNetworks(Flags, ppEnumNetwork) {
        result := ComCall(7, this, "int", Flags, "ptr", ppEnumNetwork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} gdNetworkId 
     * @param {Pointer<INetwork>} ppNetwork 
     * @returns {HRESULT} 
     */
    GetNetwork(gdNetworkId, ppNetwork) {
        result := ComCall(8, this, "ptr", gdNetworkId, "ptr", ppNetwork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNetworkConnections>} ppEnum 
     * @returns {HRESULT} 
     */
    GetNetworkConnections(ppEnum) {
        result := ComCall(9, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} gdNetworkConnectionId 
     * @param {Pointer<INetworkConnection>} ppNetworkConnection 
     * @returns {HRESULT} 
     */
    GetNetworkConnection(gdNetworkConnectionId, ppNetworkConnection) {
        result := ComCall(10, this, "ptr", gdNetworkConnectionId, "ptr", ppNetworkConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsConnected 
     * @returns {HRESULT} 
     */
    get_IsConnectedToInternet(pbIsConnected) {
        result := ComCall(11, this, "ptr", pbIsConnected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsConnected 
     * @returns {HRESULT} 
     */
    get_IsConnected(pbIsConnected) {
        result := ComCall(12, this, "ptr", pbIsConnected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pConnectivity 
     * @returns {HRESULT} 
     */
    GetConnectivity(pConnectivity) {
        result := ComCall(13, this, "int*", pConnectivity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<NLM_SIMULATED_PROFILE_INFO>} pSimulatedInfo 
     * @returns {HRESULT} 
     */
    SetSimulatedProfileInfo(pSimulatedInfo) {
        result := ComCall(14, this, "ptr", pSimulatedInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearSimulatedProfileInfo() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
