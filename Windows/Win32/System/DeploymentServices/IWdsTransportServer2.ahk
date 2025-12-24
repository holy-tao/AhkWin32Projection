#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportTftpManager.ahk
#Include .\IWdsTransportServer.ahk

/**
 * This interface inherits from the IWdsTransportServer interface and extends it. It is available beginning with Windows Server 2012.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportserver2
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportServer2 extends IWdsTransportServer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportServer2
     * @type {Guid}
     */
    static IID => Guid("{256e999f-6df4-4538-81b9-857b9ab8fb47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TftpManager"]

    /**
     * @type {IWdsTransportTftpManager} 
     */
    TftpManager {
        get => this.get_TftpManager()
    }

    /**
     * Receives a pointer to the object of the IWdsTransportTftpManager interface used to manage the WDS TFTP server.
     * @returns {IWdsTransportTftpManager} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportserver2-get_tftpmanager
     */
    get_TftpManager() {
        result := ComCall(12, this, "ptr*", &ppWdsTransportTftpManager := 0, "HRESULT")
        return IWdsTransportTftpManager(ppWdsTransportTftpManager)
    }
}
