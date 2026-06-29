#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetwork.ahk" { INetwork }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IEnumNetworks interface is a standard enumerator for networks. It enumerates all networks available on the local machine. This interface can be obtained from the INetworkListManager interface.
 * @remarks
 * The list of connected or disconnected networks is cached by <b>IEnumNetworks</b> when it is instantiated. This list is not updated when the connectivity state of a network changes. The <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-inetwork">INetwork</a> interface is recommended for retrieving the current  connectivity state of a network.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-ienumnetworks
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct IEnumNetworks extends IDispatch {
    /**
     * The interface identifier for IEnumNetworks
     * @type {Guid}
     */
    static IID := Guid("{dcb00003-570f-4a9b-8d69-199fdba5723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumNetworks interfaces
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
            this.vtbl := IEnumNetworks.Vtbl()
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
     * The get_NewEnum property returns an automation enumerator object that you can use to iterate through the IEnumNetworks collection.
     * @remarks
     * In Microsoft Visual Basic and Microsoft C#, you do not need to use the corresponding _NewEnum property, because it is automatically used in the implementation of  the For Each loop (for each in Visual C#).
     * @returns {IEnumVARIANT} Contains the new instance of the implemented interface.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppEnumVar := 0, "HRESULT")
        return IEnumVARIANT(ppEnumVar)
    }

    /**
     * The Next method gets the next specified number of elements in the enumeration sequence. (IEnumNetworks.Next)
     * @param {Integer} celt Number of elements requested in the enumeration.
     * @param {Pointer<Integer>} pceltFetched Pointer to the number of elements returned.
     * @returns {INetwork} Pointer to the enumerated list of pointers returned by <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-inetwork">INetwork</a>.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return INetwork(rgelt)
    }

    /**
     * The Skip method skips over the next specified number of elements in the enumeration sequence. (IEnumNetworks.Skip)
     * @param {Integer} celt Number of elements to skip in the enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-skip
     */
    Skip(celt) {
        result := ComCall(9, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning. (IEnumNetworks.Reset)
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
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-reset
     */
    Reset() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates an enumerator that contains the same enumeration state as the enumerator currently in use. (IEnumNetworks.Clone)
     * @returns {IEnumNetworks} Pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-ienumnetworks">IEnumNetworks</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-ienumnetworks-clone
     */
    Clone() {
        result := ComCall(11, this, "ptr*", &ppEnumNetwork := 0, "HRESULT")
        return IEnumNetworks(ppEnumNetwork)
    }

    Query(iid) {
        if (IEnumNetworks.IID.Equals(iid)) {
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
