#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INetworkConnectionEvents interface is a message sink interface that a client implements to get network connection-related events. Applications that are interested in lower-level events (such as authentication changes) must implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkconnectionevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkConnectionEvents extends IUnknown{
    /**
     * The interface identifier for INetworkConnectionEvents
     * @type {Guid}
     */
    static IID => Guid("{dcb00007-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} connectionId 
     * @param {Integer} newConnectivity 
     * @returns {HRESULT} 
     */
    NetworkConnectionConnectivityChanged(connectionId, newConnectivity) {
        result := ComCall(3, this, "ptr", connectionId, "int", newConnectivity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} connectionId 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    NetworkConnectionPropertyChanged(connectionId, flags) {
        result := ComCall(4, this, "ptr", connectionId, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
