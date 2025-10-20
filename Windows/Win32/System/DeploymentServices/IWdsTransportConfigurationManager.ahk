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
     * 
     * @param {Pointer<IWdsTransportServicePolicy>} ppWdsTransportServicePolicy 
     * @returns {HRESULT} 
     */
    get_ServicePolicy(ppWdsTransportServicePolicy) {
        result := ComCall(7, this, "ptr", ppWdsTransportServicePolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportDiagnosticsPolicy>} ppWdsTransportDiagnosticsPolicy 
     * @returns {HRESULT} 
     */
    get_DiagnosticsPolicy(ppWdsTransportDiagnosticsPolicy) {
        result := ComCall(8, this, "ptr", ppWdsTransportDiagnosticsPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRealtimeStatus 
     * @param {Pointer<VARIANT_BOOL>} pbServicesRunning 
     * @returns {HRESULT} 
     */
    get_WdsTransportServicesRunning(bRealtimeStatus, pbServicesRunning) {
        result := ComCall(9, this, "short", bRealtimeStatus, "ptr", pbServicesRunning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableWdsTransportServices() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableWdsTransportServices() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartWdsTransportServices() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopWdsTransportServices() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestartWdsTransportServices() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ServiceNotification 
     * @returns {HRESULT} 
     */
    NotifyWdsTransportServices(ServiceNotification) {
        result := ComCall(15, this, "int", ServiceNotification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
