#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IWdsTransportContent>} ppWdsTransportContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_content
     */
    get_Content(ppWdsTransportContent) {
        result := ComCall(7, this, "ptr*", ppWdsTransportContent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_id
     */
    get_Id(pulId) {
        result := ComCall(8, this, "uint*", pulId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszNetworkInterfaceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_networkinterfacename
     */
    get_NetworkInterfaceName(pbszNetworkInterfaceName) {
        result := ComCall(9, this, "ptr", pbszNetworkInterfaceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszNetworkInterfaceAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_networkinterfaceaddress
     */
    get_NetworkInterfaceAddress(pbszNetworkInterfaceAddress) {
        result := ComCall(10, this, "ptr", pbszNetworkInterfaceAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulTransferRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_transferrate
     */
    get_TransferRate(pulTransferRate) {
        result := ComCall(11, this, "uint*", pulTransferRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulMasterClientId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-get_masterclientid
     */
    get_MasterClientId(pulMasterClientId) {
        result := ComCall(12, this, "uint*", pulMasterClientId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportCollection>} ppWdsTransportClients 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsession-retrieveclients
     */
    RetrieveClients(ppWdsTransportClients) {
        result := ComCall(13, this, "ptr*", ppWdsTransportClients, "HRESULT")
        return result
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
