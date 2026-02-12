#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlatformDiagnosticActionsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Manages diagnostic scenarios
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactions
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticActions extends IInspectable {
;@region Static Methods
    /**
     * Whether a scenario profile has been downloaded to the device.
     * @param {Guid} scenarioId The scenario identifier.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactions.isscenarioenabled
     */
    static IsScenarioEnabled(scenarioId) {
        if (!PlatformDiagnosticActions.HasProp("__IPlatformDiagnosticActionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticActionsStatics.IID)
            PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics := IPlatformDiagnosticActionsStatics(factoryPtr)
        }

        return PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics.IsScenarioEnabled(scenarioId)
    }

    /**
     * Try to run a scenario on demand.
     * @param {Guid} scenarioId The scenario identifier.
     * @param {Integer} escalationType The type of escalation.
     * @param {HSTRING} outputDirectory The path to the location where the diagnostic data will be stored.
     * @param {Boolean} timestampOutputDirectory *True* to have the output directory timestamp reflect when the diagnostic data is written to the directory; *false* otherwise.
     * @param {Boolean} forceEscalationUpload If the diagnostic scenario cannot be found on the device, *true* initiates an upload of the escalation scenario.
     * @param {IMapView<HSTRING, HSTRING>} triggers A dictionary of trigger and property pairs. The format is "$(T,P)=V where T is the trigger, P is the property, and V is the value. For example, {""$(T1,Filename)=c:\foo.dat"} implies that the Connected User Experience and Telemetry component will substitute c:\foo.dat in any action which specifies $(T1,FileName).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactions.tryescalatescenario
     */
    static TryEscalateScenario(scenarioId, escalationType, outputDirectory, timestampOutputDirectory, forceEscalationUpload, triggers) {
        if (!PlatformDiagnosticActions.HasProp("__IPlatformDiagnosticActionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticActionsStatics.IID)
            PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics := IPlatformDiagnosticActionsStatics(factoryPtr)
        }

        return PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics.TryEscalateScenario(scenarioId, escalationType, outputDirectory, timestampOutputDirectory, forceEscalationUpload, triggers)
    }

    /**
     * Downloads the settings that describes which diagnostic data is collected as part of the specified profile.
     * @param {HSTRING} partner The name of the partner associated with this profile.
     * @param {HSTRING} feature The name of the feature associated with this profile.
     * @param {Boolean} isScenarioNamespace *true* if this profile is associated with a scenario; *false* otherwise.
     * @param {Boolean} downloadOverCostedNetwork *true* to download settings even if the device only has access to a costed network connection; *false* otherwise.
     * @param {Boolean} downloadOverBattery *true* to download the settings even if the device is running on battery; *false*, otherwise.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactions.downloadlatestsettingsfornamespace
     */
    static DownloadLatestSettingsForNamespace(partner, feature, isScenarioNamespace, downloadOverCostedNetwork, downloadOverBattery) {
        if (!PlatformDiagnosticActions.HasProp("__IPlatformDiagnosticActionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticActionsStatics.IID)
            PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics := IPlatformDiagnosticActionsStatics(factoryPtr)
        }

        return PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics.DownloadLatestSettingsForNamespace(partner, feature, isScenarioNamespace, downloadOverCostedNetwork, downloadOverBattery)
    }

    /**
     * Get the list of scenarios that have been downloaded to the device.
     * @returns {IVectorView<Guid>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactions.getactivescenariolist
     */
    static GetActiveScenarioList() {
        if (!PlatformDiagnosticActions.HasProp("__IPlatformDiagnosticActionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticActionsStatics.IID)
            PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics := IPlatformDiagnosticActionsStatics(factoryPtr)
        }

        return PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics.GetActiveScenarioList()
    }

    /**
     * Cause diagnostic data to be uploaded within the specified parameters.
     * @param {Integer} latency 
     * @param {Boolean} uploadOverCostedNetwork True to upload even if the device only has access to a cellular data connection; false otherwise.
     * @param {Boolean} uploadOverBattery **True** to upload even if the device is running on battery; **false** otherwise.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactions.forceupload
     */
    static ForceUpload(latency, uploadOverCostedNetwork, uploadOverBattery) {
        if (!PlatformDiagnosticActions.HasProp("__IPlatformDiagnosticActionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticActionsStatics.IID)
            PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics := IPlatformDiagnosticActionsStatics(factoryPtr)
        }

        return PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics.ForceUpload(latency, uploadOverCostedNetwork, uploadOverBattery)
    }

    /**
     * Whether a trace for the specified scenario is in progress.
     * @remarks
     * Get a profile's hash from [GetKnownTraceList](platformdiagnosticactions_getknowntracelist_1006537213.md)
     * @param {Integer} slotType The slot for the scenario.
     * @param {Guid} scenarioId The scenario identifier.
     * @param {Integer} traceProfileHash The trace profile identifier.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactions.istracerunning
     */
    static IsTraceRunning(slotType, scenarioId, traceProfileHash) {
        if (!PlatformDiagnosticActions.HasProp("__IPlatformDiagnosticActionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticActionsStatics.IID)
            PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics := IPlatformDiagnosticActionsStatics(factoryPtr)
        }

        return PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics.IsTraceRunning(slotType, scenarioId, traceProfileHash)
    }

    /**
     * Returns the amount of time that a trace in the specified slot has been running.
     * @param {Integer} slotType Which slot to query.
     * @returns {PlatformDiagnosticTraceRuntimeInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactions.getactivetraceruntime
     */
    static GetActiveTraceRuntime(slotType) {
        if (!PlatformDiagnosticActions.HasProp("__IPlatformDiagnosticActionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticActionsStatics.IID)
            PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics := IPlatformDiagnosticActionsStatics(factoryPtr)
        }

        return PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics.GetActiveTraceRuntime(slotType)
    }

    /**
     * Get the list of diagnostic traces that are available on the system.
     * @param {Integer} slotType The slot for which you want a list of traces.
     * @returns {IVectorView<PlatformDiagnosticTraceInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactions.getknowntracelist
     */
    static GetKnownTraceList(slotType) {
        if (!PlatformDiagnosticActions.HasProp("__IPlatformDiagnosticActionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticActionsStatics.IID)
            PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics := IPlatformDiagnosticActionsStatics(factoryPtr)
        }

        return PlatformDiagnosticActions.__IPlatformDiagnosticActionsStatics.GetKnownTraceList(slotType)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
