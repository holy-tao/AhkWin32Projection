#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IEnumVARIANT.ahk
#Include .\INetworkConnection.ahk
#Include .\IEnumNetworkConnections.ahk
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
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * The get_NewEnum property returns an automation enumerator object that you can use to iterate through the IEnumNetworkConnections collection.
     * @returns {IEnumVARIANT} Contains the new instance of the implemented interface.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-ienumnetworkconnections-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppEnumVar := 0, "HRESULT")
        return IEnumVARIANT(ppEnumVar)
    }

    /**
     * The Next method gets the next specified number of elements in the enumeration sequence.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pceltFetched Pointer to the number of elements supplied. May be <b>NULL</b> if <i>celt</i> is one.
     * @returns {INetworkConnection} Pointer to a list of pointers returned  by <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-inetworkconnection">INetworkConnection</a>.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-ienumnetworkconnections-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return INetworkConnection(rgelt)
    }

    /**
     * The Skip method skips over the next specified number of elements in the enumeration sequence.
     * @param {Integer} celt Number of elements to skip over in the enumeration.
     * @returns {HRESULT} Returns S_OK if the method succeeds. Otherwise, the method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of elements skipped was not <i>celt</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-ienumnetworkconnections-skip
     */
    Skip(celt) {
        result := ComCall(9, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning.
     * @returns {HRESULT} Returns S_OK if the method succeeds. Otherwise, the method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-ienumnetworkconnections-reset
     */
    Reset() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates an enumerator that contains the same enumeration state as the enumerator currently in use.
     * @returns {IEnumNetworkConnections} Pointer to new <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-ienumnetworkconnections">IEnumNetworkConnections</a> interface instance.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-ienumnetworkconnections-clone
     */
    Clone() {
        result := ComCall(11, this, "ptr*", &ppEnumNetwork := 0, "HRESULT")
        return IEnumNetworkConnections(ppEnumNetwork)
    }
}
