#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWdsTransportContent.ahk" { IWdsTransportContent }
#Import ".\IWdsTransportCollection.ahk" { IWdsTransportCollection }

/**
 * Represents an active transport session on the WDS transport server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportsession
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportSession extends IDispatch {
    /**
     * The interface identifier for IWdsTransportSession
     * @type {Guid}
     */
    static IID := Guid("{f4efea88-65b1-4f30-a4b9-2793987796fb}")

    /**
     * The class identifier for WdsTransportSession
     * @type {Guid}
     */
    static CLSID := Guid("{749ac4e0-67bc-4743-bfe5-cacb1f26f57f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportSession interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Content                 : IntPtr
        get_Id                      : IntPtr
        get_NetworkInterfaceName    : IntPtr
        get_NetworkInterfaceAddress : IntPtr
        get_TransferRate            : IntPtr
        get_MasterClientId          : IntPtr
        RetrieveClients             : IntPtr
        Terminate                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IWdsTransportContent} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BSTR} 
     */
    NetworkInterfaceName {
        get => this.get_NetworkInterfaceName()
    }

    /**
     * @type {BSTR} 
     */
    NetworkInterfaceAddress {
        get => this.get_NetworkInterfaceAddress()
    }

    /**
     * @type {Integer} 
     */
    TransferRate {
        get => this.get_TransferRate()
    }

    /**
     * @type {Integer} 
     */
    MasterClientId {
        get => this.get_MasterClientId()
    }

    /**
     * Receives a pointer to an object of the IWdsTransportContent interface that represents an active transport session on the WDS transport server.
     * @returns {IWdsTransportContent} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_content
     */
    get_Content() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportContent := 0, "HRESULT")
        return IWdsTransportContent(ppWdsTransportContent)
    }

    /**
     * Receives a unique session ID that identifies this session on the server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "HRESULT")
        return pulId
    }

    /**
     * Receives the name of the server network interface used by this transport session.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_networkinterfacename
     */
    get_NetworkInterfaceName() {
        pbszNetworkInterfaceName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbszNetworkInterfaceName, "HRESULT")
        return pbszNetworkInterfaceName
    }

    /**
     * Receives the MAC address of the server network interface used by this transport session.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_networkinterfaceaddress
     */
    get_NetworkInterfaceAddress() {
        pbszNetworkInterfaceAddress := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbszNetworkInterfaceAddress, "HRESULT")
        return pbszNetworkInterfaceAddress
    }

    /**
     * Receives the data transfer rate for this session in bytes per second.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_transferrate
     */
    get_TransferRate() {
        result := ComCall(11, this, "uint*", &pulTransferRate := 0, "HRESULT")
        return pulTransferRate
    }

    /**
     * Receives a unique client ID assigned by the WDS server that identifies the master client for this session.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_masterclientid
     */
    get_MasterClientId() {
        result := ComCall(12, this, "uint*", &pulMasterClientId := 0, "HRESULT")
        return pulMasterClientId
    }

    /**
     * Retrieves a collection of WDS clients joined to the transport session.
     * @returns {IWdsTransportCollection} A collection of objects of the <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportclient">IWdsTransportClient</a> interface joined to the transport session.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-retrieveclients
     */
    RetrieveClients() {
        result := ComCall(13, this, "ptr*", &ppWdsTransportClients := 0, "HRESULT")
        return IWdsTransportCollection(ppWdsTransportClients)
    }

    /**
     * Terminates an active session on the WDS transport server and disconnects all WDS clients joined to the session.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-terminate
     */
    Terminate() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Content := CallbackCreate(GetMethod(implObj, "get_Content"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_NetworkInterfaceName := CallbackCreate(GetMethod(implObj, "get_NetworkInterfaceName"), flags, 2)
        this.vtbl.get_NetworkInterfaceAddress := CallbackCreate(GetMethod(implObj, "get_NetworkInterfaceAddress"), flags, 2)
        this.vtbl.get_TransferRate := CallbackCreate(GetMethod(implObj, "get_TransferRate"), flags, 2)
        this.vtbl.get_MasterClientId := CallbackCreate(GetMethod(implObj, "get_MasterClientId"), flags, 2)
        this.vtbl.RetrieveClients := CallbackCreate(GetMethod(implObj, "RetrieveClients"), flags, 2)
        this.vtbl.Terminate := CallbackCreate(GetMethod(implObj, "Terminate"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Content)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_NetworkInterfaceName)
        CallbackFree(this.vtbl.get_NetworkInterfaceAddress)
        CallbackFree(this.vtbl.get_TransferRate)
        CallbackFree(this.vtbl.get_MasterClientId)
        CallbackFree(this.vtbl.RetrieveClients)
        CallbackFree(this.vtbl.Terminate)
    }
}
