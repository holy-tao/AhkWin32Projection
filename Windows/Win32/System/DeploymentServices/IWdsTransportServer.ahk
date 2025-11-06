#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWdsTransportSetupManager.ahk
#Include .\IWdsTransportConfigurationManager.ahk
#Include .\IWdsTransportNamespaceManager.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a WDS transport server. A WDS client can use an object of this interface to manage setup, configuration, and namespace tasks on the server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportserver
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportServer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportServer
     * @type {Guid}
     */
    static IID => Guid("{09ccd093-830d-4344-a30a-73ae8e8fca90}")

    /**
     * The class identifier for WdsTransportServer
     * @type {Guid}
     */
    static CLSID => Guid("{ea19b643-4adf-4413-942c-14f379118760}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_SetupManager", "get_ConfigurationManager", "get_NamespaceManager", "DisconnectClient"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportserver-get_name
     */
    get_Name() {
        pbszName := BSTR()
        result := ComCall(7, this, "ptr", pbszName, "HRESULT")
        return pbszName
    }

    /**
     * 
     * @returns {IWdsTransportSetupManager} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportserver-get_setupmanager
     */
    get_SetupManager() {
        result := ComCall(8, this, "ptr*", &ppWdsTransportSetupManager := 0, "HRESULT")
        return IWdsTransportSetupManager(ppWdsTransportSetupManager)
    }

    /**
     * 
     * @returns {IWdsTransportConfigurationManager} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportserver-get_configurationmanager
     */
    get_ConfigurationManager() {
        result := ComCall(9, this, "ptr*", &ppWdsTransportConfigurationManager := 0, "HRESULT")
        return IWdsTransportConfigurationManager(ppWdsTransportConfigurationManager)
    }

    /**
     * 
     * @returns {IWdsTransportNamespaceManager} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportserver-get_namespacemanager
     */
    get_NamespaceManager() {
        result := ComCall(10, this, "ptr*", &ppWdsTransportNamespaceManager := 0, "HRESULT")
        return IWdsTransportNamespaceManager(ppWdsTransportNamespaceManager)
    }

    /**
     * 
     * @param {Integer} ulClientId 
     * @param {Integer} DisconnectionType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportserver-disconnectclient
     */
    DisconnectClient(ulClientId, DisconnectionType) {
        result := ComCall(11, this, "uint", ulClientId, "int", DisconnectionType, "HRESULT")
        return result
    }
}
