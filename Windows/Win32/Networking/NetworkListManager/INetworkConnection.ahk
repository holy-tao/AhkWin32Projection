#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetworkConnection interface represents a single network connection.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkconnection
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkConnection extends IDispatch{
    /**
     * The interface identifier for INetworkConnection
     * @type {Guid}
     */
    static IID => Guid("{dcb00005-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<INetwork>} ppNetwork 
     * @returns {HRESULT} 
     */
    GetNetwork(ppNetwork) {
        result := ComCall(7, this, "ptr", ppNetwork, "int")
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
        result := ComCall(8, this, "ptr", pbIsConnected, "int")
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
        result := ComCall(9, this, "ptr", pbIsConnected, "int")
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
        result := ComCall(10, this, "int*", pConnectivity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pgdConnectionId 
     * @returns {HRESULT} 
     */
    GetConnectionId(pgdConnectionId) {
        result := ComCall(11, this, "ptr", pgdConnectionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pgdAdapterId 
     * @returns {HRESULT} 
     */
    GetAdapterId(pgdAdapterId) {
        result := ComCall(12, this, "ptr", pgdAdapterId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDomainType 
     * @returns {HRESULT} 
     */
    GetDomainType(pDomainType) {
        result := ComCall(13, this, "int*", pDomainType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
