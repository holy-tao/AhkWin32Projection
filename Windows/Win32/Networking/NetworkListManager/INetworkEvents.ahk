#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * INetworkEvents is a notification sink interface that a client implements to get network related events. These APIs are all callback functions that are called automatically when the respective events are raised.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkEvents extends IUnknown{
    /**
     * The interface identifier for INetworkEvents
     * @type {Guid}
     */
    static IID => Guid("{dcb00004-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} networkId 
     * @returns {HRESULT} 
     */
    NetworkAdded(networkId) {
        result := ComCall(3, this, "ptr", networkId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} networkId 
     * @returns {HRESULT} 
     */
    NetworkDeleted(networkId) {
        result := ComCall(4, this, "ptr", networkId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} networkId 
     * @param {Integer} newConnectivity 
     * @returns {HRESULT} 
     */
    NetworkConnectivityChanged(networkId, newConnectivity) {
        result := ComCall(5, this, "ptr", networkId, "int", newConnectivity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} networkId 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    NetworkPropertyChanged(networkId, flags) {
        result := ComCall(6, this, "ptr", networkId, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
