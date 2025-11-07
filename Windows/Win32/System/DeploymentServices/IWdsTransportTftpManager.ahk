#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * This interface provides a method to retrieve all the clients currently connected to the TFTP server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransporttftpmanager
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportTftpManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportTftpManager
     * @type {Guid}
     */
    static IID => Guid("{1327a7c8-ae8a-4fb3-8150-136227c37e9a}")

    /**
     * The class identifier for WdsTransportTftpManager
     * @type {Guid}
     */
    static CLSID => Guid("{c8e9dca2-3241-4e4d-b806-bc74019dfeda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RetrieveTftpClients"]

    /**
     * 
     * @returns {IWdsTransportCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpmanager-retrievetftpclients
     */
    RetrieveTftpClients() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportTftpClients := 0, "HRESULT")
        return IWdsTransportCollection(ppWdsTransportTftpClients)
    }
}
