#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportServicePolicy.ahk
#Include .\IWdsTransportDiagnosticsPolicy.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages the configuration of a WDS transport server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportconfigurationmanager
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportConfigurationManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportConfigurationManager
     * @type {Guid}
     */
    static IID => Guid("{84cc4779-42dd-4792-891e-1321d6d74b44}")

    /**
     * The class identifier for WdsTransportConfigurationManager
     * @type {Guid}
     */
    static CLSID => Guid("{8743f674-904c-47ca-8512-35fe98f6b0ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServicePolicy", "get_DiagnosticsPolicy", "get_WdsTransportServicesRunning", "EnableWdsTransportServices", "DisableWdsTransportServices", "StartWdsTransportServices", "StopWdsTransportServices", "RestartWdsTransportServices", "NotifyWdsTransportServices"]

    /**
     * @type {IWdsTransportServicePolicy} 
     */
    ServicePolicy {
        get => this.get_ServicePolicy()
    }

    /**
     * @type {IWdsTransportDiagnosticsPolicy} 
     */
    DiagnosticsPolicy {
        get => this.get_DiagnosticsPolicy()
    }

    /**
     * Receives an interface pointer to the Configuration Manager's Service Policy object. This object can be used to configure service parameters such as the multicast IP address source and the active network profile.
     * @returns {IWdsTransportServicePolicy} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-get_servicepolicy
     */
    get_ServicePolicy() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportServicePolicy := 0, "HRESULT")
        return IWdsTransportServicePolicy(ppWdsTransportServicePolicy)
    }

    /**
     * Receives an interface pointer to the Configuration Manager's Diagnostics Policy object. The object can be used to configure diagnostics settings that WDS transport server components enable for diagnostic event logging.
     * @returns {IWdsTransportDiagnosticsPolicy} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-get_diagnosticspolicy
     */
    get_DiagnosticsPolicy() {
        result := ComCall(8, this, "ptr*", &ppWdsTransportDiagnosticsPolicy := 0, "HRESULT")
        return IWdsTransportDiagnosticsPolicy(ppWdsTransportDiagnosticsPolicy)
    }

    /**
     * Receives a value that indicates whether WDS transport services are running on the server.
     * @param {VARIANT_BOOL} bRealtimeStatus 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-get_wdstransportservicesrunning
     */
    get_WdsTransportServicesRunning(bRealtimeStatus) {
        result := ComCall(9, this, "short", bRealtimeStatus, "short*", &pbServicesRunning := 0, "HRESULT")
        return pbServicesRunning
    }

    /**
     * Sets all WDS transport services to Auto-Start mode.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-enablewdstransportservices
     */
    EnableWdsTransportServices() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Sets all WDS transport services to Disabled mode.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-disablewdstransportservices
     */
    DisableWdsTransportServices() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Starts all WDS transport services. This method provides the means to change the running state of WDS transport services without changing their configuration.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-startwdstransportservices
     */
    StartWdsTransportServices() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Stops all WDS transport services. This method provides the means to change the running state of WDS transport services without changing their configuration.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-stopwdstransportservices
     */
    StopWdsTransportServices() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Stops and then restarts any WDS transport services that are running. If no services are running, the method returns with S_OK without further action.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-restartwdstransportservices
     */
    RestartWdsTransportServices() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Sends a notification to WDS transport services. The notification value is translated to the appropriate WDS transport service controls, and then these controls are sent to the appropriate services.
     * @param {Integer} ServiceNotification A value of the <a href="https://docs.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_service_notification">WDSTRANSPORT_SERVICE_NOTIFICATION</a> enumeration that specifies the type of service notification to be sent.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-notifywdstransportservices
     */
    NotifyWdsTransportServices(ServiceNotification) {
        result := ComCall(15, this, "int", ServiceNotification, "HRESULT")
        return result
    }
}
