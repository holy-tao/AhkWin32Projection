#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportContent.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWdsTransportCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents an active transport session on the WDS transport server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportsession
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportSession extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportSession
     * @type {Guid}
     */
    static IID => Guid("{f4efea88-65b1-4f30-a4b9-2793987796fb}")

    /**
     * The class identifier for WdsTransportSession
     * @type {Guid}
     */
    static CLSID => Guid("{749ac4e0-67bc-4743-bfe5-cacb1f26f57f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "get_Id", "get_NetworkInterfaceName", "get_NetworkInterfaceAddress", "get_TransferRate", "get_MasterClientId", "RetrieveClients", "Terminate"]

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
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_content
     */
    get_Content() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportContent := 0, "HRESULT")
        return IWdsTransportContent(ppWdsTransportContent)
    }

    /**
     * Receives a unique session ID that identifies this session on the server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "HRESULT")
        return pulId
    }

    /**
     * Receives the name of the server network interface used by this transport session.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_networkinterfacename
     */
    get_NetworkInterfaceName() {
        pbszNetworkInterfaceName := BSTR()
        result := ComCall(9, this, "ptr", pbszNetworkInterfaceName, "HRESULT")
        return pbszNetworkInterfaceName
    }

    /**
     * Receives the MAC address of the server network interface used by this transport session.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_networkinterfaceaddress
     */
    get_NetworkInterfaceAddress() {
        pbszNetworkInterfaceAddress := BSTR()
        result := ComCall(10, this, "ptr", pbszNetworkInterfaceAddress, "HRESULT")
        return pbszNetworkInterfaceAddress
    }

    /**
     * Receives the data transfer rate for this session in bytes per second.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_transferrate
     */
    get_TransferRate() {
        result := ComCall(11, this, "uint*", &pulTransferRate := 0, "HRESULT")
        return pulTransferRate
    }

    /**
     * Receives a unique client ID assigned by the WDS server that identifies the master client for this session.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_masterclientid
     */
    get_MasterClientId() {
        result := ComCall(12, this, "uint*", &pulMasterClientId := 0, "HRESULT")
        return pulMasterClientId
    }

    /**
     * Retrieves a collection of WDS clients joined to the transport session.
     * @returns {IWdsTransportCollection} A collection of objects of the <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportclient">IWdsTransportClient</a> interface joined to the transport session.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-retrieveclients
     */
    RetrieveClients() {
        result := ComCall(13, this, "ptr*", &ppWdsTransportClients := 0, "HRESULT")
        return IWdsTransportCollection(ppWdsTransportClients)
    }

    /**
     * Terminates an active session on the WDS transport server and disconnects all WDS clients joined to the session.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-terminate
     */
    Terminate() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
