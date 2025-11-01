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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NetworkAdded", "NetworkDeleted", "NetworkConnectivityChanged", "NetworkPropertyChanged"]

    /**
     * 
     * @param {Guid} networkId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkevents-networkadded
     */
    NetworkAdded(networkId) {
        result := ComCall(3, this, "ptr", networkId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} networkId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkevents-networkdeleted
     */
    NetworkDeleted(networkId) {
        result := ComCall(4, this, "ptr", networkId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} networkId 
     * @param {Integer} newConnectivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkevents-networkconnectivitychanged
     */
    NetworkConnectivityChanged(networkId, newConnectivity) {
        result := ComCall(5, this, "ptr", networkId, "int", newConnectivity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} networkId 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkevents-networkpropertychanged
     */
    NetworkPropertyChanged(networkId, flags) {
        result := ComCall(6, this, "ptr", networkId, "int", flags, "HRESULT")
        return result
    }
}
