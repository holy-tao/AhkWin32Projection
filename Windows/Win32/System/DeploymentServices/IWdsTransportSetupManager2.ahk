#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportSetupManager.ahk

/**
 * This interface inherits from the IWdsTransportSetupManager interface and extends it. It is available beginning with Windows Server 2012.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportsetupmanager2
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportSetupManager2 extends IWdsTransportSetupManager{
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
     * 
     * @param {Pointer<UInt32>} pulTftpCapabilities 
     * @returns {HRESULT} 
     */
    get_TftpCapabilities(pulTftpCapabilities) {
        result := ComCall(12, this, "uint*", pulTftpCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportCollection>} ppProviderCollection 
     * @returns {HRESULT} 
     */
    get_ContentProviders(ppProviderCollection) {
        result := ComCall(13, this, "ptr", ppProviderCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
