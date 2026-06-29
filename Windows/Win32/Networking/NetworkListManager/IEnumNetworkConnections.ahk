#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetworkConnection.ahk" { INetworkConnection }

/**
 * The IEnumNetworkConnections interface provides a standard enumerator for network connections. It enumerates active, disconnected, or all network connections within a network. This interface can be obtained from the INetwork interface.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-ienumnetworkconnections
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct IEnumNetworkConnections extends IDispatch {
    /**
     * The interface identifier for IEnumNetworkConnections
     * @type {Guid}
     */
    static IID := Guid("{dcb00006-570f-4a9b-8d69-199fdba5723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumNetworkConnections interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        Next         : IntPtr
        Skip         : IntPtr
        Reset        : IntPtr
        Clone        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumNetworkConnections.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * The get_NewEnum property returns an automation enumerator object that you can use to iterate through the IEnumNetworkConnections collection.
     * @remarks
     * In Microsoft Visual Basic and Microsoft C#, you do not need to use the corresponding _NewEnum property, because it is automatically used in the implementation of  the For Each loop (for each in Visual C#).
     * @returns {IEnumVARIANT} Contains the new instance of the implemented interface.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppEnumVar := 0, "HRESULT")
        return IEnumVARIANT(ppEnumVar)
    }

    /**
     * The Next method gets the next specified number of elements in the enumeration sequence. (IEnumNetworkConnections.Next)
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pceltFetched Pointer to the number of elements supplied. May be <b>NULL</b> if <i>celt</i> is one.
     * @returns {INetworkConnection} Pointer to a list of pointers returned  by <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-inetworkconnection">INetworkConnection</a>.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return INetworkConnection(rgelt)
    }

    /**
     * The Skip method skips over the next specified number of elements in the enumeration sequence. (IEnumNetworkConnections.Skip)
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
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-skip
     */
    Skip(celt) {
        result := ComCall(9, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning. (IEnumNetworkConnections.Reset)
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
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-reset
     */
    Reset() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates an enumerator that contains the same enumeration state as the enumerator currently in use. (IEnumNetworkConnections.Clone)
     * @returns {IEnumNetworkConnections} Pointer to new <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-ienumnetworkconnections">IEnumNetworkConnections</a> interface instance.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworkconnections-clone
     */
    Clone() {
        result := ComCall(11, this, "ptr*", &ppEnumNetwork := 0, "HRESULT")
        return IEnumNetworkConnections(ppEnumNetwork)
    }

    Query(iid) {
        if (IEnumNetworkConnections.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
