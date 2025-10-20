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
     * 
     * @param {Pointer<IWdsTransportContent>} ppWdsTransportContent 
     * @returns {HRESULT} 
     */
    get_Content(ppWdsTransportContent) {
        result := ComCall(7, this, "ptr", ppWdsTransportContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulId 
     * @returns {HRESULT} 
     */
    get_Id(pulId) {
        result := ComCall(8, this, "uint*", pulId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszNetworkInterfaceName 
     * @returns {HRESULT} 
     */
    get_NetworkInterfaceName(pbszNetworkInterfaceName) {
        result := ComCall(9, this, "ptr", pbszNetworkInterfaceName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszNetworkInterfaceAddress 
     * @returns {HRESULT} 
     */
    get_NetworkInterfaceAddress(pbszNetworkInterfaceAddress) {
        result := ComCall(10, this, "ptr", pbszNetworkInterfaceAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulTransferRate 
     * @returns {HRESULT} 
     */
    get_TransferRate(pulTransferRate) {
        result := ComCall(11, this, "uint*", pulTransferRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulMasterClientId 
     * @returns {HRESULT} 
     */
    get_MasterClientId(pulMasterClientId) {
        result := ComCall(12, this, "uint*", pulMasterClientId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportCollection>} ppWdsTransportClients 
     * @returns {HRESULT} 
     */
    RetrieveClients(ppWdsTransportClients) {
        result := ComCall(13, this, "ptr", ppWdsTransportClients, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Terminate() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
