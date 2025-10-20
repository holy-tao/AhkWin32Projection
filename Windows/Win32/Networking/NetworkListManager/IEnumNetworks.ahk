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
     * 
     * @param {Pointer<IEnumVARIANT>} ppEnumVar 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppEnumVar) {
        result := ComCall(7, this, "ptr", ppEnumVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<INetwork>} rgelt 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(8, this, "uint", celt, "ptr", rgelt, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(9, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNetworks>} ppEnumNetwork 
     * @returns {HRESULT} 
     */
    Clone(ppEnumNetwork) {
        result := ComCall(11, this, "ptr", ppEnumNetwork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
