#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportCollection.ahk
#Include .\IWdsTransportSetupManager.ahk

/**
 * This interface inherits from the IWdsTransportSetupManager interface and extends it. It is available beginning with Windows Server 2012.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportsetupmanager2
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportSetupManager2 extends IWdsTransportSetupManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportSetupManager2
     * @type {Guid}
     */
    static IID => Guid("{02be79da-7e9e-4366-8b6e-2aa9a91be47f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TftpCapabilities", "get_ContentProviders"]

    /**
     * @type {Integer} 
     */
    TftpCapabilities {
        get => this.get_TftpCapabilities()
    }

    /**
     * @type {IWdsTransportCollection} 
     */
    ContentProviders {
        get => this.get_ContentProviders()
    }

    /**
     * Receives a mask of WDSTRANSPORT_TFTP_CAPABILITY values that indicates which WDS TFTP features are supported by the WDS TFTP server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager2-get_tftpcapabilities
     */
    get_TftpCapabilities() {
        result := ComCall(12, this, "uint*", &pulTftpCapabilities := 0, "HRESULT")
        return pulTftpCapabilities
    }

    /**
     * Receives a pointer to an instance of the IWdsTransportCollection interface. The collection contains objects of the IWdsTransportContentProvider interface for the content providers registered on the server.
     * @returns {IWdsTransportCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager2-get_contentproviders
     */
    get_ContentProviders() {
        result := ComCall(13, this, "ptr*", &ppProviderCollection := 0, "HRESULT")
        return IWdsTransportCollection(ppProviderCollection)
    }
}
