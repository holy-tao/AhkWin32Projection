#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * INetworkListManagerEvents is a message sink interface that a client implements to get overall machine state related events. Applications that are interested on higher-level events, for example internet connectivity, implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworklistmanagerevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkListManagerEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkListManagerEvents
     * @type {Guid}
     */
    static IID => Guid("{dcb00001-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectivityChanged"]

    /**
     * 
     * @param {Integer} newConnectivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanagerevents-connectivitychanged
     */
    ConnectivityChanged(newConnectivity) {
        result := ComCall(3, this, "int", newConnectivity, "HRESULT")
        return result
    }
}
