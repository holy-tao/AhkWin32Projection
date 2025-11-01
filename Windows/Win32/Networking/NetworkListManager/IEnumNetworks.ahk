#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IEnumNetworks interface is a standard enumerator for networks. It enumerates all networks available on the local machine. This interface can be obtained from the INetworkListManager interface.
 * @remarks
 * 
  * The list of connected or disconnected networks is cached by <b>IEnumNetworks</b> when it is instantiated. This list is not updated when the connectivity state of a network changes. The <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-inetwork">INetwork</a> interface is recommended for retrieving the current  connectivity state of a network.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-ienumnetworks
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class IEnumNetworks extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumNetworks
     * @type {Guid}
     */
    static IID => Guid("{dcb00003-570f-4a9b-8d69-199fdba5723b}")

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
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-get__newenum
     */
    get__NewEnum(ppEnumVar) {
        result := ComCall(7, this, "ptr*", ppEnumVar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<INetwork>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-next
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(8, this, "uint", celt, "ptr*", rgelt, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-skip
     */
    Skip(celt) {
        result := ComCall(9, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-reset
     */
    Reset() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNetworks>} ppEnumNetwork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-clone
     */
    Clone(ppEnumNetwork) {
        result := ComCall(11, this, "ptr*", ppEnumNetwork, "HRESULT")
        return result
    }
}
