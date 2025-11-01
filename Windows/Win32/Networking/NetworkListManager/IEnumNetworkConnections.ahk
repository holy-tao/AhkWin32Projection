#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IEnumNetworkConnections interface provides a standard enumerator for network connections. It enumerates active, disconnected, or all network connections within a network. This interface can be obtained from the INetwork interface.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-ienumnetworkconnections
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class IEnumNetworkConnections extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumNetworkConnections
     * @type {Guid}
     */
    static IID => Guid("{dcb00006-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppEnumVar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-get__newenum
     */
    get__NewEnum(ppEnumVar) {
        result := ComCall(7, this, "ptr*", ppEnumVar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<INetworkConnection>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-skip
     */
    Skip(celt) {
        result := ComCall(9, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-reset
     */
    Reset() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNetworkConnections>} ppEnumNetwork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-clone
     */
    Clone(ppEnumNetwork) {
        result := ComCall(11, this, "ptr*", ppEnumNetwork, "HRESULT")
        return result
    }
}
