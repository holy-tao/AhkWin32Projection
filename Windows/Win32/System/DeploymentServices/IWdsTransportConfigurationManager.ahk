#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWdsTransportDiagnosticsPolicy.ahk" { IWdsTransportDiagnosticsPolicy }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\WDSTRANSPORT_SERVICE_NOTIFICATION.ahk" { WDSTRANSPORT_SERVICE_NOTIFICATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IWdsTransportServicePolicy.ahk" { IWdsTransportServicePolicy }

/**
 * Manages the configuration of a WDS transport server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportconfigurationmanager
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportConfigurationManager extends IDispatch {
    /**
     * The interface identifier for IWdsTransportConfigurationManager
     * @type {Guid}
     */
    static IID := Guid("{84cc4779-42dd-4792-891e-1321d6d74b44}")

    /**
     * The class identifier for WdsTransportConfigurationManager
     * @type {Guid}
     */
    static CLSID := Guid("{8743f674-904c-47ca-8512-35fe98f6b0ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportConfigurationManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ServicePolicy               : IntPtr
        get_DiagnosticsPolicy           : IntPtr
        get_WdsTransportServicesRunning : IntPtr
        EnableWdsTransportServices      : IntPtr
        DisableWdsTransportServices     : IntPtr
        StartWdsTransportServices       : IntPtr
        StopWdsTransportServices        : IntPtr
        RestartWdsTransportServices     : IntPtr
        NotifyWdsTransportServices      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportConfigurationManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-get_servicepolicy
     */
    get_ServicePolicy() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportServicePolicy := 0, "HRESULT")
        return IWdsTransportServicePolicy(ppWdsTransportServicePolicy)
    }

    /**
     * Receives an interface pointer to the Configuration Manager's Diagnostics Policy object. The object can be used to configure diagnostics settings that WDS transport server components enable for diagnostic event logging.
     * @returns {IWdsTransportDiagnosticsPolicy} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-get_diagnosticspolicy
     */
    get_DiagnosticsPolicy() {
        result := ComCall(8, this, "ptr*", &ppWdsTransportDiagnosticsPolicy := 0, "HRESULT")
        return IWdsTransportDiagnosticsPolicy(ppWdsTransportDiagnosticsPolicy)
    }

    /**
     * Receives a value that indicates whether WDS transport services are running on the server.
     * @param {VARIANT_BOOL} bRealtimeStatus 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-get_wdstransportservicesrunning
     */
    get_WdsTransportServicesRunning(bRealtimeStatus) {
        result := ComCall(9, this, VARIANT_BOOL, bRealtimeStatus, VARIANT_BOOL.Ptr, &pbServicesRunning := 0, "HRESULT")
        return pbServicesRunning
    }

    /**
     * Sets all WDS transport services to Auto-Start mode.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-enablewdstransportservices
     */
    EnableWdsTransportServices() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Sets all WDS transport services to Disabled mode.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-disablewdstransportservices
     */
    DisableWdsTransportServices() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Starts all WDS transport services. This method provides the means to change the running state of WDS transport services without changing their configuration.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-startwdstransportservices
     */
    StartWdsTransportServices() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Stops all WDS transport services. This method provides the means to change the running state of WDS transport services without changing their configuration.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-stopwdstransportservices
     */
    StopWdsTransportServices() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Stops and then restarts any WDS transport services that are running. If no services are running, the method returns with S_OK without further action.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-restartwdstransportservices
     */
    RestartWdsTransportServices() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Sends a notification to WDS transport services. The notification value is translated to the appropriate WDS transport service controls, and then these controls are sent to the appropriate services.
     * @param {WDSTRANSPORT_SERVICE_NOTIFICATION} ServiceNotification A value of the <a href="https://docs.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_service_notification">WDSTRANSPORT_SERVICE_NOTIFICATION</a> enumeration that specifies the type of service notification to be sent.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportconfigurationmanager-notifywdstransportservices
     */
    NotifyWdsTransportServices(ServiceNotification) {
        result := ComCall(15, this, WDSTRANSPORT_SERVICE_NOTIFICATION, ServiceNotification, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportConfigurationManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ServicePolicy := CallbackCreate(GetMethod(implObj, "get_ServicePolicy"), flags, 2)
        this.vtbl.get_DiagnosticsPolicy := CallbackCreate(GetMethod(implObj, "get_DiagnosticsPolicy"), flags, 2)
        this.vtbl.get_WdsTransportServicesRunning := CallbackCreate(GetMethod(implObj, "get_WdsTransportServicesRunning"), flags, 3)
        this.vtbl.EnableWdsTransportServices := CallbackCreate(GetMethod(implObj, "EnableWdsTransportServices"), flags, 1)
        this.vtbl.DisableWdsTransportServices := CallbackCreate(GetMethod(implObj, "DisableWdsTransportServices"), flags, 1)
        this.vtbl.StartWdsTransportServices := CallbackCreate(GetMethod(implObj, "StartWdsTransportServices"), flags, 1)
        this.vtbl.StopWdsTransportServices := CallbackCreate(GetMethod(implObj, "StopWdsTransportServices"), flags, 1)
        this.vtbl.RestartWdsTransportServices := CallbackCreate(GetMethod(implObj, "RestartWdsTransportServices"), flags, 1)
        this.vtbl.NotifyWdsTransportServices := CallbackCreate(GetMethod(implObj, "NotifyWdsTransportServices"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ServicePolicy)
        CallbackFree(this.vtbl.get_DiagnosticsPolicy)
        CallbackFree(this.vtbl.get_WdsTransportServicesRunning)
        CallbackFree(this.vtbl.EnableWdsTransportServices)
        CallbackFree(this.vtbl.DisableWdsTransportServices)
        CallbackFree(this.vtbl.StartWdsTransportServices)
        CallbackFree(this.vtbl.StopWdsTransportServices)
        CallbackFree(this.vtbl.RestartWdsTransportServices)
        CallbackFree(this.vtbl.NotifyWdsTransportServices)
    }
}
