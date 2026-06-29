#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDot11AdHocNetwork.ahk" { IDot11AdHocNetwork }
#Import ".\IDot11AdHocInterface.ahk" { IDot11AdHocInterface }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines the notifications supported by the IDot11AdHocManager interface.
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/nn-adhoc-idot11adhocmanagernotificationsink
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct IDot11AdHocManagerNotificationSink extends IUnknown {
    /**
     * The interface identifier for IDot11AdHocManagerNotificationSink
     * @type {Guid}
     */
    static IID := Guid("{8f10cc27-cf0d-42a0-acbe-e2de7007384d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDot11AdHocManagerNotificationSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnNetworkAdd      : IntPtr
        OnNetworkRemove   : IntPtr
        OnInterfaceAdd    : IntPtr
        OnInterfaceRemove : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDot11AdHocManagerNotificationSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the client that a new wireless ad hoc network destination is in range and available for connection.
     * @param {IDot11AdHocNetwork} pIAdHocNetwork A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocnetwork">IDot11AdHocNetwork</a> interface that represents the new network.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanagernotificationsink-onnetworkadd
     */
    OnNetworkAdd(pIAdHocNetwork) {
        result := ComCall(3, this, "ptr", pIAdHocNetwork, "HRESULT")
        return result
    }

    /**
     * Notifies the client that a wireless ad hoc network destination is no longer available for connection.
     * @param {Pointer<Guid>} Signature A pointer to a signature that uniquely identifies the newly unavailable network. For more information about signatures, see <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocnetwork-getsignature">IDot11AdHocNetwork::GetSignature</a>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanagernotificationsink-onnetworkremove
     */
    OnNetworkRemove(Signature) {
        result := ComCall(4, this, Guid.Ptr, Signature, "HRESULT")
        return result
    }

    /**
     * Notifies the client that a new network interface card (NIC) is active.
     * @param {IDot11AdHocInterface} pIAdHocInterface A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocinterface">IDot11AdHocInterface</a> interface that represents the activated NIC.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanagernotificationsink-oninterfaceadd
     */
    OnInterfaceAdd(pIAdHocInterface) {
        result := ComCall(5, this, "ptr", pIAdHocInterface, "HRESULT")
        return result
    }

    /**
     * Notifies the client that a network interface card (NIC) has become inactive.
     * @param {Pointer<Guid>} Signature A pointer to a signature that uniquely identifies the inactive NIC. For more information about signatures, see <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocinterface-getdevicesignature">IDot11AdHocInterface::GetDeviceSignature</a>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanagernotificationsink-oninterfaceremove
     */
    OnInterfaceRemove(Signature) {
        result := ComCall(6, this, Guid.Ptr, Signature, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDot11AdHocManagerNotificationSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnNetworkAdd := CallbackCreate(GetMethod(implObj, "OnNetworkAdd"), flags, 2)
        this.vtbl.OnNetworkRemove := CallbackCreate(GetMethod(implObj, "OnNetworkRemove"), flags, 2)
        this.vtbl.OnInterfaceAdd := CallbackCreate(GetMethod(implObj, "OnInterfaceAdd"), flags, 2)
        this.vtbl.OnInterfaceRemove := CallbackCreate(GetMethod(implObj, "OnInterfaceRemove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnNetworkAdd)
        CallbackFree(this.vtbl.OnNetworkRemove)
        CallbackFree(this.vtbl.OnInterfaceAdd)
        CallbackFree(this.vtbl.OnInterfaceRemove)
    }
}
