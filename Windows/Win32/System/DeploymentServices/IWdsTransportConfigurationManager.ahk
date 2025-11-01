#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IWdsTransportServicePolicy>} ppWdsTransportServicePolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-get_servicepolicy
     */
    get_ServicePolicy(ppWdsTransportServicePolicy) {
        result := ComCall(7, this, "ptr*", ppWdsTransportServicePolicy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportDiagnosticsPolicy>} ppWdsTransportDiagnosticsPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-get_diagnosticspolicy
     */
    get_DiagnosticsPolicy(ppWdsTransportDiagnosticsPolicy) {
        result := ComCall(8, this, "ptr*", ppWdsTransportDiagnosticsPolicy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRealtimeStatus 
     * @param {Pointer<VARIANT_BOOL>} pbServicesRunning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-get_wdstransportservicesrunning
     */
    get_WdsTransportServicesRunning(bRealtimeStatus, pbServicesRunning) {
        result := ComCall(9, this, "short", bRealtimeStatus, "ptr", pbServicesRunning, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-enablewdstransportservices
     */
    EnableWdsTransportServices() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-disablewdstransportservices
     */
    DisableWdsTransportServices() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-startwdstransportservices
     */
    StartWdsTransportServices() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-stopwdstransportservices
     */
    StopWdsTransportServices() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-restartwdstransportservices
     */
    RestartWdsTransportServices() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ServiceNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-notifywdstransportservices
     */
    NotifyWdsTransportServices(ServiceNotification) {
        result := ComCall(15, this, "int", ServiceNotification, "HRESULT")
        return result
    }
}
