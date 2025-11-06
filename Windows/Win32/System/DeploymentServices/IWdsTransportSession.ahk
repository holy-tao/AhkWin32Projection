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
     * 
     * @returns {IWdsTransportContent} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_content
     */
    get_Content() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportContent := 0, "HRESULT")
        return IWdsTransportContent(ppWdsTransportContent)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "HRESULT")
        return pulId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_networkinterfacename
     */
    get_NetworkInterfaceName() {
        pbszNetworkInterfaceName := BSTR()
        result := ComCall(9, this, "ptr", pbszNetworkInterfaceName, "HRESULT")
        return pbszNetworkInterfaceName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_networkinterfaceaddress
     */
    get_NetworkInterfaceAddress() {
        pbszNetworkInterfaceAddress := BSTR()
        result := ComCall(10, this, "ptr", pbszNetworkInterfaceAddress, "HRESULT")
        return pbszNetworkInterfaceAddress
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_transferrate
     */
    get_TransferRate() {
        result := ComCall(11, this, "uint*", &pulTransferRate := 0, "HRESULT")
        return pulTransferRate
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_masterclientid
     */
    get_MasterClientId() {
        result := ComCall(12, this, "uint*", &pulMasterClientId := 0, "HRESULT")
        return pulMasterClientId
    }

    /**
     * 
     * @returns {IWdsTransportCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-retrieveclients
     */
    RetrieveClients() {
        result := ComCall(13, this, "ptr*", &ppWdsTransportClients := 0, "HRESULT")
        return IWdsTransportCollection(ppWdsTransportClients)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-terminate
     */
    Terminate() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
